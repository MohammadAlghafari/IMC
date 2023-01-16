import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/cubit/intervention_details_cubit/intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/intervention_details_page_helpers/intervention_details_page_index_helper_functions.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/Intervention_details_textfiled_large.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_image_container_widget.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_selection_container_n_bottom_sheet.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_textfield_small.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_yes_no_flags_widget.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/utils/app_localizations.dart';

class ProgrammingInternalPage extends StatelessWidget {
  const ProgrammingInternalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<InterventionDetailsCubit, InterventionDetailsState>(
      builder: (context, state) {
        if(state is InterventionDetailsLoaded){
          InterventionDetailsModel _interventionDetails = state.interventionDetails;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  InterventionDetailsYesNoFlagWidget(
                    title: appLocalizations.translate("status_of_the_installed_meter"),
                    yesButtonText: appLocalizations.translate("correct"),
                    noButtonText:appLocalizations.translate("defective"),
                    value: _interventionDetails.statusOfInstalledMeter,
                    onButtonPressed: (bool value){
                      var interventionDetails = _interventionDetails.copyWith(statusOfInstalledMeter: value);
                      InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                    },
                  ),

                  if(_interventionDetails.statusOfInstalledMeter == false)
                    Column(
                      children: [
                        SizedBox(height: 10),
                        AppBoldText(appLocalizations.translate("enter_the_anomaly")),
                        SizedBox(height: 10),
                        InterventionDetailsSelectionContainer(
                          listOfItems: ["Inversion","Position","Materiel"],
                          hint: 'Inversion',
                          value: _interventionDetails.enterTheAnomalyProgramming,
                          onBtnPressed: (String? value) {
                            var interventionDetails = _interventionDetails.copyWith(enterTheAnomalyProgramming: value);
                            InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                          },
                        ),
                        SizedBox(height: 30),
                        AppBoldText(appLocalizations.translate("serial_number")),
                        SizedBox(height: 15),
                        InterventionDetailsTextFieldSmall(
                          hintText: "00000000",
                          initialText: _interventionDetails.serialNumber,
                          onChanged: (String value){
                            var interventionDetails = _interventionDetails.copyWith(serialNumber: value);
                            InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);

                          },
                        ),
                        SizedBox(height: 15),
                        InterventionDetailsImageContainerWidget(
                          title:appLocalizations.translate("meter_anomaly"),
                          filePath: _interventionDetails.meterAnomalyImage,
                          onImageSelected: (String? filePath){
                            var interventionDetails = _interventionDetails.copyWith(meterAnomalyImage: filePath);
                            InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                          },
                        ),
                        SizedBox(height: 30),
                        AppBoldText(appLocalizations.translate("additional_information")),
                        SizedBox(height: 15),
                        InterventionDetailsTextFieldLarge(
                          hintText:appLocalizations.translate("enter_additional_details_here"),
                          initialText: _interventionDetails.additionalInformationProgramming,
                          onChanged: (String value){
                            var interventionDetails = _interventionDetails.copyWith(additionalInformationProgramming: value);
                            InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);

                          },
                        ),
                        SizedBox(height: 0.02.sh,)
                      ],
                    )

                ],
              ),
            ),
          );
        }
        else return SizedBox.shrink();
      },
    );

  }
}