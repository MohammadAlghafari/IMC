// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'team_leader_ongoing_interventions_cubit.dart';

@immutable
abstract class TeamLeaderOngoingInterventionsState {}

class TeamLeaderOngoingInterventionsInitial extends TeamLeaderOngoingInterventionsState {}

class TeamLeaderOngoingInterventionsLoading extends TeamLeaderOngoingInterventionsState {}

class TeamLeaderOngoingInterventionsLoaded extends TeamLeaderOngoingInterventionsState {
  final List<Records?>? recordsList;

  TeamLeaderOngoingInterventionsLoaded({required this.recordsList});
}

class TeamLeaderOngoingInterventionsError extends TeamLeaderOngoingInterventionsState {
  final String errorMessage;
  TeamLeaderOngoingInterventionsError({required this.errorMessage,});
}