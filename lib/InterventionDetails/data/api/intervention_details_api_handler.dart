import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/data/models/rc_intervention_details_model.dart';
import 'package:imc/InterventionDetails/data/models/tech_marque_model.dart';
import 'package:imc/InterventionDetails/data/repositories/InterventionDetailsRepository.dart';
import 'package:imc/core/service/api_routes.dart';

class InterventionDetailsApiHandler extends InterventionDetailsRepository {
  InterventionDetailsApiHandler() : super();

  static Dio _dio = GetIt.I<Dio>();

  // @override
  // Future<bool> updateInterventionStatus({required int interventionStatus, required interventionId}) async {
  //   print("intervention status before calling api : ${interventionStatus}");
  //   try {
  //     Map<String, dynamic> _data = {
  //       'status': interventionStatus,
  //     };
  //
  //     await _dio.patch(APIRoutes.updateInterventionStatusUrl(interventionId), data: _data);
  //
  //     return true;
  //   } catch (e, stacktrace) {
  //     log("$stacktrace");
  //     return false;
  //   }
  // }

  @override
  Future<bool> endIntervention({
    required int interventionId,
    required File file,
    required String fileName,
    required String startDateTime,
    required String endDateTime,
    required String latitude,
    required String longitude,
    required int interventionStatus,
    InterventionDetailsModel? normalInterventionDetails,
    RCInterventionDetailsModel? rcIntervention,
  }) async {
    Map<String, dynamic> _data = {
      "file": await MultipartFile.fromFile(file.path, filename: "$fileName"),
      "start_date": startDateTime,
      "end_date": endDateTime,
      "latitude": latitude,
      "longitude": longitude,
      'status': interventionStatus,
    };
    //var to store the _interventionDetails after getting it as Json
    Map<String, dynamic> _interventionDetailsToJson = {};

    if (normalInterventionDetails != null) {
      //getting the intervention details as Json
      _interventionDetailsToJson = normalInterventionDetails.toJson();

      //converting all the 'true-false' of an intervention to '1-0'
      if (normalInterventionDetails.confirmPpePorts != null) {
        if (normalInterventionDetails.confirmPpePorts == true) {
          _interventionDetailsToJson.update("confirmPpePorts", (value) => value = 1);
        } else if (normalInterventionDetails.confirmPpePorts == false) {
          _interventionDetailsToJson.update("confirmPpePorts", (value) => value = 0);
        }
      }
      if (normalInterventionDetails.confirmMacronsInstallation != null) {
        if (normalInterventionDetails.confirmMacronsInstallation == true) {
          _interventionDetailsToJson.update("confirmMacronsInstallation", (value) => value = 1);
        } else if (normalInterventionDetails.confirmMacronsInstallation == false) {
          _interventionDetailsToJson.update("confirmMacronsInstallation", (value) => value = 0);
        }
      }
      if (normalInterventionDetails.confirmTop != null) {
        if (normalInterventionDetails.confirmTop == true) {
          _interventionDetailsToJson.update("confirmTop", (value) => value = 1);
        } else if (normalInterventionDetails.confirmTop == false) {
          _interventionDetailsToJson.update("confirmTop", (value) => value = 0);
        }
      }
      if (normalInterventionDetails.canYouGetStartedToday != null) {
        if (normalInterventionDetails.canYouGetStartedToday == true) {
          _interventionDetailsToJson.update("canYouGetStartedToday", (value) => value = 1);
        } else if (normalInterventionDetails.canYouGetStartedToday == false) {
          _interventionDetailsToJson.update("canYouGetStartedToday", (value) => value = 0);
        }
      }
      if (normalInterventionDetails.testOfVat != null) {
        if (normalInterventionDetails.testOfVat == true) {
          _interventionDetailsToJson.update("testOfVat", (value) => value = 1);
        } else if (normalInterventionDetails.testOfVat == false) {
          _interventionDetailsToJson.update("testOfVat", (value) => value = 0);
        }
      }
      if (normalInterventionDetails.settingsAnomaly != null) {
        if (normalInterventionDetails.settingsAnomaly == true) {
          _interventionDetailsToJson.update("settingsAnomaly", (value) => value = 1);
        } else if (normalInterventionDetails.settingsAnomaly == false) {
          _interventionDetailsToJson.update("settingsAnomaly", (value) => value = 0);
        }
      }
      if (normalInterventionDetails.circuitBreakerMalfuncttion != null) {
        if (normalInterventionDetails.circuitBreakerMalfuncttion == true) {
          _interventionDetailsToJson.update("circuitBreakerMalfuncttion", (value) => value = 1);
        } else if (normalInterventionDetails.circuitBreakerMalfuncttion == false) {
          _interventionDetailsToJson.update("circuitBreakerMalfuncttion", (value) => value = 0);
        }
      }
      if (normalInterventionDetails.isTheDriverWellPositioned != null) {
        if (normalInterventionDetails.isTheDriverWellPositioned == true) {
          _interventionDetailsToJson.update("isTheDriverWellPositioned", (value) => value = 1);
        } else if (normalInterventionDetails.isTheDriverWellPositioned == false) {
          _interventionDetailsToJson.update("isTheDriverWellPositioned", (value) => value = 0);
        }
      }
      if (normalInterventionDetails.identificationBetweenPhaseAndNeutral != null) {
        if (normalInterventionDetails.identificationBetweenPhaseAndNeutral == true) {
          _interventionDetailsToJson.update("identificationBetweenPhaseAndNeutral", (value) => value = 1);
        } else if (normalInterventionDetails.identificationBetweenPhaseAndNeutral == false) {
          _interventionDetailsToJson.update("identificationBetweenPhaseAndNeutral", (value) => value = 0);
        }
      }
      if (normalInterventionDetails.presenceOfPnt != null) {
        if (normalInterventionDetails.presenceOfPnt == true) {
          _interventionDetailsToJson.update("presenceOfPnt", (value) => value = 1);
        } else if (normalInterventionDetails.presenceOfPnt == false) {
          _interventionDetailsToJson.update("presenceOfPnt", (value) => value = 0);
        }
      }
      if (normalInterventionDetails.inversionBetweenPhaseAndMaterial != null) {
        if (normalInterventionDetails.inversionBetweenPhaseAndMaterial == true) {
          _interventionDetailsToJson.update("inversionBetweenPhaseAndMaterial", (value) => value = 1);
        } else if (normalInterventionDetails.inversionBetweenPhaseAndMaterial == false) {
          _interventionDetailsToJson.update("inversionBetweenPhaseAndMaterial", (value) => value = 0);
        }
      }
      if (normalInterventionDetails.resumptionOfEnslavement != null) {
        if (normalInterventionDetails.resumptionOfEnslavement == true) {
          _interventionDetailsToJson.update("resumptionOfEnslavement", (value) => value = 1);
        } else if (normalInterventionDetails.resumptionOfEnslavement == false) {
          _interventionDetailsToJson.update("resumptionOfEnslavement", (value) => value = 0);
        }
      }
      if (normalInterventionDetails.ictCabling != null) {
        if (normalInterventionDetails.ictCabling == true) {
          _interventionDetailsToJson.update("ictCabling", (value) => value = 1);
        } else if (normalInterventionDetails.ictCabling == false) {
          _interventionDetailsToJson.update("ictCabling", (value) => value = 0);
        }
      }
      if (normalInterventionDetails.hasTheCircuitBreakerBeenReplaced != null) {
        if (normalInterventionDetails.hasTheCircuitBreakerBeenReplaced == true) {
          _interventionDetailsToJson.update("hasTheCircuitBreakerBeenReplaced", (value) => value = 1);
        } else if (normalInterventionDetails.hasTheCircuitBreakerBeenReplaced == false) {
          _interventionDetailsToJson.update("hasTheCircuitBreakerBeenReplaced", (value) => value = 0);
        }
      }
      if (normalInterventionDetails.circuitBreakerLead != null) {
        if (normalInterventionDetails.circuitBreakerLead == true) {
          _interventionDetailsToJson.update("circuitBreakerLead", (value) => value = 1);
        } else if (normalInterventionDetails.circuitBreakerLead == false) {
          _interventionDetailsToJson.update("circuitBreakerLead", (value) => value = 0);
        }
      }
      if (normalInterventionDetails.leadCCPI != null) {
        if (normalInterventionDetails.leadCCPI == true) {
          _interventionDetailsToJson.update("leadCCPI", (value) => value = 1);
        } else if (normalInterventionDetails.leadCCPI == false) {
          _interventionDetailsToJson.update("leadCCPI", (value) => value = 0);
        }
      }
      if (normalInterventionDetails.modifiedCircuitBreakerCapacity != null) {
        if (normalInterventionDetails.modifiedCircuitBreakerCapacity == true) {
          _interventionDetailsToJson.update("modifiedCircuitBreakerCapacity", (value) => value = 1);
        } else if (normalInterventionDetails.modifiedCircuitBreakerCapacity == false) {
          _interventionDetailsToJson.update("modifiedCircuitBreakerCapacity", (value) => value = 0);
        }
      }
      if (normalInterventionDetails.statusOfInstalledMeter != null) {
        if (normalInterventionDetails.statusOfInstalledMeter == true) {
          _interventionDetailsToJson.update("statusOfInstalledMeter", (value) => value = 1);
        } else if (normalInterventionDetails.statusOfInstalledMeter == false) {
          _interventionDetailsToJson.update("statusOfInstalledMeter", (value) => value = 0);
        }
      }
      if (normalInterventionDetails.circuitBreakerProperlyEngaged != null) {
        if (normalInterventionDetails.circuitBreakerProperlyEngaged == true) {
          _interventionDetailsToJson.update("circuitBreakerProperlyEngaged", (value) => value = 1);
        } else if (normalInterventionDetails.circuitBreakerProperlyEngaged == false) {
          _interventionDetailsToJson.update("circuitBreakerProperlyEngaged", (value) => value = 0);
        }
      }

      if (normalInterventionDetails.isGripCase != null) {
        if (normalInterventionDetails.isGripCase == true) {
          _interventionDetailsToJson.update("isGripCase", (value) => value = 1);
        } else if (normalInterventionDetails.isGripCase == false) {
          _interventionDetailsToJson.update("isGripCase", (value) => value = 0);
        }
      }

      //converting all the 'String' type values of the month  to it's int month id value (eg. January represent id 1)
      if (normalInterventionDetails.month != null) {
        if (normalInterventionDetails.month == "January" || normalInterventionDetails.month == "janvier") {
          _interventionDetailsToJson.update("month", (value) => value = 1);
        } else if (normalInterventionDetails.month == "February" || normalInterventionDetails.month == "février") {
          _interventionDetailsToJson.update("month", (value) => value = 2);
        } else if (normalInterventionDetails.month == "March" || normalInterventionDetails.month == "mars") {
          _interventionDetailsToJson.update("month", (value) => value = 3);
        } else if (normalInterventionDetails.month == "April" || normalInterventionDetails.month == "avril") {
          _interventionDetailsToJson.update("month", (value) => value = 4);
        } else if (normalInterventionDetails.month == "May" || normalInterventionDetails.month == "mai") {
          _interventionDetailsToJson.update("month", (value) => value = 5);
        } else if (normalInterventionDetails.month == "June" || normalInterventionDetails.month == "juin") {
          _interventionDetailsToJson.update("month", (value) => value = 6);
        } else if (normalInterventionDetails.month == "July" || normalInterventionDetails.month == "juillet") {
          _interventionDetailsToJson.update("month", (value) => value = 7);
        } else if (normalInterventionDetails.month == "August" || normalInterventionDetails.month == "août") {
          _interventionDetailsToJson.update("month", (value) => value = 8);
        } else if (normalInterventionDetails.month == "Spetember" || normalInterventionDetails.month == "septembre") {
          _interventionDetailsToJson.update("month", (value) => value = 9);
        } else if (normalInterventionDetails.month == "October" || normalInterventionDetails.month == "octobre") {
          _interventionDetailsToJson.update("month", (value) => value = 10);
        } else if (normalInterventionDetails.month == "November" || normalInterventionDetails.month == "novembre") {
          _interventionDetailsToJson.update("month", (value) => value = 11);
        } else if (normalInterventionDetails.month == "December" || normalInterventionDetails.month == "décembre") {
          _interventionDetailsToJson.update("month", (value) => value = 12);
        }
      }

      //adding the required map data into the Json
      _interventionDetailsToJson.addAll(_data);
    } else if (rcIntervention != null) {
      _interventionDetailsToJson = rcIntervention.toJson();

      //converting all the 'true-false' of an rc intervention to '1-0'
      if (rcIntervention.confirmMeterReprogramming != null) {
        if (rcIntervention.confirmMeterReprogramming == true) {
          _interventionDetailsToJson.update("confirmMeterReprogramming", (value) => value = 1);
        } else if (rcIntervention.confirmMeterReprogramming == false) {
          _interventionDetailsToJson.update("confirmMeterReprogramming", (value) => value = 0);
        }
      }
      if (rcIntervention.confirmEnslavementTest != null) {
        if (rcIntervention.confirmEnslavementTest == true) {
          _interventionDetailsToJson.update("confirmEnslavementTest", (value) => value = 1);
        } else if (rcIntervention.confirmEnslavementTest == false) {
          _interventionDetailsToJson.update("confirmEnslavementTest", (value) => value = 0);
        }
      }
      if (rcIntervention.isGripCase != null) {
        if (rcIntervention.isGripCase == true) {
          _interventionDetailsToJson.update("isGripCase", (value) => value = 1);
        } else if (rcIntervention.isGripCase == false) {
          _interventionDetailsToJson.update("isGripCase", (value) => value = 0);
        }
      }

      _interventionDetailsToJson.addAll(_data);
    }
    log("data to be sent : ${_interventionDetailsToJson}");
    var formData = FormData.fromMap(_interventionDetailsToJson);
    try {
      await _dio.post(APIRoutes.endInterventionUrl(interventionId), data: formData);

      return true;
    } catch (e, stacktrace) {
      log(" end intervention error: $e");
      log(" end intervention stacktrace: $stacktrace");
      return false;
    }
  }

  //This returns us a list of tech marques
  @override
  Future<TechMarqueModel?> getListOfTechMarques() async {
    try {
      Response response = await _dio.get(APIRoutes.getTechMarqueUrl);
      return TechMarqueModel.fromJson(response.data);
    } catch (e, stacktrace) {
      log("getListOfTechMarques ERROR - $e");
      log("getListOfTechMarques STACKTRACE - $stacktrace");
      return null;
    }
  }
}