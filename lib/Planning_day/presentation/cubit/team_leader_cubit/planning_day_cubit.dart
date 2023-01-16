import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:imc/TeamLeader/data/repository/team_leader_repository.dart';
import 'package:meta/meta.dart';
import 'package:imc/TeamLeader/data/model/team_leader_intervention_record.dart' as teamLeaderInterventionModel;


part 'planning_day_state.dart';

class TeamLeaderPlanningDayCubit extends Cubit<TeamLeaderPlanningDayState> {
  final TeamLeaderRepository _teamLeaderRepository;
  TeamLeaderPlanningDayCubit(this._teamLeaderRepository) : super(TeamLeaderPlanningDayInitial());

// list of records of planning day
  List<teamLeaderInterventionModel.Records?>? _listOfTodoPlanningDayRecords;

  ///[getTeamLeaderInterventionForToday]  function will return the list of intervention of a technician for a today
  Future<void> getTeamLeaderInterventionForToday(List<int> statusList) async{
    try {
      String _today = DateTime.now().toString().substring(0,10);
      emit(TeamLeaderPlanningDayLoading());
      _listOfTodoPlanningDayRecords = await _teamLeaderRepository.getListOfTeamLeaderVisitsByDateRangeAndStatus(_today, _today,statusList );
      emit(TeamLeaderPlanningDayLoaded(_listOfTodoPlanningDayRecords));
    }
    catch(e){
      log("team_leader_planning_day_cubit_error $e");
      emit(TeamLeaderPlanningDayError("${e}"));
    }
  }


  void resetCubit(){
    emit(TeamLeaderPlanningDayInitial());
    _listOfTodoPlanningDayRecords = null;
  }
}
class TeamLeaderPlanningDayCompletedInterventionCubit extends Cubit<TeamLeaderPlanningDayState> {
  final TeamLeaderRepository _teamLeaderRepository;
  TeamLeaderPlanningDayCompletedInterventionCubit(this._teamLeaderRepository) : super(TeamLeaderPlanningDayInitial());

  // list of records of planning day
  List<teamLeaderInterventionModel.Records?>? _listOfCompletedPlanningDayRecords;

  ///[getTeamLeaderCompletedInterventionForToday]function will return the list of completed intervention of a technician for today
  Future<void> getTeamLeaderCompletedInterventionForToday(List<int> statusList) async{
    try {
      String _today = DateTime.now().toString().substring(0,10);
      emit(TeamLeaderPlanningDayLoading());
      _listOfCompletedPlanningDayRecords = await _teamLeaderRepository.getListOfTeamLeaderVisitsByDateRangeAndStatus(_today, _today,statusList );
      emit(TeamLeaderPlanningDayLoaded(_listOfCompletedPlanningDayRecords));
    }
    catch(e){
      log("team_leader_planning_day_cubit_error $e");
      emit(TeamLeaderPlanningDayError("${e}"));
    }
  }

  void resetCubit(){
    emit(TeamLeaderPlanningDayInitial());
    _listOfCompletedPlanningDayRecords = null;
  }
}