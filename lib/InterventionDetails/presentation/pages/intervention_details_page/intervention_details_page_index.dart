import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:imc/InterventionDetails/presentation/cubit/intervention_details_cubit/intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/internal_pages/14_upload_intervention_pdf_screen.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/intervention_details_page_helpers/intervention_details_page_index_helper_functions.dart';
import 'package:imc/InterventionDetails/presentation/utils/intervention_pdf_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imc/common_widgets/common_rounded_button.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/utils/app_function.dart';
import "package:intl/intl.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/internal_pages/10_programming_intenal_page.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/internal_pages/12_account_intervention_summary_internal_page.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/internal_pages/11_circuit_breaker_interlock.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/internal_pages/13_customer_feedback_internal_page.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/internal_pages/2_circuit_braker_internal_page.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/internal_pages/5_installation_policy_internal_page.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/internal_pages/3_meter_reading_internal_page.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/internal_pages/1_searching_internal_page.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/internal_pages/6_meter_deposit_internal_page.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/internal_pages/7_meter_installation_internal_page.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/internal_pages/8_circuit_breaker_replacement_internal_page.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/internal_pages/9_circuit_breaker_settings_internal_page.dart';
import 'package:imc/InterventionDetails/presentation/utils/intervention_details_utils.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_help_details_bottom_sheet.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/notify_bottom_sheet.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/constant/app_icons.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:signature/signature.dart';
import '../../../../common_models/intervention_record_model.dart';
import 'internal_pages/4_phase_position_internal_page.dart';

class InterventionDetailsPageIndex extends StatefulWidget {
  final Records interventionRecord;
  const InterventionDetailsPageIndex({Key? key, required this.interventionRecord}) : super(key: key);

  @override
  State<InterventionDetailsPageIndex> createState() => _InterventionDetailsPageIndexState();
}

class _InterventionDetailsPageIndexState extends State<InterventionDetailsPageIndex> {
  late int selectedPage;
  int totalNumberOfPages = 13;
  PageController _pageController = PageController();
  late final SignatureController _signatureController;

  @override
  void initState() {
    super.initState();
    //initialising selectedPage value to 0
    selectedPage = 0;
    //initialising the signatureController
    initSignatureController();
  }

  ///[initSignatureController] will initilise the signature controller with it's different properites
  void initSignatureController() {
    _signatureController = SignatureController(
        penStrokeWidth: 3,
        penColor: Colors.black,
        onDrawEnd: () {
          saveSignatureInBloc();
        });
  }

  /// This function[saveSignatureInBloc] tells whether the customer has added the signature or not
  void saveSignatureInBloc() {
    final _bloc = BlocProvider.of<InterventionDetailsCubit>(context);
    InterventionDetailsModel interventionDetails = _bloc.getInterventionDetails;
    final newInterventionDetails = interventionDetails.copyWith(customerSignAdded: true);
    _bloc.saveInterventionDetailsInBloc(newInterventionDetails);
  }


  ///[_generateSignature] Function to generate customer signature when 'submit' button pressed
  Future<File?> _generateSignature(InterventionDetailsModel _interventionDetails) async {
    File? convertedImageToFile;
    if (_signatureController.isNotEmpty) {
      var image = await _signatureController.toImage();
      if (image != null) {
        convertedImageToFile = await convertByteDataToFile(image, _interventionDetails.id!);
      }
    }
    return convertedImageToFile;
  }

  ///disposing the signature controller
  @override
  void dispose() {
    _signatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return BlocBuilder<InterventionDetailsCubit, InterventionDetailsState>(
      builder: (context, state) {
        if (state is InterventionDetailsLoaded) {
          InterventionDetailsModel _interventionDetails = state.interventionDetails;
          print(_interventionDetails.toJson().toString());
          return WillPopScope(
            onWillPop: () async {
              // if back is pressed then animate to previous page
              if (selectedPage == InterventionDetailsUtils.searchingPagePageId) {
                return await true;
              } else {
                animateToPage(--selectedPage);
              }
              return await false;
            },
            child: Scaffold(
              body: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 0.02.sh),
                          decoration: BoxDecoration(
                              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0, offset: Offset(0, 5))],
                              color: AppColor.kPrimaryColor,
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25.r), bottomRight: Radius.circular(25.r))),
                          child: Padding(
                            padding: EdgeInsets.only(left: 5, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).viewPadding.top,
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                  IconButton(
                                      onPressed: () {
                                        if (selectedPage == 0) {
                                          Navigator.pop(context);
                                        }
                                        animateToPage(--selectedPage);
                                      },
                                      icon: Icon(Icons.arrow_back, color: AppColor.kWhiteColor)),
                                  AppBoldText("Mr John Doe", color: AppColor.kWhiteColor, fontSize: 18),
                                  GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          builder: (context) =>
                                              InterventionHelpDetailsBottomSheet(isForceGrip: true, interventionRecords: widget.interventionRecord),
                                        );
                                      },
                                      child: Image.asset(AppIcons.help, scale: 3.5)),
                                ]),
                                SizedBox(height: 10),
                                LinearPercentIndicator(
                                  barRadius: Radius.circular(15),
                                  lineHeight: 6,
                                  percent: selectedPage == 0
                                      ? 1 / totalNumberOfPages
                                      : selectedPage == 1
                                      ? 2 / totalNumberOfPages
                                      : selectedPage == 2
                                      ? 3 / totalNumberOfPages
                                      : selectedPage == 3
                                      ? 4 / totalNumberOfPages
                                      : selectedPage == 4
                                      ? 5 / totalNumberOfPages
                                      : selectedPage == 5
                                      ? 6 / totalNumberOfPages
                                      : selectedPage == 6
                                      ? 7 / totalNumberOfPages
                                      : selectedPage == 7
                                      ? 8 / totalNumberOfPages
                                      : selectedPage == 8
                                      ? 9 / totalNumberOfPages
                                      : selectedPage == 9
                                      ? 10 / totalNumberOfPages
                                      : selectedPage == 10
                                      ? 11 / totalNumberOfPages
                                      : selectedPage == 11
                                      ? 12 / totalNumberOfPages
                                      : 1,
                                  progressColor: AppColor.kSuccessColor,
                                  backgroundColor: Colors.white,
                                ),
                                Transform.translate(
                                  offset: Offset(0, 0.04.sh),
                                  // top: 0.16.sh,
                                  child: Container(
                                    width: 0.5.sw,
                                    foregroundDecoration: BoxDecoration(color: Colors.transparent),
                                    decoration: BoxDecoration(
                                        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0)],
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                        child: AppBoldText(
                                            selectedPage == InterventionDetailsUtils.searchingPagePageId
                                                ? appLocalizations.translate("searching_internal_page_name")
                                                : selectedPage == InterventionDetailsUtils.circuitBreakerPageId
                                                ? appLocalizations.translate("circuit_breaker_page_name")
                                                : selectedPage == InterventionDetailsUtils.MeterReadingPageId
                                                ? appLocalizations.translate("meter_reading_page_name")
                                                : selectedPage == InterventionDetailsUtils.PhasePositionPageId
                                                ? appLocalizations.translate("phase_position_page_name")
                                                : selectedPage == InterventionDetailsUtils.InstallationPolicyPageId
                                                ? appLocalizations.translate("installation_policy_page_name")
                                                : selectedPage == InterventionDetailsUtils.MeterDepositPageId
                                                ? appLocalizations.translate("meter_deposit_page_name")
                                                : selectedPage == InterventionDetailsUtils.MeterInstallationPageId
                                                ? appLocalizations.translate("meter_installation_page_name")
                                                : selectedPage == InterventionDetailsUtils.CircuitBreakerReplacementPageId
                                                ? appLocalizations.translate("circuit_breaker_replacement_page_name")
                                                : selectedPage == InterventionDetailsUtils.CircuitBreakerSettingsPageId
                                                ? appLocalizations.translate("circuit_breaker_settings_page_name")
                                                : selectedPage == InterventionDetailsUtils.ProgrammingPageId
                                                ? appLocalizations.translate("programming_page_name")
                                                : selectedPage ==
                                                InterventionDetailsUtils.CircuitBreakerInterlockPageId
                                                ? appLocalizations
                                                .translate("circuit_breaker_interlock_page_name")
                                                : selectedPage == InterventionDetailsUtils.AccountPageId
                                                ? appLocalizations.translate("account_page_name")
                                                : selectedPage ==
                                                InterventionDetailsUtils.CustomerFeedbackPageId
                                                ? appLocalizations
                                                .translate("customer_feedback_page_name")
                                                : "",
                                            color: AppColor.kSuccessColor,
                                            textAlign: TextAlign.center,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Expanded(
                            child: PageView(
                              controller: _pageController,
                              physics: NeverScrollableScrollPhysics(),
                              // physics: BouncingScrollPhysics(),
                              onPageChanged: (index) {
                                setState(() {
                                  selectedPage = index;
                                });
                              },
                              children: [
                                SearchingInternalPage(interventionRecord: widget.interventionRecord),
                                CircuitBreakerInternalPage(),
                                MeterReadingInternalPage(),
                                PhasePositionInternalPage(),
                                InstallationPolicyInternalPage(),
                                MeterDepositInternalPage(),
                                MeterInstallationInternalPage(),
                                CircuitBreakerReplacementInternalPage(),
                                CircuitBreakerSettingsInternalPage(),
                                ProgrammingInternalPage(),
                                CircuitBreakerInterlock(),
                                AccountInterventionSummaryInternalPage(),
                                CustomerFeedbackInternalPage(controller: _signatureController)
                              ],
                            )),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 0.02.sh, horizontal: 0.06.sw),
                          child: Row(
                            children: [
                              //showing different button according to the selected values inside (1_searching_internal_page)
                              (_interventionDetails.canYouGetStartedToday == false || _interventionDetails.presenceOfPnt == false)
                                  ? Expanded(
                                  child: CommonRoundedButton(
                                    btnText: appLocalizations.translate("force_case_grip"),
                                    color: AppColor.kCaseColor,
                                    textColor: AppColor.kWhiteColor,
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) =>
                                            InterventionHelpDetailsBottomSheet(isForceGrip: true, interventionRecords: widget.interventionRecord),
                                      );
                                    },
                                  ))
                                  : Expanded(
                                child: CommonRoundedButton(
                                  color: AppColor.kPrimaryColor,
                                  btnText: selectedPage == InterventionDetailsUtils.ProgrammingPageId
                                      ? (_interventionDetails.statusOfInstalledMeter == true
                                      ? appLocalizations.translate("validate_programming")
                                      : appLocalizations.translate("start_the_replacement"))
                                      : selectedPage == InterventionDetailsUtils.AccountPageId
                                      ? appLocalizations.translate("close_the_intervention")
                                      : selectedPage == InterventionDetailsUtils.CustomerFeedbackPageId
                                      ? appLocalizations.translate("submit")
                                      : appLocalizations.translate("next"),
                                  textColor: Colors.white,
                                  onPressed: InterventionDetailsHelperFunctions.disableButton(selectedPage, _interventionDetails)
                                      ? null
                                      : () async {
                                    FocusManager.instance.primaryFocus?.unfocus();
                                    //when 'Next' btn is enabled and pressed,save the data locally
                                    try {
                                      InterventionDetailsHelperFunctions.saveDataIntoDatabase(context,
                                          selectedPage: selectedPage, interventionDetails: _interventionDetails);
                                    } catch (e, stack) {
                                      log("$e");
                                      log("$stack");
                                    }
                                    if (selectedPage == InterventionDetailsUtils.searchingPagePageId) {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (_) {
                                            return NotifyBottomSheet(
                                              title: appLocalizations.translate("notify_customer_of_the_disruption_electricity"),
                                              btnText: appLocalizations.translate("start_customer_bottom_sheet"),
                                              btnOnPressed: () {
                                                animateToPage(++selectedPage);
                                                Navigator.pop(context);
                                              },
                                            );
                                          });
                                    } else if (selectedPage == InterventionDetailsUtils.CircuitBreakerSettingsPageId) {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (_) {
                                            return NotifyBottomSheet(
                                              title: appLocalizations.translate("confirm_power_on_and_check_power_supply"),
                                              btnText: appLocalizations.translate("confirm"),
                                              btnOnPressed: () {
                                                animateToPage(++selectedPage);
                                                Navigator.pop(context);
                                              },
                                            );
                                          });
                                    } else if (selectedPage == InterventionDetailsUtils.CustomerFeedbackPageId) {
                                      File? customerImage = await _generateSignature(_interventionDetails);

                                      String formattedDateTime = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
                                      //saving endTimeOfIntervention in intervention bloc as well as local database
                                      var interventionDetails = _interventionDetails.copyWith(
                                          endTimeOfIntervention: formattedDateTime, customerSignatureImage: customerImage?.path);
                                      InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);

                                      InterventionDetailsHelperFunctions.saveDataIntoDatabase(context,
                                          selectedPage: selectedPage, interventionDetails: interventionDetails);
                                      //generating intervention pdf after saving intervention values in intervention bloc and in local DB
                                      File? file = await InterventionPdfUtil.generatePDF(
                                          bldCtx: context, interventionDetails: interventionDetails, isGripCase: false);
                                      if (file != null) {
                                        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (BuildContext context) {
                                          return UploadInterventionPdfScreen(
                                            normalInterventionDetails: interventionDetails,
                                            pdfFile: file,
                                            interventionRecord: widget.interventionRecord,
                                            isRc: false, // because it is normal intervention
                                            isGrip: false,
                                            isForceGrip: false,
                                          );
                                        }));
                                      } else
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Some Error Occurred")));
                                    } else {
                                      animateToPage(++selectedPage);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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

  ///[animateToPage] This function will animate the page to the new page ID
  void animateToPage(int pageId) {
    setState(() {
      _pageController.animateToPage(pageId, duration: Duration(milliseconds: 300), curve: Curves.bounceInOut);
      selectedPage = pageId;
    });
  }
}