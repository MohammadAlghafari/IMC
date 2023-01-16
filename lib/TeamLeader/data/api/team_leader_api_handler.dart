import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:imc/Auth/data/local_database/auth_hive_helper.dart';
import 'package:imc/common_models/interventions_count_model.dart' as interventionsCount;
import 'package:imc/TeamLeader/data/model/team_leader_team_members_model.dart' as teamMember;
import 'package:imc/TeamLeader/data/model/team_leader_ongoing_intervention_model.dart' as ongoingIntervention;
import 'package:imc/TeamLeader/data/repository/team_leader_repository.dart';
import 'package:imc/TeamLeader/data/model/team_leader_intervention_record.dart' as teamLeaderInterventionModel;
import 'package:imc/TeamLeader/data/model/team_member_intervention_record.dart' as teamMemberInterventionRecord;

import 'package:imc/core/constant/app_constant.dart';
import 'package:imc/core/service/api_routes.dart';

class TeamLeaderApiHandler extends TeamLeaderRepository {
  static Dio _dio = GetIt.I<Dio>();
  @override
  Future<List<ongoingIntervention.Records>?> getTeamLeaderOngoingInterventions() async {
    try {
      Response _response = await _dio.get(APIRoutes.getTeamLeaderOngoingInterventions);
      ongoingIntervention.TeamLeaderOngoingInterventionModel _teamLeaderOngoingInterventionModel =
      ongoingIntervention.TeamLeaderOngoingInterventionModel.fromJson(_response.data);
      return _teamLeaderOngoingInterventionModel.records;
    } catch (e, stacktrace) {
      log("team_leader_ongoing_interventions_api - ${stacktrace}");
      throw e;
    }
  }

  @override
  Future<List<teamMember.Records>?> getTeamLeaderTeamMembers() async {
    try {
      Response _response = await _dio.get(APIRoutes.getTeamLeaderTeamMembers);
      teamMember.TeamLeaderTeamMembersModel _teamLeaderTeamMembers = teamMember.TeamLeaderTeamMembersModel.fromJson(_response.data);
      return _teamLeaderTeamMembers.records;
    } catch (e, stacktrace) {
      log("team_leader_team_member_api - ${stacktrace}");
      throw e;
    }
  }

  @override
  Future<List<teamMemberInterventionRecord.Records>?> getListOfTeamMemberInterventionsByDateRangeAndStatus(
      String startDate,
      String endDate,
      List<int> listOfStatus,
      int technicianId,
      ) async {
    try {
      Map<String, dynamic> _body = {"start_date": startDate, "end_date": endDate, "status": listOfStatus, "id": technicianId};

      Response response = await _dio.post(
        APIRoutes.getTeamMemberInterventionsByDateRangeAndStatusUrl,
        data: _body,
      );
      teamMemberInterventionRecord.TeamMemberInterventionRecord interventionRecord =
      teamMemberInterventionRecord.TeamMemberInterventionRecord.fromJson(response.data);

      return interventionRecord.records;
    } catch (e, stacktrace) {
      log("$stacktrace");
      log("team_leader_get_team_member_interventions_by_date_range_status_api - $stacktrace");
      throw e;
    }
  }

  @override
  Future<interventionsCount.Records?> getInterventionsCount() async {
    late final String url;
    try {
      //setting the url according to the [UserRole]
      if (AuthHiveHelper.getUserRoleId == UserRoles.TECHNICIAN_ROLE_ID) {
        url = APIRoutes.getTechnicianInterventionsCount;
      }
      if (AuthHiveHelper.getUserRoleId == UserRoles.TEAM_LEADER_ROLE_ID) {
        url = APIRoutes.getTeamLeaderInterventionsCount;
      }
      Response response = await _dio.get(url);
      interventionsCount.InterventionsCountModel interventionCount =
      interventionsCount.InterventionsCountModel.fromJson(response.data);

      return interventionCount.records;
    } catch (e, stacktrace) {
      log("team_leader_get_interventions_count_api - ${stacktrace}");
      throw e;
    }
  }

  @override
  Future<bool> endTeamLeaderVisit({
    required int clientId,
    required int visitId,
    required String schedule,
    required String startDate,
    required String endDate,
    required String latitude,
    required String longitude,
    required File pdfFile,
    required String pdfName,
  }) async {
    try {
      MultipartFile file = await MultipartFile.fromFile(pdfFile.path, filename: pdfName);
      Map<String, dynamic> _body = {
        "client_id": clientId,
        "schedule": schedule,
        "start_date": startDate,
        "end_date": endDate,
        "file": file,
        "latitude": latitude,
        "longitude": longitude,
        "status": InterventionStatus.InterventionStatusRealisee.interventionStatusCode
      };
      var formData = FormData.fromMap(_body);
      await _dio.post(APIRoutes.endTeamLeaderVisit(visitId), data: formData);

      return true;
    } catch (e, stacktrace) {
      log("team_leader_end_visit_api_stacktarce - ${stacktrace}");
      log("team_leader_end_visit_api_error - ${e}");
      return false;
    }
  }

  @override
  Future<List<teamLeaderInterventionModel.Records>?> getListOfTeamLeaderVisitsByDateRangeAndStatus(
      String startDate, String endDate, List<int> listOfStatus) async {
    try {
      Map<String, dynamic> _data = {
        "start_date": startDate,
        "end_date": endDate,
        "status": listOfStatus,
      };
      Response response = await _dio.post(
        APIRoutes.getTeamLeaderVisitsByDateAndStatusRangeUrl,
        data: _data,
      );
      teamLeaderInterventionModel.TeamLeaderInterventionRecord visits =
      teamLeaderInterventionModel.TeamLeaderInterventionRecord.fromJson(response.data);
      return visits.records;
    } catch (e, stacktrace) {
      log("team_leader_visits_by_date_range_status_api_stacktrace: ${stacktrace}");
      log("team_leader_visits_by_date_range_status_api_error: ${e}");
    }
    return null;
  }
}