import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:imc/common_data_folder/intervention_data/repositories/intervention_repository.dart';
import 'package:imc/common_models/intervention_record_model.dart';
import 'package:meta/meta.dart';


part 'planning_day_state.dart';

class PlanningDayCubit extends Cubit<PlanningDayState> {
  final InterventionRepository _interventionRepository;
  PlanningDayCubit(this._interventionRepository) : super(PlanningDayInitial());

  // list of records of planning day
  List<Records?>? _listOfTodoPlanningDayRecords;

  /// [getTechnicianInterventionForToday] will return the list of intervention of a technician for a today
  Future<void> getTechnicianInterventionForToday() async {
    try {
      String _today = DateTime.now().toString().substring(0, 10);
      emit(PlanningDayLoading());

      _listOfTodoPlanningDayRecords = await _interventionRepository.getListOfTechnicianInterventionByDateRange(_today, _today);

      emit(PlanningDayLoaded(_listOfTodoPlanningDayRecords));
    } on DioError {
      emit(PlanningDayError("A Network Error Occurred"));
    } catch (e) {
      log("planning_day_cubit_error: $e");
      emit(PlanningDayError("${e}"));
    }
  }

  void resetCubit(){
    emit(PlanningDayInitial());
    _listOfTodoPlanningDayRecords = null;
  }

}


class PlanningDayCompletedInterventionCubit extends Cubit<PlanningDayState> {
  final InterventionRepository _interventionRepository;
  PlanningDayCompletedInterventionCubit(this._interventionRepository) : super(PlanningDayInitial());

  // list of completed records of planning day
  List<Records?>? _listOfCompletedPlanningDayRecordsRecords;

  ///[getCompletedTechnicianInterventionForToday] function will return the list of completed intervention of a technician for a today
  Future<void> getCompletedTechnicianInterventionForToday() async {
    try {
      String _today = DateTime.now().toString().substring(0, 10);
      emit(PlanningDayLoading());
      _listOfCompletedPlanningDayRecordsRecords = await _interventionRepository.getListOfTechnicianInterventionByDateRange(_today, _today);
      emit(PlanningDayLoaded(_listOfCompletedPlanningDayRecordsRecords));
    } on DioError {
      emit(PlanningDayError("A Network Error Occurred"));
    } catch (e) {
      log("planning_day_completed_interventin_cubit_error: $e");
      emit(PlanningDayError("${e}"));
    }
  }

  void resetCubit(){
    emit(PlanningDayInitial());
    _listOfCompletedPlanningDayRecordsRecords = null;
  }
}
