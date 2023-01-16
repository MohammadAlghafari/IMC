import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/cubit/intervention_details_cubit/intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_image_container_widget.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_yes_no_flags_widget.dart';
import 'package:imc/core/utils/app_localizations.dart';

import '../intervention_details_page_helpers/intervention_details_page_index_helper_functions.dart';

class MeterDepositInternalPage extends StatelessWidget {
  const MeterDepositInternalPage({Key? key}) : super(key: key);

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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      InterventionDetailsYesNoFlagWidget(title: appLocalizations.translate("identification_between_phase_and_neutral"),
                        value: _interventionDetails.identificationBetweenPhaseAndNeutral,
                        onButtonPressed: (bool value){
                          var interventionDetails = _interventionDetails.copyWith(identificationBetweenPhaseAndNeutral: value);
                          InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                        },
                      ),
                      InterventionDetailsImageContainerWidget(title: appLocalizations.translate("old_meter"),
                        filePath: _interventionDetails.oldMeterImage,
                        onImageSelected: (String? filePath){
                          var interventionDetails = _interventionDetails.copyWith(oldMeterImage: filePath);
                          InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                        },
                      ),
                      InterventionDetailsImageContainerWidget(title: appLocalizations.translate("terminal_block_of_tightened_power"),
                        filePath: _interventionDetails.terminalBlockTightenedPowerImage,
                        onImageSelected: (String? filePath){
                          var interventionDetails = _interventionDetails.copyWith(terminalBlockTightenedPowerImage: filePath);
                          InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                        },
                      ),
                      InterventionDetailsImageContainerWidget(title: appLocalizations.translate("terminal_cover_put_back_in_place"),
                        filePath: _interventionDetails.terminalCoverPutBackInPlaceImage,
                        onImageSelected: (String? filePath){
                          var interventionDetails = _interventionDetails.copyWith(terminalCoverPutBackInPlaceImage: filePath);
                          InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                        },
                      ),
                      InterventionDetailsImageContainerWidget(title: appLocalizations.translate("old_meter_deposited"),
                        filePath: _interventionDetails.oldMeterDepositedImage,
                        onImageSelected: (String? filePath){
                          var interventionDetails = _interventionDetails.copyWith(oldMeterDepositedImage: filePath);
                          InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                        },
                      ),
                      InterventionDetailsImageContainerWidget(title: appLocalizations.translate("electrical_equipment_deposited"),
                        filePath: _interventionDetails.electricalEquipmentDepositedImage,
                        onImageSelected: (String? filePath){
                          var interventionDetails = _interventionDetails.copyWith(electricalEquipmentDepositedImage: filePath);
                          InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                        },
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ));
        }
        else return SizedBox.shrink();
      },
    );

  }
}
