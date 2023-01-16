import 'dart:io';

import 'package:imc/TeamLeader/data/model/team_leader_ongoing_intervention_model.dart' as ongoingInterventions;
import 'package:imc/TeamLeader/data/model/team_leader_team_members_model.dart' as teamMember;
import 'package:imc/TeamLeader/data/model/team_leader_intervention_record.dart' as teamLeaderInterventionModel;
import 'package:imc/TeamLeader/data/model/team_member_intervention_record.dart' as teamMemberInterventionRecord;

import 'package:imc/common_models/interventions_count_model.dart' as interventionsCount;

abstract class TeamLeaderRepository {
  ///[getTeamLeaderTeamMembers] Function to get all the team members for a team leader
  Future<List<teamMember.Records>?> getTeamLeaderTeamMembers();

  ///[getTeamLeaderOngoingInterventions]Function to get the list of ongoing interventions
  Future<List<ongoingInterventions.Records>?> getTeamLeaderOngoingInterventions();

  ///[getListOfTeamLeaderVisitsByDateRangeAndStatus]Function to get the list of interventions by passing the required date, intervention type and technicien id
  Future<List<teamMemberInterventionRecord.Records>?> getListOfTeamMemberInterventionsByDateRangeAndStatus(
      String startDate,
      String endDate,
      List<int> listOfStatus,
      int technicianId,
      );

  ///[getListOfTeamLeaderVisitsByDateRangeAndStatus]Function to get the list of interventions for a teamleader
  Future<List<teamLeaderInterventionModel.Records>?> getListOfTeamLeaderVisitsByDateRangeAndStatus(
      String startDate,
      String endDate,
      List<int> listOfStatus,
      );

  ///[endTeamLeaderVisit]  function will end the Team leader Intervention
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
  });

  ///[getInterventionsCount] will get the total interventions count(done,to do, grip case) for a teamleader
  Future<interventionsCount.Records?> getInterventionsCount();
}