import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/cubit/intervention_details_cubit/intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/intervention_details_page_helpers/intervention_details_page_index_helper_functions.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_image_container_widget.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';

class InstallationPolicyInternalPage extends StatelessWidget {
  const InstallationPolicyInternalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<InterventionDetailsCubit, InterventionDetailsState>(
      builder: (context, state) {
        if(state is InterventionDetailsLoaded){
          InterventionDetailsModel _interventionDetails = state.interventionDetails;
          return Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      AppBoldText(appLocalizations.translate("ccpi_logging")),
                      SizedBox(height: 10),
                      AppBoldText(appLocalizations.translate("before"), color: AppColor.kPrimaryColor),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InterventionDetailsImageContainerWidget(
                              filePath: _interventionDetails.beforeCcpiLoggingImage1,
                              onImageSelected: (String? filePath){
                                var interventionDetails = _interventionDetails.copyWith(beforeCcpiLoggingImage1: filePath);
                                InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                              },
                            ),
                            InterventionDetailsImageContainerWidget(
                              filePath: _interventionDetails.beforeCcpiLoggingImage2,
                              onImageSelected: (String? filePath){
                                var interventionDetails = _interventionDetails.copyWith(beforeCcpiLoggingImage2: filePath);
                                InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      AppBoldText(appLocalizations.translate("after"), color: AppColor.kPrimaryColor),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InterventionDetailsImageContainerWidget(
                              filePath: _interventionDetails.afterCcpiLoggingImage1,
                              onImageSelected: (String? filePath){
                                var interventionDetails = _interventionDetails.copyWith(afterCcpiLoggingImage1: filePath);
                                InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                              },
                            ),
                            InterventionDetailsImageContainerWidget(
                              filePath: _interventionDetails.afterCcpiLoggingImage2,
                              onImageSelected: (String? filePath){
                                var interventionDetails = _interventionDetails.copyWith(afterCcpiLoggingImage2: filePath);
                                InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                              },
                            ),
                          ],
                        ),
                      ),
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