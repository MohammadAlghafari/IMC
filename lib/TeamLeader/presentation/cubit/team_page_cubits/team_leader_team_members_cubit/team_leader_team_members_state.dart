part of 'team_leader_team_members_cubit.dart';

@immutable
abstract class TeamLeaderTeamMembersState {}

class TeamLeaderTeamMembersInitial extends TeamLeaderTeamMembersState {}

class TeamLeaderTeamMembersLoading extends TeamLeaderTeamMembersState {}

class TeamLeaderTeamMembersLoaded extends TeamLeaderTeamMembersState {
  final List<Records?>? recordsList;
  TeamLeaderTeamMembersLoaded({required this.recordsList});
}

class TeamLeaderTeamMembersError extends TeamLeaderTeamMembersState {
  final String errorMessage;
  TeamLeaderTeamMembersError(this.errorMessage);
}