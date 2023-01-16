import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/cubit/intervention_details_cubit/intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/intervention_details_page_helpers/intervention_details_page_index_helper_functions.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/Intervention_details_textfiled_large.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_yes_no_flags_widget.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';

class CircuitBreakerReplacementInternalPage extends StatelessWidget {
  const CircuitBreakerReplacementInternalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<InterventionDetailsCubit, InterventionDetailsState>(
      builder: (context, state) {
        if(state is InterventionDetailsLoaded){
          InterventionDetailsModel _interventionDetails = state.interventionDetails;
          return Container(
              child: SingleChildScrollView(
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
                        child: InterventionDetailsYesNoFlagWidget(
                          title: appLocalizations.translate("has_the_circuit_breaker_been_replaced"),
                          value: _interventionDetails.hasTheCircuitBreakerBeenReplaced,
                          onButtonPressed: (bool value){
                            var interventionDetails = _interventionDetails.copyWith(hasTheCircuitBreakerBeenReplaced: value);
                            InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                          },
                        )),

                    if(_interventionDetails.hasTheCircuitBreakerBeenReplaced == false)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InterventionDetailsTextFieldLarge(
                        initialText: _interventionDetails.resonForCircuitBreakerNonReplacement,
                        onChanged: (String value){
                          var interventionDetails = _interventionDetails.copyWith(resonForCircuitBreakerNonReplacement: value);
                          InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);

                        },
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
