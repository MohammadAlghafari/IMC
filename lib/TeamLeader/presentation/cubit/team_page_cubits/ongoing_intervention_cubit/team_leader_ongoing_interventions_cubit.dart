import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:imc/TeamLeader/data/model/team_leader_ongoing_intervention_model.dart';
import 'package:imc/TeamLeader/data/repository/team_leader_repository.dart';
import 'package:meta/meta.dart';

part 'team_leader_ongoing_interventions_state.dart';

class TeamLeaderOngoingInterventionsCubit extends Cubit<TeamLeaderOngoingInterventionsState> {
  TeamLeaderOngoingInterventionsCubit(this._teamLeaderRepository) : super(TeamLeaderOngoingInterventionsInitial());

  final TeamLeaderRepository _teamLeaderRepository;
  List<Records?>? _listOfRecords;

  ///[getTeamLeaderOngoingInterventions]will get the list of ongoing interventions for the team leader
  Future<void> getTeamLeaderOngoingInterventions() async {
    emit(TeamLeaderOngoingInterventionsLoading());
    try {
      _listOfRecords = await _teamLeaderRepository.getTeamLeaderOngoingInterventions();
      emit(TeamLeaderOngoingInterventionsLoaded(recordsList: _listOfRecords));
    } catch (e) {
      log("team_leader_team_member_cubit error : $e");
      emit(TeamLeaderOngoingInterventionsError(errorMessage: "$e"));
    }
  }

  void resetCubit(){
    emit(TeamLeaderOngoingInterventionsInitial());
    _listOfRecords = null;
  }
}