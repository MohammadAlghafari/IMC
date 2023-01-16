import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:imc/Analytics_screen/data/model/analytics_time_model.dart' as TimeModel;
import 'package:imc/Analytics_screen/data/model/analytics_week_model.dart' as WeekModel;
import 'package:imc/Analytics_screen/data/repository/analytics_repository.dart';
import 'package:imc/Auth/data/local_database/auth_hive_helper.dart';
import 'package:imc/core/constant/app_constant.dart';
import 'package:imc/core/service/api_routes.dart';

class AnalyticsApiHandler implements AnalyticsRepository {
  static Dio _dio = GetIt.I<Dio>();

  @override
  Future<WeekModel.Records?> getAnalyticsWeek({required String month, required String year}) async {
    late final String url;
    final String date = "${year}-${month.padLeft(2, "0")}";
    try {
      Map<String, dynamic> body = {"date": date};

      //setting the url according to the [UserRole]
      if (AuthHiveHelper.getUserRoleId == UserRoles.TECHNICIAN_ROLE_ID) {
        url = APIRoutes.getAnalyticsWeekUrl;
      }
      if (AuthHiveHelper.getUserRoleId == UserRoles.TEAM_LEADER_ROLE_ID) {
        url = APIRoutes.getTeamLeaderAnalyticsWeekUrl;
      }
      Response response = await _dio.post(url, data: body);

      WeekModel.AnalyticsWeekModel responseWeekModel = WeekModel.AnalyticsWeekModel.fromJson(response.data);

      return responseWeekModel.records;
    } catch (e, stacktrace) {
      log("analytics_api_handler_week_stacktrace- $stacktrace");
      throw e;
    }
  }

  @override
  Future<TimeModel.Records?> getAnalyticsTime({required String month, required String year}) async {
    late final String url;
    final String date = "${year}-${month.padLeft(2, "0")}";

    try {
      Map<String, dynamic> body = {"date": date};

      //setting the url according to the [UserRole]
      if (AuthHiveHelper.getUserRoleId == UserRoles.TECHNICIAN_ROLE_ID) {
        url = APIRoutes.getAnalyticsTimeUrl;
      }
      if (AuthHiveHelper.getUserRoleId == UserRoles.TEAM_LEADER_ROLE_ID) {
        url = APIRoutes.getTeamLeaderAnalyticsTimeUrl;
      }
      Response response = await _dio.post(url, data: body);
      print("analytics_api_handler01 ===== ${response.data}");
      TimeModel.AnalyticsTimeModel responseTimeModel = TimeModel.AnalyticsTimeModel.fromJson(response.data);
      final a = TimeModel.Records.fromJson(response.data);
      print("analytics_api_handler02 === ${a.toJson()}");
      return responseTimeModel.success;
    } catch (e, stacktrace) {
      log("analytics_api_handler_time_stacktrace- $stacktrace");
      throw e;
    }
  }
}