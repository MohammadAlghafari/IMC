part of 'planning_day_cubit.dart';

@immutable
abstract class TeamLeaderPlanningDayState {
  const TeamLeaderPlanningDayState();
}

class TeamLeaderPlanningDayInitial extends TeamLeaderPlanningDayState {
  const TeamLeaderPlanningDayInitial();
}

class TeamLeaderPlanningDayLoading extends TeamLeaderPlanningDayState {
  const TeamLeaderPlanningDayLoading();
}

class TeamLeaderPlanningDayLoaded extends TeamLeaderPlanningDayState {
  final List<teamLeaderInterventionModel.Records?>? listOfRecords;

  const TeamLeaderPlanningDayLoaded(this.listOfRecords);
}

class TeamLeaderPlanningDayError extends TeamLeaderPlanningDayState {
  final String errorMessage;

  const TeamLeaderPlanningDayError(this.errorMessage);
}