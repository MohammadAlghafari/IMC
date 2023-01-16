import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:imc/Analytics_screen/data/repository/analytics_repository.dart';
import 'package:imc/Auth/data/local_database/auth_hive_helper.dart';
import 'package:imc/InterventionDetails/data/local_database/normal_intervention_local_database/intervention_details_drift_helper.dart';
import 'package:imc/core/constant/app_constant.dart';
import 'package:meta/meta.dart';
import 'package:get_it/get_it.dart';
import 'package:get/get.dart';
import 'package:imc/Analytics_screen/data/model/analytics_time_model.dart' as TimeModel;
part 'analytics_time_state.dart';

class AnalyticsTimeCubit extends Cubit<AnalyticsTimeState> {
  final AnalyticsRepository _analyticsRepository;
  AnalyticsTimeCubit(this._analyticsRepository) : super(AnalyticsTimeInitial());

  ///[getAnalyticsTimeData] will return time data for the passed month,year
  Future<void> getAnalyticsTimeData({required bool fetchFromApi, required String monthVal, required String yearVal}) async {
    // if month is a single digit than it will add 0 to the left Eg - "9" will become "09"
    monthVal = monthVal.padLeft(2, "0");

    //variable used to check if the passed date is user's current date or if the passed date's month is the 6th previous month
    // or passed date's month is less than the prev 6th month of  the user's current date then the analytics data will be fetched from the api.
    if (fetchFromApi) {
      try {
        emit(AnalyticsTimeDataLoading());

        TimeModel.Records? _timeData = await _analyticsRepository.getAnalyticsTime(month: monthVal, year: yearVal);
        print("analytics_time_cubit 0 =======$_timeData");

        final AnalyticsTimeTableData _analyticsTimeData = convertTimeDataToLocalTimeDataTable(_timeData, month: monthVal, year: yearVal);
        print("analytics_time_cubit 1 =======$_analyticsTimeData");
        emit(AnalyticsTimeDataLoaded(_analyticsTimeData));
      } catch (e) {
        log("analytics time data cubit error: $e");
        emit(AnalyticsTimeDataError("$e"));
      }
    }
    else {
      final _analyticsTimeDataDatabase = GetIt.I<InterventionDetailsDatabase>();
      //* checking if week data is available in local DB
      var analyticsTimeDataFromDB =
      await _analyticsTimeDataDatabase.getAnalyticsTimeDataWithDate(year: yearVal, month: monthVal, userRoleId: AuthHiveHelper.getUserRoleId);
      if (analyticsTimeDataFromDB == null) {
        //* calling the week data api and saving it's response after converting the response data to 'AnalyticsWeekTableData' model
        TimeModel.Records? _timeData = await _analyticsRepository.getAnalyticsTime(month: monthVal, year: yearVal);
        final AnalyticsTimeTableData _analyticsTimeData = convertTimeDataToLocalTimeDataTable(_timeData, month: monthVal, year: yearVal);

        _analyticsTimeDataDatabase.insertTimeDataIntoLocalDB(_analyticsTimeData);
        _analyticsTimeDataDatabase.getAllAnalyticsTimeDataFromDb().then((value) {
        });
        emit(AnalyticsTimeDataLoaded(_analyticsTimeData));
      } else {
        emit(AnalyticsTimeDataLoaded(analyticsTimeDataFromDB));
      }
    }
  }

  /// [convertTimeDataToLocalTimeDataTable] to convert the week data (type Records? model [API MODEL]) into week data(type AnalyticsWeekTableData model [LOCAL DB MODEL])
  AnalyticsTimeTableData convertTimeDataToLocalTimeDataTable(TimeModel.Records? _timeData, {required String month, required String year}) {
    // checking whether daya exists for that particular status, if not then setting as zero

    final hrsForStatus2 = _timeData?.timeKo
        ?.firstWhereOrNull((element) => element.status == InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusCode)
        ?.hours ??
        0;
    final hrsForStatus3 = _timeData?.timeSemiko
        ?.firstWhereOrNull((element) => element.status == InterventionStatus.InterventionStatusStandBy.interventionStatusCode)
        ?.hours ??
        0;
    final hrsForStatus4 = _timeData?.timeSuccess
        ?.firstWhereOrNull((element) => element.status == InterventionStatus.InterventionStatusRealisee.interventionStatusCode)
        ?.hours ??
        0;

    AnalyticsTimeTableData analyticsTimeData = AnalyticsTimeTableData(
        id: int.parse(month),
        userRoleIdLocalDB: AuthHiveHelper.getUserRoleId,
        month: month,
        year: year,
        hoursForStatus2: hrsForStatus2,
        hoursForStatus3: hrsForStatus3,
        hoursForStatus4: hrsForStatus4);

    return analyticsTimeData;
  }

  void resetCubit(){
    emit(AnalyticsTimeInitial());
  }
}