import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/cubit/intervention_details_cubit/intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/intervention_details_page_helpers/intervention_details_page_index_helper_functions.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/Intervention_details_textfiled_large.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_image_container_widget.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_textfield_small.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_yes_no_flags_widget.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';

class CircuitBreakerSettingsInternalPage extends StatelessWidget {
  const CircuitBreakerSettingsInternalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<InterventionDetailsCubit, InterventionDetailsState>(
      builder: (context, state) {
        if(state is InterventionDetailsLoaded){
          InterventionDetailsModel _interventionDetails = state.interventionDetails;
          return Container(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppBoldText(appLocalizations.translate("mark"),
                                        color: AppColor.kPrimaryColor, fontSize: 12),
                                    AppBoldText("ACTARIS",
                                        color: AppColor.kBlackColor, fontSize: 12),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppBoldText(appLocalizations.translate("serial_number"),
                                        color: AppColor.kPrimaryColor, fontSize: 12),
                                    AppBoldText("123456789",
                                        color: AppColor.kBlackColor, fontSize: 12),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppBoldText(appLocalizations.translate("date"),
                                        color: AppColor.kPrimaryColor, fontSize: 12),
                                    AppBoldText("01/1999",
                                        color: AppColor.kBlackColor, fontSize: 12),
                                  ],
                                )
                              ]),
                          SizedBox(height: 10),
                          Divider(),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          InterventionDetailsYesNoFlagWidget(title: appLocalizations.translate("circuit_breaker_lead"),
                            value: _interventionDetails.circuitBreakerLead,
                            onButtonPressed: (bool value){
                              var interventionDetails = _interventionDetails.copyWith(circuitBreakerLead: value);
                              InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                            },
                          ),
                          if(_interventionDetails.circuitBreakerLead == false)
                          InterventionDetailsTextFieldLarge(
                            initialText: _interventionDetails.reasonForNoncircuitBreakerLead,
                            onChanged: (String value){
                              var interventionDetails = _interventionDetails.copyWith(reasonForNoncircuitBreakerLead: value);
                              InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);

                            },
                          ),
                          InterventionDetailsYesNoFlagWidget(title:appLocalizations.translate("lead_ccpi"),
                            value: _interventionDetails.leadCCPI,
                            onButtonPressed: (bool value){
                              var interventionDetails = _interventionDetails.copyWith(leadCCPI: value);
                              InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                            },
                          ),
                          if(_interventionDetails.leadCCPI == false)
                          InterventionDetailsTextFieldLarge(
                            initialText: _interventionDetails.indicateReasonForCircuitBreakerSettings,
                            onChanged: (String value){
                              var interventionDetails = _interventionDetails.copyWith(indicateReasonForCircuitBreakerSettings: value);
                              InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);

                            },
                          ),
                          SizedBox(height: 30),

                          InterventionDetailsImageContainerWidget(title: appLocalizations.translate("circuit_breaker_gauge"),
                            filePath: _interventionDetails.circuitBreakerGuageImage,
                            onImageSelected: (String? filePath){
                              var interventionDetails = _interventionDetails.copyWith(circuitBreakerGuageImage: filePath);
                              InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                            },
                          ),
                          InterventionDetailsYesNoFlagWidget(
                              title: appLocalizations.translate("modified_circuit_breaker_capacity"),
                            value: _interventionDetails.modifiedCircuitBreakerCapacity,
                            onButtonPressed: (bool value){
                              var interventionDetails = _interventionDetails.copyWith(modifiedCircuitBreakerCapacity: value);
                              InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                            },
                          ),
                          SizedBox(height: 0.02.sh),
                          if(_interventionDetails.modifiedCircuitBreakerCapacity == true)
                          AppBoldText(appLocalizations.translate("calibrated_power")),
                          SizedBox(height: 15),
                          if(_interventionDetails.modifiedCircuitBreakerCapacity == true)
                          InterventionDetailsTextFieldSmall(
                            hintText: "0000", label: appLocalizations.translate("circuit_breaker_lead"),
                            keyboardType: TextInputType.number,
                            initialText: _interventionDetails.calibratedPower,
                            onChanged: (String value){
                              var interventionDetails = _interventionDetails.copyWith(calibratedPower: value);
                              InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);

                            },
                          ),
                          if(_interventionDetails.modifiedCircuitBreakerCapacity == false)
                          InterventionDetailsTextFieldLarge(
                            initialText: _interventionDetails.reasonForNonModifiedCircuitBreakerCapacity,
                            onChanged: (String value){
                              var interventionDetails = _interventionDetails.copyWith(reasonForNonModifiedCircuitBreakerCapacity: value);
                              InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                            },
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        }
        else return SizedBox.shrink();
      },
    );

  }
}
