import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:imc/common_data_folder/intervention_data/repositories/intervention_repository.dart';
import 'package:imc/common_models/intervention_record_model.dart';
import 'package:meta/meta.dart';

part 'planning_month_state.dart';

class PlanningMonthCubit extends Cubit<PlanningMonthState> {
  final InterventionRepository _interventionRepository;
  PlanningMonthCubit(this._interventionRepository) : super(PlanningMonthInitial());

  /// [getTechnicianInterventionForDateRange] will return the list of intervention of a technician for the passed date range
  Future<void> getTechnicianInterventionForDateRange(String startDate, String endDate) async{
    try {
      emit(PlanningMonthLoading());
      List<Records?>? _listOfRecords = await _interventionRepository
          .getListOfTechnicianInterventionByDateRange(startDate, endDate);
      emit(PlanningMonthLoaded(_listOfRecords));
    }
    catch(e){
      log("planning_month_cubit_error: $e");
      emit(PlanningMonthError("${e}"));
    }
  }

  void resetCubit(){
    emit(PlanningMonthInitial());
  }
}