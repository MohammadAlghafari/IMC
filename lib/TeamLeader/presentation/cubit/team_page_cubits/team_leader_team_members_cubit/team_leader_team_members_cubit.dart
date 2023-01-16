
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:imc/TeamLeader/data/model/team_leader_team_members_model.dart';
import 'package:imc/TeamLeader/data/repository/team_leader_repository.dart';
import 'package:meta/meta.dart';

part 'team_leader_team_members_state.dart';

class TeamLeaderTeamMembersCubit extends Cubit<TeamLeaderTeamMembersState> {
  final TeamLeaderRepository _teamLeaderRepository;
  TeamLeaderTeamMembersCubit(this._teamLeaderRepository) : super(TeamLeaderTeamMembersInitial());


  List<Records?>? _listOfRecords;
  ///[getTeamLeaderTeamMembers] will get the team member records list for the team leader
  Future<void> getTeamLeaderTeamMembers() async {
    emit(TeamLeaderTeamMembersLoading());
    try {
      _listOfRecords = await _teamLeaderRepository.getTeamLeaderTeamMembers();
      emit(TeamLeaderTeamMembersLoaded(recordsList: _listOfRecords));
    } catch (e) {
      log("team_leader_team_member_cubit error : $e");
      emit(TeamLeaderTeamMembersError("$e"));
    }
  }

  void resetCubit(){
    emit(TeamLeaderTeamMembersInitial());
  }

}