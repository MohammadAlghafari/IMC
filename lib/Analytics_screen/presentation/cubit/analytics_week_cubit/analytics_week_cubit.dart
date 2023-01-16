import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:imc/Analytics_screen/data/model/analytics_week_model.dart' as WeekModel;
import 'package:imc/Analytics_screen/data/repository/analytics_repository.dart';
import 'package:imc/Auth/data/local_database/auth_hive_helper.dart';
import 'package:imc/InterventionDetails/data/local_database/normal_intervention_local_database/intervention_details_drift_helper.dart';
import 'package:meta/meta.dart';
import 'package:get/get.dart';
import '../../../../core/constant/app_constant.dart';

part 'analytics_week_state.dart';

class AnalyticsWeekCubit extends Cubit<AnalyticsWeekState> {
  final AnalyticsRepository _analyticsRepository;
  AnalyticsWeekCubit(this._analyticsRepository) : super(AnalyticsWeekDataInitial());

  ///[getAnalyticsWeekData] will return week data for the passed month
  Future<void> getAnalyticsWeekData({required bool fetchFromApi, required String monthVal, required String yearVal}) async {
    monthVal = monthVal.padLeft(2, "0");

    emit(AnalyticsWeekDataLoading());

    //variable used to check if the passed date is user's current date or if the passed date's month is the 6th previous month
    // or passed date's month is less than the prev 6th month of  the user's current date then the analytics data will be fetched from the api.
    if (fetchFromApi) {
      try {
        WeekModel.Records? _weekData = await _analyticsRepository.getAnalyticsWeek(month: monthVal, year: yearVal);
        final AnalyticsWeekTableData _analyticsWeekData = convertWeekDataToLocalWeekDataTable(_weekData, month: monthVal, year: yearVal);
        emit(AnalyticsWeekDataLoaded(_analyticsWeekData));
      } catch (e) {
        log("analytics week data cubit error: $e");
        emit(AnalyticsWeekDataError("$e"));
      }
    } else {
      try {
        final _analyticsWeekDataDatabase = GetIt.I<InterventionDetailsDatabase>();
        //* checking if week data is available in local DB
        var analyticsWeekDataFromDB = await _analyticsWeekDataDatabase.getAnalyticsWeekDataWithDate(year: yearVal, month: monthVal,userRoleId: AuthHiveHelper.getUserRoleId);
        if (analyticsWeekDataFromDB == null) {
          //* calling the week data api and saving it's response after converting the response data to 'AnalyticsWeekTableData' model
          WeekModel.Records? _weekData = await _analyticsRepository.getAnalyticsWeek(month: monthVal, year: yearVal);
          final AnalyticsWeekTableData _analyticsWeekData = convertWeekDataToLocalWeekDataTable(_weekData, month: monthVal, year: yearVal);

          _analyticsWeekDataDatabase.insertWeekDataIntoLocalDB(_analyticsWeekData);
          _analyticsWeekDataDatabase.getRCInterventionDetailsFromDb().then((value) {
            log("Analytics week data Local DATABASSE=======${_analyticsWeekData.toJson()}");
          });
          emit(AnalyticsWeekDataLoaded(_analyticsWeekData));
        } else {
          emit(AnalyticsWeekDataLoaded(analyticsWeekDataFromDB));
        }
      } catch (e) {
        log("analytics week data error: $e");
        emit(AnalyticsWeekDataError("$e"));
      }
    }
  }


  ///[convertWeekDataToLocalWeekDataTable] to convert the week data (type Records? model [API MODEL]) into week data(type AnalyticsWeekTableData model [LOCAL DB MODEL])
  AnalyticsWeekTableData convertWeekDataToLocalWeekDataTable(WeekModel.Records? _weekData, {required String month, required String year}) {
    final week1Status2 = _weekData?.week1
        ?.firstWhereOrNull((element) => element.status == InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusCode)
        ?.total ??
        0;
    final week1Status3 = _weekData?.week1
        ?.firstWhereOrNull((element) => element.status == InterventionStatus.InterventionStatusStandBy.interventionStatusCode)
        ?.total ??
        0;
    final week1Status4 = _weekData?.week1
        ?.firstWhereOrNull((element) => element.status == InterventionStatus.InterventionStatusRealisee.interventionStatusCode)
        ?.total ??
        0;
    final week2Status2 = _weekData?.week2
        ?.firstWhereOrNull((element) => element.status == InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusCode)
        ?.total ??
        0;
    final week2Status3 = _weekData?.week2
        ?.firstWhereOrNull((element) => element.status == InterventionStatus.InterventionStatusStandBy.interventionStatusCode)
        ?.total ??
        0;
    final week2Status4 = _weekData?.week2
        ?.firstWhereOrNull((element) => element.status == InterventionStatus.InterventionStatusRealisee.interventionStatusCode)
        ?.total ??
        0;
    final week3Status2 = _weekData?.week3
        ?.firstWhereOrNull((element) => element.status == InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusCode)
        ?.total ??
        0;
    final week3Status3 = _weekData?.week3
        ?.firstWhereOrNull((element) => element.status == InterventionStatus.InterventionStatusStandBy.interventionStatusCode)
        ?.total ??
        0;
    final week3Status4 = _weekData?.week3
        ?.firstWhereOrNull((element) => element.status == InterventionStatus.InterventionStatusRealisee.interventionStatusCode)
        ?.total ??
        0;
    final week4Status2 = _weekData?.week4
        ?.firstWhereOrNull((element) => element.status == InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusCode)
        ?.total ??
        0;
    final week4Status3 = _weekData?.week4
        ?.firstWhereOrNull((element) => element.status == InterventionStatus.InterventionStatusStandBy.interventionStatusCode)
        ?.total ??
        0;
    final week4Status4 = _weekData?.week4
        ?.firstWhereOrNull((element) => element.status == InterventionStatus.InterventionStatusRealisee.interventionStatusCode)
        ?.total ??
        0;

    AnalyticsWeekTableData analyticsWeekData = AnalyticsWeekTableData(
      id: int.parse(month),
      userRoleIdLocalDB: AuthHiveHelper.getUserRoleId,
      month: month,
      year: year,
      week1TotalForStatus2: week1Status2,
      week1TotalForStatus3: week1Status3,
      week1TotalForStatus4: week1Status4,
      week2TotalForStatus2: week2Status2,
      week2TotalForStatus3: week2Status3,
      week2TotalForStatus4: week2Status4,
      week3TotalForStatus2: week3Status2,
      week3TotalForStatus3: week3Status3,
      week3TotalForStatus4: week3Status4,
      week4TotalForStatus2: week4Status2,
      week4TotalForStatus3: week4Status3,
      week4TotalForStatus4: week4Status4,
    );

    return analyticsWeekData;
  }

  void resetCubit(){
    emit(AnalyticsWeekDataInitial());
  }
}