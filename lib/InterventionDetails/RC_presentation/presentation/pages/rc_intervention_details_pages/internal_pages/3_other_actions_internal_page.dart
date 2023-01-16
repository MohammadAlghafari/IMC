import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/pages/rc_intervention_details_pages/internal_pages/4_rc_intervention_report_internal_page.dart';
import 'package:imc/InterventionDetails/RC_presentation/presentation/pages/rc_intervention_details_pages/rc_intervention_details_page_helpers/rc_intervention_details_page_index_helper_functions.dart';
import 'package:imc/InterventionDetails/data/models/rc_intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/cubit/rc_intervention_details_cubit/rc_intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/Intervention_details_textfiled_large.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_image_container_widget.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_textfield_small.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_help_details_bottom_sheet.dart';
import 'package:imc/common_models/intervention_record_model.dart';
import 'package:imc/common_widgets/common_rounded_button.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/constant/app_icons.dart';
import 'package:imc/core/utils/app_localizations.dart';

class OtherActionInternalPage extends StatelessWidget {
  const OtherActionInternalPage({Key? key, required this.selectedPageId, required this.interventionRecordVal}) : super(key: key);
  final int maxNumberOfImagesAllowed = 4;
  final int selectedPageId;
  final Records interventionRecordVal;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return BlocBuilder<RCInterventionDetailsCubit, RCInterventionDetailsState>(
      builder: (context, state) {
        if (state is RCInterventionDetailsLoaded) {
          RCInterventionDetailsModel _rcInterventionDetails = state.rcInterventionDetails;
          return Scaffold(
            body: Stack(alignment: Alignment.topCenter, children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 0.16.sh,
                      padding: EdgeInsets.symmetric(vertical: 0.02.sh),
                      decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0, offset: Offset(0, 5))],
                        color: AppColor.kPrimaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(8.w),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          BackButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: AppColor.kWhiteColor),
                          AppBoldText("Mr John Doe", color: AppColor.kWhiteColor, fontSize: 18),
                          GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) => InterventionHelpDetailsBottomSheet(isForceGrip: true,isRc: true, interventionRecords: interventionRecordVal),
                                );
                              },
                              child: Image.asset(AppIcons.help, scale: 3.5)),
                        ]),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 40),
                                AppBoldText(appLocalizations.translate("specify_your_action")),
                                SizedBox(height: 0.02.sh),
                                InterventionDetailsTextFieldSmall(
                                  hintText: appLocalizations.translate("ex:replacement_of_a_defect"),
                                  initialText: _rcInterventionDetails.specifyYourAction,
                                  keyboardType: TextInputType.text,
                                  onChanged: (String value) {
                                    var rcInterventionDetails = _rcInterventionDetails.copyWith(specifyYourAction: value);
                                    RCInterventionDetailsHelperFunctions.saveRCInterventionDetailsInBloc(context, rcInterventionDetails);
                                  },
                                ),
                                SizedBox(height: 0.02.sh),
                                AppBoldText("Photos"),
                                SizedBox(height: 10),

                                Wrap(spacing: 0.15.sw,
                                    alignment: WrapAlignment.center,
                                    children: [
                                      if (_rcInterventionDetails.photosOfAction != null)
                                        ...List.generate((_rcInterventionDetails.photosOfAction?.length ?? 0), (index) {
                                          return InterventionDetailsImageContainerWidget(
                                            filePath: _rcInterventionDetails.photosOfAction![index],
                                            onImageSelected: (String? imageFilePath) {
                                              var photoOfIndexList = _rcInterventionDetails.photosOfAction;
                                              photoOfIndexList![index] = imageFilePath!;
                                              var rcInterventionDetails = _rcInterventionDetails.copyWith(photosOfAction: photoOfIndexList);
                                              RCInterventionDetailsHelperFunctions.saveRCInterventionDetailsInBloc(context, rcInterventionDetails);
                                            },
                                          );
                                        }),
                                      if ((_rcInterventionDetails.photosOfAction?.length ?? 0) < maxNumberOfImagesAllowed)
                                        GestureDetector(
                                          onTap: () {
                                            //  this is added to display one more image container;
                                            var newList = _rcInterventionDetails.photosOfAction;
                                            newList!.add("");
                                            var interventionDetails = _rcInterventionDetails.copyWith(photosOfAction: newList);
                                            RCInterventionDetailsHelperFunctions.saveRCInterventionDetailsInBloc(context, interventionDetails);
                                          },
                                          child: Container(
                                              alignment: Alignment.bottomCenter,
                                              decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.kPrimaryColor),
                                              child: Padding(
                                                padding: const EdgeInsets.all(5),
                                                child: Icon(Icons.add, color: Colors.white, size: 30),
                                              )),
                                        ),
                                    ]),

                                SizedBox(height: 0.02.sh),
                                AppBoldText(appLocalizations.translate("additional_information")),
                                SizedBox(height: 0.02.sh),
                                InterventionDetailsTextFieldLarge(
                                  initialText: _rcInterventionDetails.additionalInfoOfActions,
                                  hintText: appLocalizations.translate("submit_your_observation_here"),
                                  onChanged: (String value) {
                                    //*saving all the inputted values into the bloc
                                    var rcInterventionDetails = _rcInterventionDetails.copyWith(additionalInfoOfActions: value);
                                    RCInterventionDetailsHelperFunctions.saveRCInterventionDetailsInBloc(context, rcInterventionDetails);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 0.02.sh, horizontal: 0.06.sw),
                      child: Row(
                        children: [
                          Expanded(
                            child: CommonRoundedButton(
                              color: AppColor.kPrimaryColor,
                              btnText: appLocalizations.translate("finish"),
                              textColor: Colors.white,
                              onPressed: RCInterventionDetailsHelperFunctions.disableButton(selectedPageId, _rcInterventionDetails)
                                  ? null
                                  : () {
                                FocusManager.instance.primaryFocus?.unfocus();

                                //when 'Finish' btn is enabled and pressed,save the data locally
                                RCInterventionDetailsHelperFunctions.saveRCDataIntoDatabase(
                                    selectedPage: selectedPageId, rcInterventionDetails: _rcInterventionDetails);
                                // pushing the rc intervention summary report page
                                Navigator.of(context).push(
                                  CupertinoPageRoute(
                                    builder: (_) {
                                      return RCInterventionReportInternalPage(
                                        interventionRecordVal: interventionRecordVal,
                                        selectedPageVal: selectedPageId,
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0.14.sh,
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0)], borderRadius: BorderRadius.circular(25), color: Colors.white),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: AppBoldText(appLocalizations.translate("other_actions"), color: AppColor.kSuccessColor, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ]),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}