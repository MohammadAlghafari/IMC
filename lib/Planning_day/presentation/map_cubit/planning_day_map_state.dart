part of 'planning_day_map_cubit.dart';


@immutable
abstract class PlanningDayMapState {
  const PlanningDayMapState();
}

class PlanningDayMapInitial extends PlanningDayMapState {
  const PlanningDayMapInitial();
}

class PlanningDayMapLoading extends PlanningDayMapState {
  const PlanningDayMapLoading();
}

class PlanningDayMapLoaded extends PlanningDayMapState {
  final List<Records?>? listOfRecords;
  const PlanningDayMapLoaded(this.listOfRecords);
}

class PlanningDayMapError extends PlanningDayMapState {
  final String errorMessage;
  const PlanningDayMapError(this.errorMessage);
}

