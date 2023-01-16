part of 'planning_month_cubit.dart';

@immutable
abstract class TeamLeaderPlanningMonthState {
  const TeamLeaderPlanningMonthState() : super();
}

class TeamLeaderPlanningMonthInitial extends TeamLeaderPlanningMonthState {
  const TeamLeaderPlanningMonthInitial() ;
}

class TeamLeaderPlanningMonthLoading extends TeamLeaderPlanningMonthState {
  const TeamLeaderPlanningMonthLoading();
}

class TeamLeaderPlanningMonthLoaded extends TeamLeaderPlanningMonthState {
  final List<teamLeaderInterventionModel.Records?>? listOfRecords;

  const TeamLeaderPlanningMonthLoaded(this.listOfRecords);
}

class TeamLeaderPlanningMonthError extends TeamLeaderPlanningMonthState {
  final String errorMessage;

  const TeamLeaderPlanningMonthError(this.errorMessage);
}

