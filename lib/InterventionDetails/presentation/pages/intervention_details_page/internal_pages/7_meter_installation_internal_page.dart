import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/cubit/intervention_details_cubit/intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/intervention_details_page_helpers/intervention_details_page_index_helper_functions.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_image_container_widget.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_selection_container_n_bottom_sheet.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_yes_no_flags_widget.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';

class MeterInstallationInternalPage extends StatefulWidget {
  const MeterInstallationInternalPage({Key? key}) : super(key: key);

  @override
  State<MeterInstallationInternalPage> createState() => _MeterInstallationInternalPageState();
}

class _MeterInstallationInternalPageState extends State<MeterInstallationInternalPage> {


  List<String> _listOfAdditionalMaterial = [
    "Kit bas/haut",
    "Kit haut/bas",
    "Kit de pointage pour embrochable",
  ];

  int maxNumberOfImagesAllowed = 3;

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
                      SizedBox(height: 30),
                      AppBoldText(appLocalizations.translate("enter_additional_materials")),
                      SizedBox(height: 10),
                      if(_interventionDetails.enterAdditionallyMaterial != null)
                        ...List.generate((_interventionDetails.enterAdditionallyMaterial?.length ?? 0), (index) {
                          return Column(
                            children: [
                              InterventionDetailsSelectionContainer(
                                listOfItems: _listOfAdditionalMaterial,
                                hint: "Kit bas/haut",
                                value: _interventionDetails.enterAdditionallyMaterial![index],
                                onBtnPressed: (String? value) {
                                  var listOfEnterAdditionalDetails = _interventionDetails.enterAdditionallyMaterial;
                                  listOfEnterAdditionalDetails![index] = value!;
                                  var interventionDetails = _interventionDetails.copyWith(enterAdditionallyMaterial: listOfEnterAdditionalDetails);
                                  InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                                },
                              ),
                              SizedBox(height: 20)
                            ],
                          );
                        }),
                      if((_interventionDetails.enterAdditionallyMaterial?.length ?? 0) < _listOfAdditionalMaterial.length)
                        GestureDetector(
                          onTap: () {
                            // this is added to display one more image container;
                            var newList = _interventionDetails.enterAdditionallyMaterial;
                            newList!.add("");
                            var interventionDetails = _interventionDetails.copyWith(enterAdditionallyMaterial: newList);
                            InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);

                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: AppColor.kPrimaryColor),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Icon(Icons.add, color: Colors.white, size: 30),
                              )),
                        ),

                      InterventionDetailsYesNoFlagWidget(
                        title: appLocalizations.translate("inversion_between_phase_and_neutral"),
                        value: _interventionDetails.inversionBetweenPhaseAndMaterial,
                        onButtonPressed: (bool value){
                          var interventionDetails = _interventionDetails.copyWith(inversionBetweenPhaseAndMaterial: value);
                          InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                        },
                      ),
                      InterventionDetailsYesNoFlagWidget(title: appLocalizations.translate("resumption_of_enslavement"),
                        value: _interventionDetails.resumptionOfEnslavement,
                        onButtonPressed: (bool value){
                          var interventionDetails = _interventionDetails.copyWith(resumptionOfEnslavement: value);
                          InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                        },
                      ),
                      InterventionDetailsYesNoFlagWidget(title:appLocalizations.translate("ict_cabling"),
                        value: _interventionDetails.ictCabling,
                        onButtonPressed: (bool value){
                          var interventionDetails = _interventionDetails.copyWith(ictCabling: value);
                          InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                        },
                      ),
                      InterventionDetailsImageContainerWidget(title: appLocalizations.translate("photo_of_wiring(pull_the_cables)"),
                        filePath: _interventionDetails.photoOfWiringImage,
                        onImageSelected: (String? filePath){
                          var interventionDetails = _interventionDetails.copyWith(photoOfWiringImage: filePath);
                          InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                        },
                      ),

                      AppBoldText(appLocalizations.translate("photo_of_new_meter_installed")),
                      if(_interventionDetails.photosOfNewMeterInstalled != null)
                        ...List.generate((_interventionDetails.photosOfNewMeterInstalled?.length ?? 0), (index) {
                          return InterventionDetailsImageContainerWidget(
                            filePath: _interventionDetails.photosOfNewMeterInstalled![index],
                            onImageSelected: (String? filePath){
                              var photoOfIndexList = _interventionDetails.photosOfNewMeterInstalled;
                              photoOfIndexList![index] = filePath!;
                              var interventionDetails = _interventionDetails.copyWith(photosOfNewMeterInstalled: photoOfIndexList);
                              InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                            },
                          );
                        }),

                      if((_interventionDetails.photosOfNewMeterInstalled?.length ?? 0) < maxNumberOfImagesAllowed)
                        GestureDetector(
                          onTap:() {
                            // this is added to display one more image container;
                            var newList = _interventionDetails.photosOfNewMeterInstalled;
                            newList!.add("");
                            var interventionDetails = _interventionDetails.copyWith(photosOfNewMeterInstalled: newList);
                            InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);

                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: AppColor.kPrimaryColor),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Icon(Icons.add, color: Colors.white, size: 30),
                              )),
                        )
                      // InterventionDetailsImageContainerWidget(title: ''),
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