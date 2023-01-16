import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:imc/InterventionDetails/data/local_database/normal_intervention_local_database/intervention_details_drift_helper.dart';
import 'package:imc/InterventionDetails/data/models/rc_intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/cubit/rc_intervention_details_cubit/rc_intervention_details_cubit.dart';

import '../utils/rc_intervention_details_utils.dart';

class RCInterventionDetailsHelperFunctions {
  /// This function[saveRCInterventionDetailsInBloc] is common for all  rc intervention details pages it will insert the data into bloc
  static void saveRCInterventionDetailsInBloc(BuildContext context, RCInterventionDetailsModel rcInterventionDetails) {
    var _bloc = BlocProvider.of<RCInterventionDetailsCubit>(context);
    _bloc.saveRCInterventionDetailsInBloc(rcInterventionDetails);
  }

  /// This function[disableButton] will disable the Finish button until all the fields are filled
  static bool disableButton(int selectedPage, RCInterventionDetailsModel rcInterventionDetails) {
    switch (selectedPage) {
      case RCInterventionDetailsUtils.MeterReprogrammngPageId:
        {
          if (rcInterventionDetails.confirmMeterReprogramming == null ||
              rcInterventionDetails.meterReprogrammingImage1 == null ||
              rcInterventionDetails.meterReprogrammingImage2 == null ||
              (rcInterventionDetails.additionalInfoOfMeterReprogramming == "" || rcInterventionDetails.additionalInfoOfMeterReprogramming == null)) {
            return true;
          }
          break;
        }
      case RCInterventionDetailsUtils.EnslavementTestPageId:
        {
          if (rcInterventionDetails.confirmEnslavementTest == null ||
              rcInterventionDetails.meterEnslavementTestImage1 == null ||
              rcInterventionDetails.meterEnslavementTestImage2 == null ||
              (rcInterventionDetails.additionalInfoOfEnslavementTest == "" || rcInterventionDetails.additionalInfoOfEnslavementTest == null)) {
            return true;
          }
          break;
        }
      case RCInterventionDetailsUtils.OtherActionsPageId:
        {
          if (rcInterventionDetails.specifyYourAction == null ||
              (rcInterventionDetails.specifyYourAction != null && rcInterventionDetails.specifyYourAction!.isEmpty) ||
              rcInterventionDetails.additionalInfoOfActions == null ||
              (rcInterventionDetails.additionalInfoOfActions != null && rcInterventionDetails.additionalInfoOfActions!.isEmpty) ||
              rcInterventionDetails.photosOfAction == null ||
              (rcInterventionDetails.photosOfAction != null && rcInterventionDetails.photosOfAction!.isNotEmpty && rcInterventionDetails.photosOfAction!.first == "") ||
              (rcInterventionDetails.photosOfAction != null && rcInterventionDetails.photosOfAction!.length < 1) ||
              (rcInterventionDetails.photosOfAction != null && rcInterventionDetails.photosOfAction!.contains("") == true)) {

            return true;
          }
          break;
        }
    }

    return false;
  }

  ///[saveRCDataIntoDatabase]function to save the rc intervention details of current selectedPaged page locally
  static void saveRCDataIntoDatabase({int? selectedPage, required RCInterventionDetailsModel rcInterventionDetails}) {
    final _rcInterventionDetailsDatabase = GetIt.I<InterventionDetailsDatabase>();
    _rcInterventionDetailsDatabase.getRCInterventionDetailsFromDb().then((value) {
      log("RC Intervention Local DATABASSE=======${rcInterventionDetails.toJson()}");
    });

    if (selectedPage != null) {
      switch (selectedPage) {
        case RCInterventionDetailsUtils.MeterReprogrammngPageId:
          {
            _rcInterventionDetailsDatabase.insertRCInterventionIntoLocalDb(RCInterventionDetailsModel(
              id: rcInterventionDetails.id,
              latitude: rcInterventionDetails.latitude,
              longitude: rcInterventionDetails.longitude,
              selectedRCInterventionOption: RCInterventionDetailsUtils.MeterReprogrammingText,
              confirmMeterReprogramming: rcInterventionDetails.confirmMeterReprogramming,
              meterReprogrammingImage1: rcInterventionDetails.meterReprogrammingImage1,
              meterReprogrammingImage2: rcInterventionDetails.meterReprogrammingImage2,
              additionalInfoOfMeterReprogramming: rcInterventionDetails.additionalInfoOfMeterReprogramming,
            ));

            break;
          }
        case RCInterventionDetailsUtils.EnslavementTestPageId:
          {
            _rcInterventionDetailsDatabase.insertRCInterventionIntoLocalDb(RCInterventionDetailsModel(
              id: rcInterventionDetails.id,
              latitude: rcInterventionDetails.latitude,
              longitude: rcInterventionDetails.longitude,
              selectedRCInterventionOption: RCInterventionDetailsUtils.EnslavementTestText,
              confirmEnslavementTest: rcInterventionDetails.confirmEnslavementTest,
              meterEnslavementTestImage1: rcInterventionDetails.meterEnslavementTestImage1,
              meterEnslavementTestImage2: rcInterventionDetails.meterEnslavementTestImage2,
              additionalInfoOfEnslavementTest: rcInterventionDetails.additionalInfoOfEnslavementTest,
            ));
            break;
          }
        case RCInterventionDetailsUtils.OtherActionsPageId:
          {
            _rcInterventionDetailsDatabase.insertRCInterventionIntoLocalDb(RCInterventionDetailsModel(
              id: rcInterventionDetails.id,
              latitude: rcInterventionDetails.latitude,
              longitude: rcInterventionDetails.longitude,
              selectedRCInterventionOption: RCInterventionDetailsUtils.OtherActionsText,
              specifyYourAction: rcInterventionDetails.specifyYourAction,
              photosOfAction: rcInterventionDetails.photosOfAction,
              additionalInfoOfActions: rcInterventionDetails.additionalInfoOfActions,
            ));

            break;
          }
        case RCInterventionDetailsUtils.ReportPageId:
          {
            _rcInterventionDetailsDatabase.insertRCInterventionIntoLocalDb(RCInterventionDetailsModel(
              id: rcInterventionDetails.id,
              latitude: rcInterventionDetails.latitude,
              longitude: rcInterventionDetails.longitude,
              startTimeOfIntervention: rcInterventionDetails.startTimeOfIntervention,
              endTimeOfIntervention: rcInterventionDetails.endTimeOfIntervention,
            ));

            break;
          }
      }
    }
  }
}