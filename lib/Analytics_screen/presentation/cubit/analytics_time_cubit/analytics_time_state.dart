part of 'analytics_time_cubit.dart';

@immutable
abstract class AnalyticsTimeState {
  const AnalyticsTimeState();
}

class AnalyticsTimeInitial extends AnalyticsTimeState {
  const AnalyticsTimeInitial();
}

class AnalyticsTimeDataLoading extends AnalyticsTimeState {
  const AnalyticsTimeDataLoading();
}

class AnalyticsTimeDataLoaded extends AnalyticsTimeState {
  final AnalyticsTimeTableData timeTableData;

  AnalyticsTimeDataLoaded(this.timeTableData);
}

class AnalyticsTimeDataError extends AnalyticsTimeState {
  final String errorMessage;
  const AnalyticsTimeDataError(this.errorMessage);
}
