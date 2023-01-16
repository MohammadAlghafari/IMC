import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/cubit/intervention_details_cubit/intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/pages/customer_details_page/widgets/intervention_options_bottom_sheets.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/internal_pages/0_get_technician_location_map_screen.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/intervention_details_page_helpers/intervention_details_page_index_helper_functions.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/reporting_a_grip_case_page.dart';
import 'package:imc/common_models/intervention_record_model.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:imc/core/utils/permission_utils.dart';
import 'package:intl/intl.dart';

class NormalInterventionFloatingActionButton extends StatelessWidget {
  final Records interventionRecord;

  const NormalInterventionFloatingActionButton({Key? key, required this.interventionRecord}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizatons = AppLocalizations.of(context);

    return BlocBuilder<InterventionDetailsCubit, InterventionDetailsState>(
      builder: (context, state) {
        if (state is InterventionDetailsLoaded) {
          InterventionDetailsModel _interventionDetails = state.interventionDetails;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: GestureDetector(
              onTap: () {
                if (interventionRecord.interventionStatusId == null || interventionRecord.interventionStatusId != 4) {}
                PermissionHelperFunctions.enableLocation(context, () async {
                  LatLng? userLocation = await Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
                    return GetTechnicianLocationMapScreen();
                  }));
                  if (userLocation != null) {
                    String formattedDateTime = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
                    var interventionDetails = _interventionDetails.copyWith(
                        id: interventionRecord.id,
                        startTimeOfIntervention: formattedDateTime,
                        latitude: userLocation.latitude,
                        longitude: userLocation.longitude);
                    // saving start time, latitude, longitude of noraml intervention in bloc as well as in database
                    InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                    //showing intervention feasible or not bottom sheet
                    InterventionBottomSheets.showInterventionQuestionBottomSheet(context,
                        sheetTitle: appLocalizatons.translate("is_the_customer_present?"), onYesPressed: () {
                          Navigator.pop(context);
                          InterventionBottomSheets.showIsInterventionFeasibleBottomSheet(context, interventionRecord: interventionRecord, isRCVal: false);
                        }, onNoPressed: () {
                          InterventionBottomSheets.showInterventionQuestionBottomSheet(context,
                              sheetTitle: appLocalizatons.translate("is_the_meter_accessible?"), onYesPressed: () {
                                InterventionBottomSheets.showIsInterventionFeasibleBottomSheet(context,
                                    interventionRecord: interventionRecord, isRCVal: false);
                              }, onNoPressed: () {
                                //if meter is not accessible then, navigate to normal grip case intervention page
                                Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
                                  return ReportingAGripCasePage(
                                    isForceGrip: false,
                                    interventionRecord: interventionRecord,
                                  );
                                }));
                              });
                        });
                  }
                });
              },
              child: Container(
                width: 1.sw,
                height: 45,
                decoration: BoxDecoration(color: AppColor.kPrimaryColor, borderRadius: BorderRadius.circular(20)),
                child: Center(child: AppBoldText(appLocalizatons.translate("start"), color: AppColor.kWhiteColor)),
              ),
            ),
          );
        } else
          return SizedBox.shrink();
      },
    );
  }
}
