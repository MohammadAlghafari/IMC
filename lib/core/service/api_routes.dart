const String ApiBaseUrl = "https://demo2.itfaq.cloud/imc/public";

class APIRoutes {
  static const baseUrl = "https://demo2.itfaq.cloud/imc/public/api";
  // static final apiVersion1 = "/v1";
  static const newHostUrl = "https://demo2.itfaq.cloud/imc/public/api";
  // static const newHostUrl = "http://imctelecom-env.eba-aydxjmee.eu-west-3.elasticbeanstalk.com/api";

  static const String login = newHostUrl + "/v1/login";
  // static const String login = newHostUrl + "api/v1/login";
  static const String getToken = "https://demo2.itfaq.cloud/imc/public/oauth/token";
  // static const String getToken = "http://imctelecom-env.eba-aydxjmee.eu-west-3.elasticbeanstalk.com/oauth/token";
  static const String logout = newHostUrl + "api/v1/logout";

  static String getTechnicianInterventionsCount = "$newHostUrl/v1/technicien/interventions/status/count";


  static final startBreakTimeUrl = "$newHostUrl/v1/technicien/break-time";
  static final resumeBreakTimeUrl = "$newHostUrl/v1/technicien/resume";

  static final getInterventionByDateRangeUrl = "$newHostUrl/v1/technicien/interventions/date-range";
  static final getInterventionOnMapsUrl = "$newHostUrl/v1/technicien/interventions/map";

  static String getTechMarqueUrl = "$newHostUrl/v1/masterdata/get-meter-brands";
  static String updateInterventionStatusUrl(int interventionId) => "$newHostUrl/v1/technicien/intervention/$interventionId/update-status";
  static String endInterventionUrl(int interventionId) => "$newHostUrl/v1/technicien/intervention/$interventionId/end";


  static String getCustomerInterventionsHistoryUrl(int interventionId) => '$newHostUrl/v1/technicien/intervention/${interventionId}/history';

  static String downloadPdfurl(String interventionPdf) => "https:///public/uploads/interventions/$interventionPdf";

  static String getAnalyticsWeekUrl = "$newHostUrl/v1/technicien/interventions/analytics-week";
  static String getAnalyticsTimeUrl = "$newHostUrl/v1/technicien/interventions/analytics-time";

  ///Team Leader - APIs
  static String getTeamLeaderInterventionsCount = "$newHostUrl/v1/teamleader/interventions/status/count";
  static String getTeamLeaderTeamMembers = "$newHostUrl/v1/teamleader/team-members";
  static String getTeamLeaderOngoingInterventions = "$newHostUrl/v1/teamleader/interventions/intervention_ongoing";

  static String endTeamLeaderVisit(int visitID) => "$newHostUrl/v1/teamleader/visits/$visitID/end";

  static String getTeamMemberInterventionsByDateRangeAndStatusUrl = "$newHostUrl/v1/teamleader/team-member-interventions/data-range/status";

  static String getTeamLeaderVisitsByDateAndStatusRangeUrl = "$newHostUrl/v1/teamleader/visits/date-range/status";

  static String getTeamLeaderCustomerInterventionsHistoryUrl(int visitId) => '$newHostUrl/v1/teamleader/visits/${visitId}/history';

  static String getTeamLeaderAnalyticsWeekUrl = "$newHostUrl/v1/teamleader/interventions/analytics-week";
  static String getTeamLeaderAnalyticsTimeUrl = "$newHostUrl/v1/teamleader/interventions/analytics-time";

  static final startTeamLeaderBreakTimeUrl = "$newHostUrl/v1/teamleader/break-time";
  static final resumeTeamLeaderBreakTimeUrl = "$newHostUrl/v1/teamleader/resume";
}