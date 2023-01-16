import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/cubit/intervention_details_cubit/intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/intervention_details_page_helpers/intervention_details_page_index_helper_functions.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/Intervention_details_textfiled_large.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_yes_no_flags_widget.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/utils/app_localizations.dart';

class CircuitBreakerInterlock extends StatelessWidget {
  const CircuitBreakerInterlock({Key? key}) : super(key: key);

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
                    title: appLocalizations.translate("circuit_breaker_properly_engaged"),
                    value: _interventionDetails.circuitBreakerProperlyEngaged,
                    onButtonPressed: (bool value) {
                      var interventionDetails = _interventionDetails.copyWith(circuitBreakerProperlyEngaged: value);
                      InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                    },
                  ),
                  //TODO - NOT PROVIDED BY CLIENT : uncomment after dynamic value for (enterTheAnomalyCircuitBreakerInterlock) is provided by the client
                  // if (_interventionDetails.circuitBreakerProperlyEngaged == false)
                  //   Column(
                  //     children: [
                  //       SizedBox(height: 10),
                  //       AppBoldText(appLocalizations.translate("enter_the_anomaly")),
                  //       SizedBox(height: 0.02.sh),
                  //       InterventionDetailsSelectionContainer(
                  //         hint: "lorem upus",
                  //         value: _interventionDetails.enterTheAnomalyCircuitBreakerInterlock,
                  //         listOfItems: ["LOREM UPUS"],
                  //         onBtnPressed: (String? value) {
                  //           var interventionDetails = _interventionDetails.copyWith(enterTheAnomalyCircuitBreakerInterlock: value);
                  //           InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                  //         },
                  //       ),
                  //       SizedBox(height: 0.02.sh)
                  //     ],
                  //   ),
                  if (_interventionDetails.circuitBreakerProperlyEngaged != null)
                    Column(
                      children: [
                        AppBoldText(appLocalizations.translate("additional_information")),
                        SizedBox(height: 0.02.sh),
                        InterventionDetailsTextFieldLarge(
                          hintText: appLocalizations.translate("observation_ici"),
                          initialText: _interventionDetails.additionalInformationCircuitBreakerInterlock,
                          onChanged: (String value) {
                            var interventionDetails = _interventionDetails.copyWith(additionalInformationCircuitBreakerInterlock: value);
                            InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                          },
                        ),
                      ],
                    ),
                ],
              ),
            ),
          );
        } else
          return SizedBox.shrink();
      },
    );
  }
}