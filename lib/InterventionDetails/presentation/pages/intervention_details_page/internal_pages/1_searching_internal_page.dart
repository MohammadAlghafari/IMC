import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/cubit/intervention_details_cubit/intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/intervention_details_page_helpers/intervention_details_page_index_helper_functions.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_image_container_widget.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_yes_no_flags_widget.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_help_details_bottom_sheet.dart';
import 'package:imc/common_models/intervention_record_model.dart';
import 'package:imc/core/utils/app_localizations.dart';


class SearchingInternalPage extends StatelessWidget {
  final Records interventionRecord;
  const SearchingInternalPage({Key? key, required this.interventionRecord}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return BlocBuilder<InterventionDetailsCubit, InterventionDetailsState>(
      builder: (context, state) {
        if (state is InterventionDetailsLoaded) {
          InterventionDetailsModel _interventionDetails = state.interventionDetails;
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(children: [
                SizedBox(
                  height: 0.02.sh,
                ),
                InterventionDetailsYesNoFlagWidget(
                  value: _interventionDetails.canYouGetStartedToday,
                  title: appLocalizations.translate("can_you_get_started_safely"),
                  onButtonPressed: (bool value) {
                    var interventionDetails = _interventionDetails.copyWith(canYouGetStartedToday: value);
                    InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                    if (!value) {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => InterventionHelpDetailsBottomSheet(isForceGrip: true,interventionRecords: interventionRecord),
                      );
                    }
                  },
                ),
                if(_interventionDetails.canYouGetStartedToday ==true)InterventionDetailsYesNoFlagWidget(
                  title: appLocalizations.translate("presence_of_pnt"),
                  value: _interventionDetails.presenceOfPnt,
                  onButtonPressed: (bool value) {
                    var interventionDetails = _interventionDetails.copyWith(presenceOfPnt: value);
                    InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                    if (!value) {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => InterventionHelpDetailsBottomSheet(isForceGrip: true,interventionRecords: interventionRecord),
                      );
                    }
                  },
                ),
                if (_interventionDetails.canYouGetStartedToday == true && _interventionDetails.presenceOfPnt == true)
                  InterventionDetailsImageContainerWidget(
                    title: appLocalizations.translate("local"),
                    filePath: _interventionDetails.localMeterImage,
                    onImageSelected: (String? filePath) {
                      var interventionDetails = _interventionDetails.copyWith(localMeterImage: filePath);
                      InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                    },
                  ),
                if (_interventionDetails.canYouGetStartedToday == true && _interventionDetails.presenceOfPnt == true)
                  InterventionDetailsImageContainerWidget(
                    title: appLocalizations.translate("meter_number"),
                    filePath: _interventionDetails.meterNumberImage,
                    onImageSelected: (String? filePath) {
                      var interventionDetails = _interventionDetails.copyWith(meterNumberImage: filePath);
                      InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                    },
                  ),
                if (_interventionDetails.canYouGetStartedToday == true && _interventionDetails.presenceOfPnt == true)
                  InterventionDetailsImageContainerWidget(
                    title: appLocalizations.translate("counting_pannel"),
                    filePath: _interventionDetails.countingPanelImage,
                    onImageSelected: (String? filePath) {
                      var interventionDetails = _interventionDetails.copyWith(countingPanelImage: filePath);
                      InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                    },
                  ),
                SizedBox(
                  height: 0.02.sh,
                ),
                if (_interventionDetails.canYouGetStartedToday == true && _interventionDetails.presenceOfPnt == true)
                  InterventionDetailsYesNoFlagWidget(
                    title: appLocalizations.translate("confirm_ppe_ports"),
                    value: _interventionDetails.confirmPpePorts,
                    onButtonPressed: (bool value) {
                      var interventionDetails = _interventionDetails.copyWith(confirmPpePorts: value);
                      InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                    },
                  ),
                if (_interventionDetails.canYouGetStartedToday == true && _interventionDetails.presenceOfPnt == true)
                  InterventionDetailsYesNoFlagWidget(
                    title: appLocalizations.translate("confirm_installation_of_macarons"),
                    value: _interventionDetails.confirmMacronsInstallation,
                    onButtonPressed: (bool value) {
                      var interventionDetails = _interventionDetails.copyWith(confirmMacronsInstallation: value);
                      InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                    },
                  ),
                if (_interventionDetails.canYouGetStartedToday == true && _interventionDetails.presenceOfPnt == true)
                  InterventionDetailsYesNoFlagWidget(
                    title: appLocalizations.translate("confirm_top"),
                    value: _interventionDetails.confirmTop,
                    onButtonPressed: (bool value) {
                      var interventionDetails = _interventionDetails.copyWith(confirmTop: value);
                      InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                    },
                  ),
                SizedBox(
                  height: 0.02.sh,
                ),
              ]),
            ),
          );
        } else
          return SizedBox.shrink();
      },
    );
  }
}