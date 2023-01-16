import 'package:flutter/material.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';

class AppConstant {
  /// The [clientId] and [clientSecret] are some constant that are required for the backend
  /// these would always be constant
  static final String clientId = "96097d77-2556-401f-9de8-a5486e486197";
  static final String clientSecret = "4luhHMb0p8WEQd8Y3LekhW6FpgdGB601dShOTjEu";

  static List<String> getListOfMonths(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return [
      appLocalizations.translate("january"),
      appLocalizations.translate("february"),
      appLocalizations.translate("march"),
      appLocalizations.translate("april"),
      appLocalizations.translate("may"),
      appLocalizations.translate("june"),
      appLocalizations.translate("july"),
      appLocalizations.translate("august"),
      appLocalizations.translate("september"),
      appLocalizations.translate("october"),
      appLocalizations.translate("november"),
      appLocalizations.translate("december"),
    ];
  }

  static List<String> getWeekTitles(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return [
      appLocalizations.translate("mon"),
      appLocalizations.translate("tue"),
      appLocalizations.translate("wed"),
      appLocalizations.translate("thr"),
      appLocalizations.translate("fri"),
      appLocalizations.translate("sat"),
      appLocalizations.translate("sun"),
    ];
  }
}

class InterventionStatus {
  ///(status 1) : TO-do
  // static final InterventionStatusModel InterventionStatusTous =
  // InterventionStatusModel(interventionStatusCode: 1, interventionStatusColor: Colors.grey, interventionStatusName: "Tous");

  ///(status 2) : Not to realize - (grip case = ko)
  static final InterventionStatusModel InterventionStatusAnePasRealiser =
  InterventionStatusModel(interventionStatusCode: 2, interventionStatusColor: AppColor.kCaseColor, interventionStatusName: "A ne pas réaliser");

  ///(status 3) : Stand by - (force grip case = semi ko)
  static final InterventionStatusModel InterventionStatusStandBy =
  InterventionStatusModel(interventionStatusCode: 3, interventionStatusColor: AppColor.kToDOColor, interventionStatusName: "Stand by");

  ///(status 4) : Realised- (realised = success)
  static final InterventionStatusModel InterventionStatusRealisee =
  InterventionStatusModel(interventionStatusCode: 4, interventionStatusColor: AppColor.kSuccessColor, interventionStatusName: "Réalisée");

  ///(status 5) : Planned
  static final InterventionStatusModel InterventionStatusPlanifiee =
  InterventionStatusModel(interventionStatusCode: 5, interventionStatusColor: Colors.grey, interventionStatusName: "Planifiée");

  ///(status 6) : To plan
  static final InterventionStatusModel InterventionStatusAPlanifier =
  InterventionStatusModel(interventionStatusCode: 6, interventionStatusColor: Colors.grey, interventionStatusName: "A planifier");
}

class InterventionStatusModel {
  final String interventionStatusName;
  final int interventionStatusCode;
  final Color interventionStatusColor;

  InterventionStatusModel({required this.interventionStatusCode, required this.interventionStatusColor, required this.interventionStatusName});
}

class UserRoles {
  static int TECHNICIAN_ROLE_ID = 4;
  static int TEAM_LEADER_ROLE_ID = 5;
}

class InterventionTypes {
  static int CLASSIC = 1;
  static int VISIT = 2;
  static int RC = 3;
}