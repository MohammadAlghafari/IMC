part of 'planning_month_cubit.dart';

@immutable
abstract class PlanningMonthState {
  const PlanningMonthState();
}

class PlanningMonthInitial extends PlanningMonthState {
  const PlanningMonthInitial();
}

class PlanningMonthLoading extends PlanningMonthState {
  const PlanningMonthLoading();
}

class PlanningMonthLoaded extends PlanningMonthState {
  final List<Records?>? listOfRecords;
  const PlanningMonthLoaded(this.listOfRecords);
}

class PlanningMonthError extends PlanningMonthState {
  final String errorMessage;
  const PlanningMonthError(this.errorMessage);
}


