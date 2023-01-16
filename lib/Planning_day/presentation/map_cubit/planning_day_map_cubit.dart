import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:imc/common_data_folder/intervention_data/repositories/intervention_repository.dart';
import 'package:imc/common_models/intervention_record_model.dart';
import 'package:meta/meta.dart';

part 'planning_day_map_state.dart';

class PlanningDayMapCubit extends Cubit<PlanningDayMapState> {
  final InterventionRepository _interventionRepository;
  PlanningDayMapCubit(this._interventionRepository) : super(PlanningDayMapInitial());

  /// [getListOfInterventionOnMap] will return the list of intervention of a technician to be displayed on map for a today
  Future<void> getListOfInterventionOnMap() async {
    try {
      emit(PlanningDayMapLoading());
      List<Records?>? _listOfRecords = await _interventionRepository.getInterventionListOnMaps();
      emit(PlanningDayMapLoaded(_listOfRecords));
    } on DioError {
      emit(PlanningDayMapError("A Network Error Occurred"));
    } catch (e) {
      log("planning_day_map_cubit_error: $e");
      emit(PlanningDayMapError("${e}"));
    }
  }

  void resetCubit(){
    emit(PlanningDayMapInitial());
  }
}