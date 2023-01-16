import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/pages/rc_grip_case_page.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/pages/rc_intervention_details_pages/internal_pages/1_meter_reprogramming_internal_page.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/pages/rc_intervention_details_pages/internal_pages/2_test_of_enslavement_internal_page.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/pages/rc_intervention_details_pages/internal_pages/3_other_actions_internal_page.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/pages/rc_intervention_details_pages/rc_intervention_details_page_helpers/rc_intervention_details_page_index_helper_functions.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/pages/rc_intervention_details_pages/utils/rc_intervention_details_utils.dart';
import 'package:imc/InterventionDetails/data/models/rc_intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/intervention_details_page_index.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/reporting_a_grip_case_page.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_selection_container_n_bottom_sheet.dart';
import 'package:imc/InterventionDetails/presentation/widgets/bottom_sheets/intervention_questions_bottom_sheet.dart';
import 'package:imc/common_models/intervention_record_model.dart';
import 'package:imc/core/utils/app_localizations.dart';

class InterventionBottomSheets {
  /// [showInterventionQuestionBottomSheet]  will display a bottom sheet for intervention questions
  static void showInterventionQuestionBottomSheet(BuildContext context,
      {required String sheetTitle, required Function onYesPressed, required Function onNoPressed}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => InterventionQuestionBottomSheet(sheetTitle: sheetTitle, onYesPressed: onYesPressed, onNoPressed: onNoPressed),
    );
  }

  /// [showIsInterventionFeasibleBottomSheet]  will display a bottom sheet for is intervention feasible
  static void showIsInterventionFeasibleBottomSheet(BuildContext context,
      {Records? interventionRecord, RCInterventionDetailsModel? rcInterventionDetails, required bool isRCVal}) {
    showInterventionQuestionBottomSheet(context, sheetTitle: AppLocalizations.of(context).translate("is_intervention_feasible?"), onYesPressed: () {
      if (interventionRecord != null) {
        //if flow is RC intervention then show RC intervention options bottom sheets
        if (isRCVal) {
          showRCInterventionOptionsBottomSheet(context: context, rcInterventionRecord: interventionRecord, rcInterventionVal: rcInterventionDetails);
        } else {
          //if flow is normal intervention then, navigate to the intervention details page index
          Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
            return InterventionDetailsPageIndex(interventionRecord: interventionRecord);
          }));
        }
      }
    }, onNoPressed: () {
      if (interventionRecord != null) {
        //if flow is RC and intervention is not feasible then navigate to the RC Grip case page
        if (isRCVal) {
          Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
            return ReportingRCGripCasePage(
              isForceGrip: false,
              interventionRecord: interventionRecord,
            );
          }));
        } else {
          //if flow is Normal intervention and intervention is not feasible then navigate to the normal grip case page
          Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
            return ReportingAGripCasePage(
              isForceGrip: false,
              interventionRecord: interventionRecord,
            );
          }));
        }
      } else {
        return;
      }
    });
  }

  /// [showRCInterventionOptionsBottomSheet] function will display bottom sheet for RC intervention options available
  static void showRCInterventionOptionsBottomSheet(
      {required BuildContext context, required Records rcInterventionRecord, RCInterventionDetailsModel? rcInterventionVal}) {
    final appLocalizations = AppLocalizations.of(context);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => InterventionDetailsSelectionBottomSheet(
        listOfItems: [
          appLocalizations.translate("meter_reprogramming"),
          appLocalizations.translate("enslavement_test"),
          appLocalizations.translate("other_actions"),
        ],
        value: rcInterventionVal!.selectedRCInterventionOption,
        btnText: 'OK',
        onButtonPressed: (String? bottomSheetValue) {
          //if flow -> rc option 'meter reprogramming' selected
          if (bottomSheetValue == appLocalizations.translate("meter_reprogramming")) {
            var rcInterventionDetails = rcInterventionVal.copyWith(
                id: rcInterventionRecord.id, selectedRCInterventionOption: appLocalizations.translate("meter_reprogramming"));

            //saving the RC Intervention option selected in RC Intervention Bloc and in local DB.
            RCInterventionDetailsHelperFunctions.saveRCInterventionDetailsInBloc(context, rcInterventionDetails);
            RCInterventionDetailsHelperFunctions.saveRCDataIntoDatabase(
                selectedPage: RCInterventionDetailsUtils.MeterReprogrammngPageId, rcInterventionDetails: rcInterventionDetails);

            //navigating to the selected screen according to the selected option from the bottom sheet
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
              return MeterReprogrammingInternalPage(
                  interventionRecordVal: rcInterventionRecord, selectedPageId: RCInterventionDetailsUtils.MeterReprogrammngPageId);
            }));

            //if flow -> rc option 'enslavement test' selected
          }
          else if (bottomSheetValue == appLocalizations.translate("enslavement_test")) {
            var rcInterventionDetails =
            rcInterventionVal.copyWith(
                id: rcInterventionRecord.id, selectedRCInterventionOption: appLocalizations.translate("enslavement_test"));

            //saving the RC Intervention option selected in RC Intervention Bloc and in local DB.
            RCInterventionDetailsHelperFunctions.saveRCInterventionDetailsInBloc(context, rcInterventionDetails);
            RCInterventionDetailsHelperFunctions.saveRCDataIntoDatabase(
                selectedPage: RCInterventionDetailsUtils.EnslavementTestPageId, rcInterventionDetails: rcInterventionDetails);

            //navigating to the selected screen according to the selected option from the bottom sheet
            Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (_) {
              return TestOfEnslavementInternalPage(
                  interventionRecordVal: rcInterventionRecord, selectedPageId: RCInterventionDetailsUtils.EnslavementTestPageId);
            }));

            //if flow -> rc option 'other actions' selected
          } else if (bottomSheetValue == appLocalizations.translate("other_actions")) {
            var rcInterventionDetails =
            rcInterventionVal.copyWith(id: rcInterventionRecord.id, selectedRCInterventionOption: appLocalizations.translate("other_actions"));

            //saving the RC Intervention option selected in RC Intervention Bloc and in local DB.
            RCInterventionDetailsHelperFunctions.saveRCInterventionDetailsInBloc(context, rcInterventionDetails);
            RCInterventionDetailsHelperFunctions.saveRCDataIntoDatabase(
                selectedPage: RCInterventionDetailsUtils.OtherActionsPageId, rcInterventionDetails: rcInterventionDetails);

            //navigating to the selected screen according to the selected option from the bottom sheet
            Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (_) {
              return OtherActionInternalPage(
                  interventionRecordVal: rcInterventionRecord, selectedPageId: RCInterventionDetailsUtils.OtherActionsPageId);
            }));
          } else {
            return;
          }
        },
      ),
    );
  }
}