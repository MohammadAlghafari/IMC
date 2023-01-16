part of 'analytics_week_cubit.dart';

@immutable
abstract class AnalyticsWeekState {
  const AnalyticsWeekState();
}

class AnalyticsWeekDataInitial extends AnalyticsWeekState {
  const AnalyticsWeekDataInitial();
}

class AnalyticsWeekDataLoading extends AnalyticsWeekState {
  const AnalyticsWeekDataLoading();
}

class AnalyticsWeekDataLoaded extends AnalyticsWeekState {
  final AnalyticsWeekTableData weekTableData;
  AnalyticsWeekDataLoaded(this.weekTableData);
}

class AnalyticsWeekDataError extends AnalyticsWeekState {
  final String errorMessage;
  const AnalyticsWeekDataError(this.errorMessage);
}
