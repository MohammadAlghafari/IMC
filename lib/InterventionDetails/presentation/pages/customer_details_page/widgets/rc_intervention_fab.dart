import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/pages/rc_grip_case_page.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/pages/rc_intervention_details_pages/rc_intervention_details_page_helpers/rc_intervention_details_page_index_helper_functions.dart';
import 'package:imc/InterventionDetails/data/models/rc_intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/cubit/rc_intervention_details_cubit/rc_intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/pages/customer_details_page/widgets/intervention_options_bottom_sheets.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/internal_pages/0_get_technician_location_map_screen.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:imc/core/utils/permission_utils.dart';
import 'package:intl/intl.dart';

import '../../../../../common_models/intervention_record_model.dart';

class RcInterventionFloatingActionButton extends StatelessWidget {
  final Records interventionRecord;
  const RcInterventionFloatingActionButton({Key? key, required this.interventionRecord}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizatons = AppLocalizations.of(context);

    return BlocBuilder<RCInterventionDetailsCubit, RCInterventionDetailsState>(
      builder: (context, state) {
        if (state is RCInterventionDetailsLoaded) {
          RCInterventionDetailsModel _rcInterventionDetails = state.rcInterventionDetails;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: GestureDetector(
              onTap: () {
                PermissionHelperFunctions.enableLocation(context, () async {
                  LatLng? userLocation = await Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
                    return GetTechnicianLocationMapScreen();
                  }));
                  if (userLocation != null) {
                    String formattedDateTime = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
                    var rcInterventionDetails = _rcInterventionDetails.copyWith(
                        id: interventionRecord.id,
                        startTimeOfIntervention: formattedDateTime,
                        latitude: userLocation.latitude,
                        longitude: userLocation.longitude);

                    // saving start time, latitude, longitude of rc intervention in bloc as well as in database
                    RCInterventionDetailsHelperFunctions.saveRCInterventionDetailsInBloc(context, rcInterventionDetails);
                    RCInterventionDetailsHelperFunctions.saveRCDataIntoDatabase(rcInterventionDetails: rcInterventionDetails);

                    //Showing intervention feasible or nor bottom sheet with customer available or not question
                    InterventionBottomSheets.showInterventionQuestionBottomSheet(context,
                        sheetTitle: "(RC) " + appLocalizatons.translate("is_the_customer_present?"), onYesPressed: () {
                          Navigator.pop(context);
                          InterventionBottomSheets.showIsInterventionFeasibleBottomSheet(
                            context,
                            rcInterventionDetails: rcInterventionDetails,
                            interventionRecord: interventionRecord,
                            isRCVal: true,
                          );
                        }, onNoPressed: () {
                          InterventionBottomSheets.showInterventionQuestionBottomSheet(context,
                              sheetTitle: '(RC) ' + appLocalizatons.translate("is_the_meter_accessible?"), onYesPressed: () {
                                InterventionBottomSheets.showIsInterventionFeasibleBottomSheet(
                                  context,
                                  rcInterventionDetails: rcInterventionDetails,
                                  interventionRecord: interventionRecord,
                                  isRCVal: true,
                                );
                                //if the meter is not accessible then navigate to rc grip case page
                              }, onNoPressed: () {
                                Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
                                  return ReportingRCGripCasePage(isForceGrip: false, interventionRecord: interventionRecord);
                                }));
                                return;
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