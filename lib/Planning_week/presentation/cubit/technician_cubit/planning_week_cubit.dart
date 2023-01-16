import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:imc/common_data_folder/intervention_data/repositories/intervention_repository.dart';
import 'package:imc/common_models/intervention_record_model.dart';


part 'planning_week_state.dart';

class PlanningWeekCubit extends Cubit<PlanningWeekState> {
  final InterventionRepository _interventionRepository;
  PlanningWeekCubit(this._interventionRepository) : super(PlanningWeekInitial());

  // list of records of planning week
  List<Records?>? _listOfRecords;


  /// [getTechnicianInterventionForToWeek]  will return the list of intervention of a technician for a Week
  Future<void> getTechnicianInterventionForToWeek({required DateTime startDate, required DateTime endDate}) async{
    try {
      String _startDate = startDate.toString().substring(0,10);
      String _endDate = endDate.toString().substring(0,10);
      emit(PlanningWeekLoading());
      _listOfRecords = await _interventionRepository.getListOfTechnicianInterventionByDateRange(_startDate, _endDate);
      emit(PlanningWeekLoaded(_listOfRecords));
    }
    on DioError{
      emit(PlanningWeekError("A Network Error Occurred"));
    }
    catch(e){
      log("planning_week_cubit_error: $e");
      emit(PlanningWeekError("${e}"));
    }
  }

  ///empty the technician intervention records list
  void emptyWeekRecords(){
    _listOfRecords = [];
    emit(PlanningWeekLoaded(_listOfRecords));
  }

  void resetCubit(){
    emit(PlanningWeekInitial());
    _listOfRecords = null;
  }
}

