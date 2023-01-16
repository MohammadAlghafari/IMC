import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:imc/Auth/data/local_database/auth_hive_helper.dart';
import 'package:imc/InterventionDetails/data/repositories/CustomerInterventionsHistoryRepo.dart';
import 'package:imc/common_models/InterventionHistoryModel.dart';
import 'package:imc/core/constant/app_constant.dart';

import 'package:imc/core/service/api_routes.dart';

class CustomerInterventionsHistoryApiHandler implements CustomerInterventionsHistoryRepo {
  static Dio _dio = GetIt.I<Dio>();


  @override
  Future<List<Records?>?> getCustomerInterventionHistory(int interventionId) async {
    late final String url;
    if (AuthHiveHelper.getUserRoleId == UserRoles.TECHNICIAN_ROLE_ID) {
      url = APIRoutes.getCustomerInterventionsHistoryUrl(interventionId);
    } else if (AuthHiveHelper.getUserRoleId == UserRoles.TEAM_LEADER_ROLE_ID) {
      url = APIRoutes.getTeamLeaderCustomerInterventionsHistoryUrl(interventionId);
    }

    try {
      Response response = await _dio.get(url);

      InterventionHistoryModel interventionHistoryModel = InterventionHistoryModel.fromJson(response.data);
      return interventionHistoryModel.records;
    } catch (e, stacktrace) {
      log("customer_intervention_history_api_handler_stacktrace: ${stacktrace}");
      throw e;
    }
  }

  @override
  Future downloadPdf({required url, required savePath}) async {
    try {
      Response response = await _dio.download(url, savePath);
      print("CUSTOMER_INTERVENTION_HISTORY_API_HANDLER ====${response.data}");
      return response.data;
    } catch (e) {
      print("dio intervention history error: $e");
    }
  }
}