part of 'intervention_count_cubit.dart';

@immutable
abstract class InterventionCountState {}

class InterventionCountInitial extends InterventionCountState {}

class InterventionCountLoading extends InterventionCountState {}

class InterventionCountLoaded extends InterventionCountState {
  final Records? interventionsCount;

  InterventionCountLoaded(this.interventionsCount);
}

class InterventionCountError extends InterventionCountState {
  final String errorMessage;

  InterventionCountError(this.errorMessage);

}