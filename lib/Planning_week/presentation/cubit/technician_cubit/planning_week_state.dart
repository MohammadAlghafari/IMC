part of 'planning_week_cubit.dart';

@immutable
abstract class PlanningWeekState {
  const PlanningWeekState();
}

class PlanningWeekInitial extends PlanningWeekState {
  const PlanningWeekInitial();
}

class PlanningWeekLoading extends PlanningWeekState {
  const PlanningWeekLoading();
}

class PlanningWeekLoaded extends PlanningWeekState {
  final List<Records?>? listOfRecords;
  const PlanningWeekLoaded(this.listOfRecords);
}

class PlanningWeekError extends PlanningWeekState {
  final String errorMessage;
  const PlanningWeekError(this.errorMessage);
}


