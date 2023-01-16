import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:imc/TeamLeader/data/repository/team_leader_repository.dart';
import 'package:meta/meta.dart';
import 'package:imc/TeamLeader/data/model/team_member_intervention_record.dart' as teamMemberInterventionRecord;

part 'team_member_interventions_state.dart';

class TeamMemberInterventionsCubit extends Cubit<TeamMemberInterventionsState> {
  final TeamLeaderRepository _teamLeaderRepository;
  TeamMemberInterventionsCubit(this._teamLeaderRepository) : super(TeamMemberInterventionsInitial());
  List<teamMemberInterventionRecord.Records?>? _listOfRecords;

  ///[getTeamMemberInterventionsByDateRangeStatus]will get the technician's interventions records list for the passed ([startDate], [endDate], [technicienId])
  Future<void> getTeamMemberInterventionsByDateRangeStatus(String startDate, String endDate, int technicienId, List<int> listOfStatus) async {
    try {
      emit(TeamMemberInterventionsLoading());
      _listOfRecords = await _teamLeaderRepository.getListOfTeamMemberInterventionsByDateRangeAndStatus(
        startDate,
        endDate,
        listOfStatus,
        technicienId,
      );
      emit(TeamMemberInterventionsLoaded(_listOfRecords));
    } catch (e) {
      log("get team member all interventions by date range and passed status cubit ${e}");
      emit(TeamMemberInterventionsError("${e}"));
    }
  }

  ///[emptyWeekRecords] will make the team member intervention record 'empty'
  void emptyWeekRecords() {
    _listOfRecords = [];
    emit(TeamMemberInterventionsLoaded(_listOfRecords));
  }

  void resetCubit() {
    emit(TeamMemberInterventionsInitial());
  }
}

class TeamMemberTodoInterventionsCubit extends Cubit<TeamMemberInterventionsState> {
  final TeamLeaderRepository _teamLeaderRepository;
  TeamMemberTodoInterventionsCubit(this._teamLeaderRepository) : super(TeamMemberInterventionsInitial());

  List<teamMemberInterventionRecord.Records?>? _listOfRecords;

  ///[getTeamMemberTodoInterventionsByDateRangeStatus]will get the technician's interventions records list for the passed ([startDate], [endDate], [technicienId])
  Future<void> getTeamMemberTodoInterventionsByDateRangeStatus(String startDate, String endDate, int technicienId, List<int> listOfStatus) async {
    try {
      emit(TeamMemberInterventionsLoading());
      _listOfRecords = await _teamLeaderRepository.getListOfTeamMemberInterventionsByDateRangeAndStatus(
        startDate,
        endDate,
        listOfStatus,
        technicienId,
      );
      emit(TeamMemberInterventionsLoaded(_listOfRecords));
    } catch (e) {
      log(" get team member todos interventions by date range and passed status cubit ${e}");
      emit(TeamMemberInterventionsError("${e}"));
    }
  }

  void resetCubit() {
    emit(TeamMemberInterventionsInitial());
  }
}