part of 'planning_week_cubit.dart';

@immutable
abstract class TeamLeaderPlanningWeekState {
  const TeamLeaderPlanningWeekState();
}

class TeamLeaderPlanningWeekInitial extends TeamLeaderPlanningWeekState {
  const TeamLeaderPlanningWeekInitial();
}

class TeamLeaderPlanningWeekLoading extends TeamLeaderPlanningWeekState {
  const TeamLeaderPlanningWeekLoading();
}

class TeamLeaderPlanningWeekLoaded extends TeamLeaderPlanningWeekState {
  final List<teamLeaderInterventionModel.Records?>? listOfRecords;

  TeamLeaderPlanningWeekLoaded(this.listOfRecords);
}

class TeamLeaderPlanningWeekError extends TeamLeaderPlanningWeekState {
  final String errorMessage;

  TeamLeaderPlanningWeekError(this.errorMessage);
}