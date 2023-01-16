
import 'package:imc/Analytics_screen/data/model/analytics_week_model.dart' as WeekModel;
import 'package:imc/Analytics_screen/data/model/analytics_time_model.dart' as TimeModel;

abstract class AnalyticsRepository {

  ///[getAnalyticsWeek] to get analytics data for all week for given month, year
  Future<WeekModel.Records?> getAnalyticsWeek({required String month, required String year});

  ///[getAnalyticsTime] get analytics time  for given month,year
  Future<TimeModel.Records?> getAnalyticsTime({required String month, required String year});

}