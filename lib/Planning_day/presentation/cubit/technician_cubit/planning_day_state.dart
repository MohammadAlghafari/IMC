part of 'planning_day_cubit.dart';

@immutable
abstract class PlanningDayState {
  const PlanningDayState();
}

class PlanningDayInitial extends PlanningDayState {
  const PlanningDayInitial();
}

class PlanningDayLoading extends PlanningDayState {
  const PlanningDayLoading();
}

class PlanningDayLoaded extends PlanningDayState {
  final List<Records?>? listOfRecords;
  const PlanningDayLoaded(this.listOfRecords);
}

class PlanningDayError extends PlanningDayState {
  final String errorMessage;
  const PlanningDayError(this.errorMessage);
}


