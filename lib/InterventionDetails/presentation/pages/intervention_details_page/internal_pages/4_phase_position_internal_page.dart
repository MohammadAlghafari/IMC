import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/cubit/intervention_details_cubit/intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/intervention_details_page_helpers/intervention_details_page_index_helper_functions.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/Intervention_details_textfiled_large.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_image_container_widget.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_yes_no_flags_widget.dart';
import 'package:imc/core/utils/app_localizations.dart';

class PhasePositionInternalPage extends StatelessWidget {
  const PhasePositionInternalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return BlocBuilder<InterventionDetailsCubit, InterventionDetailsState>(
      builder: (context, state) {
        if (state is InterventionDetailsLoaded) {
          InterventionDetailsModel _interventionDetails = state.interventionDetails;
          return Container(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  InterventionDetailsImageContainerWidget(
                    title: appLocalizations.translate("position_of_the_phase_conductor"),
                    filePath: _interventionDetails.positionOfPhaseConductorImage,
                    onImageSelected: (String? filePath) {
                      var interventionDetails = _interventionDetails.copyWith(positionOfPhaseConductorImage: filePath);
                      InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                    },
                  ),
                  InterventionDetailsYesNoFlagWidget(
                    title: appLocalizations.translate("is_the_driver_well_positioned"),
                    value: _interventionDetails.isTheDriverWellPositioned,
                    onButtonPressed: (bool value) {
                      var interventionDetails = _interventionDetails.copyWith(isTheDriverWellPositioned: value);
                      InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                    },
                  ),
                  SizedBox(height: 0.02.sh),
                  if (_interventionDetails.isTheDriverWellPositioned == false)
                    InterventionDetailsTextFieldLarge(
                      initialText: _interventionDetails.reasonFOrDriverNotWellPositioned,
                      onChanged: (String value) {
                        var interventionDetails = _interventionDetails.copyWith(reasonFOrDriverNotWellPositioned: value);
                        InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                      },
                    )
                ],
              ),
            ),
          ));
        } else
          return SizedBox.shrink();
      },
    );
  }
}
