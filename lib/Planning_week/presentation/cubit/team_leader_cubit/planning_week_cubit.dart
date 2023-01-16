import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:imc/TeamLeader/data/repository/team_leader_repository.dart';
import 'package:meta/meta.dart';
import 'package:imc/TeamLeader/data/model/team_leader_intervention_record.dart' as teamLeaderInterventionModel;


part 'planning_week_state.dart';

class TeamLeaderPlanningWeekCubit extends Cubit<TeamLeaderPlanningWeekState> {

  final TeamLeaderRepository _teamLeaderRepository;
  TeamLeaderPlanningWeekCubit(this._teamLeaderRepository) : super(TeamLeaderPlanningWeekInitial());

  // list of records of planning week
  List<teamLeaderInterventionModel.Records?>? _listOfRecords;


  ///[getTeamLeaderVisitsForTheWeek] function will return the list of intervention of a team leader for a Week
  Future<void> getTeamLeaderVisitsForTheWeek({required DateTime startDate, required DateTime endDate, required List<int> statusList}) async{
    try {
      String _startDate = startDate.toString().substring(0,10);
      String _endDate = endDate.toString().substring(0,10);
      emit(TeamLeaderPlanningWeekLoading());
      _listOfRecords = await _teamLeaderRepository.getListOfTeamLeaderVisitsByDateRangeAndStatus(_startDate, _endDate,statusList);
      emit(TeamLeaderPlanningWeekLoaded(_listOfRecords));
    }

    catch(e){
      log("teamleader_planning_week_cubit error: $e");
      emit(TeamLeaderPlanningWeekError("${e}"));
    }
  }
  ///[emptyWeekRecords] will make the team leader intervention record 'empty'
  void emptyWeekRecords(){
    _listOfRecords = [];
    emit(TeamLeaderPlanningWeekLoaded(_listOfRecords));
  }

  void resetCubit(){
    emit(TeamLeaderPlanningWeekInitial());
    _listOfRecords = null;
  }
}