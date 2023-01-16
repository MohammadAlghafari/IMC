part of 'team_member_interventions_cubit.dart';

@immutable
abstract class TeamMemberInterventionsState {}

class TeamMemberInterventionsInitial extends TeamMemberInterventionsState {}

class TeamMemberInterventionsLoading extends TeamMemberInterventionsState {}

class TeamMemberInterventionsLoaded extends TeamMemberInterventionsState {
  final List<teamMemberInterventionRecord.Records?>? listOfRecords;

  TeamMemberInterventionsLoaded(this.listOfRecords);
}

class TeamMemberInterventionsError extends TeamMemberInterventionsState {
  final String errorMessage;

  TeamMemberInterventionsError(this.errorMessage);
}