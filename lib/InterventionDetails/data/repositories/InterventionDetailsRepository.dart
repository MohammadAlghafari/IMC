import 'dart:io';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/data/models/tech_marque_model.dart';
import 'package:imc/InterventionDetails/data/models/rc_intervention_details_model.dart';

abstract class InterventionDetailsRepository {
  //Instantiating the object of technician intervention model with default values for all fields which are of List<String> type.
  InterventionDetailsModel _interventionDetails = InterventionDetailsModel(
      // photoOfIndexImage: [""],
      // enterAdditionallyMaterial: [""],
      // photosOfNewMeterInstalled: [""]
  );

  //Instantiating the object of technician's RC intervention model
  RCInterventionDetailsModel _rcInterventionDetails = RCInterventionDetailsModel();

  /// The function [setInterventionDetails] will set the intervention details.
  void setInterventionDetails(InterventionDetailsModel interventionDetails) => _interventionDetails = interventionDetails;

  /// The function [getInterventionDetails] will return the intervention details.
  InterventionDetailsModel get getInterventionDetails => _interventionDetails;

  /// The function [setRCInterventionDetails] will set the RC intervention details.
  void setRcInterventionDetails(RCInterventionDetailsModel rcInterventionDetails) => _rcInterventionDetails = rcInterventionDetails;

  /// The function [getRCInterventionDetails] will return the RC intervention details.
  RCInterventionDetailsModel get getRCInterventionDetails => _rcInterventionDetails;


  // /// This function[updateInterventionStatus] will update the intervention status according to the passed intervention type(as [interventionStatus])
  // Future<bool> updateInterventionStatus({required int interventionStatus, required int interventionId});


  /// This function [endIntervention] will end the Intervention for techinician
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
  });

  /// This function [getListOfTechMarques] gives us the list of tech marques
  Future<TechMarqueModel?> getListOfTechMarques();
}