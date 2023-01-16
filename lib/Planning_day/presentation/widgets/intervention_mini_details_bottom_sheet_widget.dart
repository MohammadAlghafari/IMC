
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/presentation/pages/customer_details_page/customer_details_screen_index.dart';
import 'package:imc/common_models/intervention_record_model.dart';
import 'package:imc/common_widgets/custom_button.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/common_widgets/open_navigation_in_maps_dialog.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:imc/core/utils/url_launcher_helper.dart';

class InterventionMiniDetailsBottomSheetWidget extends StatelessWidget {
  final Records interventionDetails;
  final bool isRc;
  const InterventionMiniDetailsBottomSheetWidget({Key? key, required this.interventionDetails, required this.isRc}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r), topRight: Radius.circular(15.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 0.01.sh),
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColor.kPrimaryColor.withOpacity(0.3),
                borderRadius: BorderRadius.only(topRight: Radius.circular(15.r), topLeft: Radius.circular(15.r))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBoldText("${interventionDetails.scheduleStart?.substring(11,16)} - ${interventionDetails.scheduleEnd?.substring(11,16)}", color: AppColor.kPrimaryColor, fontSize: 16),
                  Row(
                    children: [
                      if (isRc)
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(color: AppColor.kWhiteColor, shape: BoxShape.circle),
                          child: CircleAvatar(
                            child: Text(
                              "RC",
                              style: TextStyle(color: AppColor.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 18.sp),
                            ),
                            backgroundColor: AppColor.kWhiteColor,
                          ),
                        ),
                      if(interventionDetails.client?.mobileNumber != null)
                        SizedBox(width: 10),
                      if(interventionDetails.client?.mobileNumber != null)
                        GestureDetector(
                          onTap: () {
                            UrlLauncher.launchUrl("tel://${interventionDetails.client?.mobileNumber}");
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(color: AppColor.kWhiteColor, shape: BoxShape.circle),
                            child: Icon(Icons.call, color: AppColor.kPrimaryColor, size: 20.sp),
                          ),
                        ),
                      if(interventionDetails.client?.mobileNumber != null)
                        SizedBox(width: 10),
                      if(interventionDetails.client?.mobileNumber != null)
                        GestureDetector(
                          onTap: () {
                            UrlLauncher.launchUrl("sms://${interventionDetails.client?.mobileNumber}");
                          },
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(color: AppColor.kWhiteColor, shape: BoxShape.circle),
                              child: Icon(Icons.mail, color: AppColor.kPrimaryColor, size: 20.sp)),
                        )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 0.03.sh),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppBoldText("${interventionDetails.client?.firstname}", color: AppColor.kBlackColor, fontSize: 16.sp),
                if(interventionDetails.client?.accNumber!=null)AppBoldText("ACC ${interventionDetails.client?.accNumber}", color: AppColor.kPrimaryColor, fontSize: 16.sp),
              ],
            ),
          ),
          SizedBox(height: 10),
          if(interventionDetails.client?.address !=null || interventionDetails.client?.postalCode !=null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: AppColor.kPrimaryColor, size: 15),
                  SizedBox(width: 10),
                  Flexible(
                    child: AppRegularText(
                        "${interventionDetails.client?.address??''}, ${interventionDetails.client?.postalCode??''}",
                        color: AppColor.kBlackColor,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
          SizedBox(height: 10),
          if(interventionDetails.client?.market?.title!=null || interventionDetails.client?.technical?.nbFils !=null ||interventionDetails.client?.technical?.meterRange!=null) Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: AppBoldText(
                "${interventionDetails.client?.market?.title??''}  ${interventionDetails.client?.technical?.nbFils??''}  ${interventionDetails.client?.technical?.meterRange??''}",
                fontSize: 13),
          ),
          // Spacer(flex: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              Icon(Icons.location_on, color: AppColor.kPrimaryColor, size: 15),
              TextButton(
                child: AppBoldText(
                  appLocalizations.translate("view_on_map"),
                  color: AppColor.kPrimaryColor,
                ),
                onPressed: () {
                  double? latitude = double.tryParse("${interventionDetails.client?.latitude}") ?? 0.0;
                  double? longitude = double.tryParse("${interventionDetails.client?.longitude}") ?? 0.0;
                  showDialog(
                      context: context,
                      builder: (_) {
                        return OpenNavigationInMapsDialog(latitude: latitude, longitude: longitude);
                      });
                },
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
            child: CustomButton(
                color: AppColor.kPrimaryColor,
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (_) {
                    return CustomerDetailsScreen(
                      interventionRecord: interventionDetails,
                      isRC: isRc,
                    );
                  }));
                },
                title: AppLocalizations.of(context).translate("see_the_fact_sheet"),
                textColor: AppColor.kWhiteColor,
                borderRadius: 20),
          ),
        ],
      ),
    );
  }


}