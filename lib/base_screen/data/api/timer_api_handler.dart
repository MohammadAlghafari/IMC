// We have the time cubit and local db for time
// When We call break time then call break time api and start timer with time remaing from api
// wehn resume then set time remaining in local db

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:imc/Auth/data/local_database/auth_hive_helper.dart';
import 'package:imc/base_screen/data/models/break_time_model.dart';
import 'package:imc/base_screen/data/repository/break_time_repository.dart';
import 'package:imc/core/constant/app_constant.dart';
import 'package:imc/core/service/api_routes.dart';

class BreakTimeApiHandler implements BreakTimeRepository {
  final Dio _dio = GetIt.I<Dio>();

  @override
  Future<BreakTimeModel> resumeWork() async {
    late final String url;
    try {
      //setting the url according to the [UserRole]
      if (AuthHiveHelper.getUserRoleId == UserRoles.TECHNICIAN_ROLE_ID) {
        url = APIRoutes.resumeBreakTimeUrl;
      }
      if (AuthHiveHelper.getUserRoleId == UserRoles.TEAM_LEADER_ROLE_ID) {
        url = APIRoutes.resumeTeamLeaderBreakTimeUrl;
      }
      Response response = await _dio.post(url);
      return BreakTimeModel.fromJson(response.data);
    } catch (e) {
      throw Exception("An Error Occurred!");
    }
  }

  @override
  Future<BreakTimeModel> startBreakTimer() async {
    late final String url;
    try {
      //setting the url according to the [UserRole]
      if (AuthHiveHelper.getUserRoleId == UserRoles.TECHNICIAN_ROLE_ID) {
        url = APIRoutes.startBreakTimeUrl;
      }
      if (AuthHiveHelper.getUserRoleId == UserRoles.TEAM_LEADER_ROLE_ID) {
        url = APIRoutes.startTeamLeaderBreakTimeUrl;
      }
      Response response = await _dio.post(url);
      if (response.data["errors"] != null && response.data["errors"].isEmpty) {
        return BreakTimeModel.fromJson(response.data);
      }
      return BreakTimeModel(errors: ["${response.data["errors"]}"]);
    } catch (e, stacktrace) {
      log("$e");
      log("$stacktrace");
      throw Exception("An Error Occurred!");
    }
  }
}