import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/cubit/intervention_details_cubit/intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/intervention_details_page_helpers/intervention_details_page_index_helper_functions.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_image_container_widget.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_selection_container_n_bottom_sheet.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_yes_no_flags_widget.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';

class CircuitBreakerInternalPage extends StatefulWidget {
  CircuitBreakerInternalPage({Key? key}) : super(key: key);

  @override
  State<CircuitBreakerInternalPage> createState() => _CircuitBreakerInternalPageState();
}

class _CircuitBreakerInternalPageState extends State<CircuitBreakerInternalPage> {
  String? selectedValue;
  String yearDropDownValue = DateTime.now().year.toString();


  List<String> _listOfYears = [for (var i = 0; i < 10; i += 1) (DateTime.now().year + i).toString()];


  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return BlocBuilder<InterventionDetailsCubit, InterventionDetailsState>(
      builder: (context, state) {
        if (state is InterventionDetailsLoaded) {
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
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AppBoldText(appLocalizations.translate("beach"), color: AppColor.kPrimaryColor, fontSize: 14.sp),
                                  AppBoldText("15 TO 45 A", color: AppColor.kBlackColor, fontSize: 14.sp),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AppBoldText(appLocalizations.translate("intensity"), color: AppColor.kPrimaryColor, fontSize: 14.sp),
                                  AppBoldText("30A", color: AppColor.kBlackColor, fontSize: 14.sp),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AppBoldText(appLocalizations.translate("power"), color: AppColor.kPrimaryColor, fontSize: 14.sp),
                                  AppBoldText("6KVA", color: AppColor.kBlackColor, fontSize: 14.sp),
                                ],
                              ),
                            )
                          ]),
                          SizedBox(height: 10),
                          Divider(),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          AppBoldText(appLocalizations.translate("circuit_breaker_brand")),
                          SizedBox(height: 10),
                          InterventionDetailsSelectionContainer(
                            //  hint: "base rate",
                            hint: appLocalizations.translate("base_rate"),
                            // listOfItems: ["base rate"],
                            value: _interventionDetails.circuitBreakerBrand,
                            onBtnPressed: (String? value) {
                              var interventionDetails = _interventionDetails.copyWith(circuitBreakerBrand: value);
                              InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                            },
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    AppBoldText(appLocalizations.translate("month"), color: AppColor.kPrimaryColor, fontSize: 14.sp),
                                    InterventionDetailsSelectionContainer(
                                      hint: appLocalizations.translate("january"),
                                      // hint: "${AppConstant.listOfMonths[DateTime.now().month - 1]}",
                                      listOfItems: [
                                        appLocalizations.translate("january"),
                                        appLocalizations.translate("february"),
                                        appLocalizations.translate("march"),
                                        appLocalizations.translate("april"),
                                        appLocalizations.translate("may"),
                                        appLocalizations.translate("june"),
                                        appLocalizations.translate("july"),
                                        appLocalizations.translate("august"),
                                        appLocalizations.translate("september"),
                                        appLocalizations.translate("october"),
                                        appLocalizations.translate("november"),
                                        appLocalizations.translate("december"),
                                      ],

                                      value: _interventionDetails.month,
                                      onBtnPressed: (String? value) {
                                        var interventionDetails = _interventionDetails.copyWith(month: value);
                                        InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  children: [
                                    AppBoldText(appLocalizations.translate("year"), color: AppColor.kPrimaryColor, fontSize: 14.sp),
                                    InterventionDetailsSelectionContainer(
                                      hint: "${yearDropDownValue}",
                                      listOfItems: _listOfYears,
                                      value: _interventionDetails.year,
                                      onBtnPressed: (String? value) {
                                        var interventionDetails = _interventionDetails.copyWith(year: value);
                                        InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InterventionDetailsImageContainerWidget(
                            title: appLocalizations.translate("serial_number_scan"),
                            filePath: _interventionDetails.serialNumberScanImage,
                            onImageSelected: (String? filePath) {
                              var interventionDetails = _interventionDetails.copyWith(serialNumberScanImage: filePath);
                              InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                            },
                          ),
                          InterventionDetailsImageContainerWidget(
                            title: appLocalizations.translate("size_control"),
                            filePath: _interventionDetails.sizeControlImage,
                            onImageSelected: (String? filePath) {
                              var interventionDetails = _interventionDetails.copyWith(sizeControlImage: filePath);
                              InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                            },
                          ),
                          InterventionDetailsYesNoFlagWidget(
                            title: appLocalizations.translate("test_of_vat_of_circuit_breaker"),
                            value: _interventionDetails.testOfVat,
                            onButtonPressed: (bool value) {
                              var interventionDetails = _interventionDetails.copyWith(testOfVat: value);
                              InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                            },
                          ),
                          InterventionDetailsYesNoFlagWidget(
                            title: appLocalizations.translate("setting_anomaly"),
                            value: _interventionDetails.settingsAnomaly,
                            onButtonPressed: (bool value) {
                              var interventionDetails = _interventionDetails.copyWith(settingsAnomaly: value);
                              InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                            },
                          ),
                          InterventionDetailsYesNoFlagWidget(
                            title: appLocalizations.translate("circuit_breaker_malfunction"),
                            value: _interventionDetails.circuitBreakerMalfuncttion,
                            onButtonPressed: (bool value) {
                              var interventionDetails = _interventionDetails.copyWith(circuitBreakerMalfuncttion: value);
                              InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        } else
          return SizedBox.shrink();
      },
    );
  }
}