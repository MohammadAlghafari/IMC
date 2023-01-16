import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/TeamLeader/data/model/team_leader_ongoing_intervention_model.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_page_cubits/ongoing_intervention_cubit/team_leader_ongoing_interventions_cubit.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:shimmer/shimmer.dart';

class OngoingInterventionsContainer extends StatelessWidget {
  const OngoingInterventionsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizatons = AppLocalizations.of(context);

    return BlocBuilder<TeamLeaderOngoingInterventionsCubit, TeamLeaderOngoingInterventionsState>(
      builder: (context, state) {
        if (state is TeamLeaderOngoingInterventionsError) {
          return SizedBox(
            height: 0.2.sh,
            child: Center(
              child: AppRegularText("${appLocalizatons.translate("an_error_occured")}"),
            ),
          );
        }
        if (state is TeamLeaderOngoingInterventionsLoaded) {
          final List<Records?>? _listOfOngoingInterventions = state.recordsList;
          final int lengthOfList = (_listOfOngoingInterventions?.length ?? 0) == 0 ? 1 : _listOfOngoingInterventions!.length;

          if (_listOfOngoingInterventions == null || _listOfOngoingInterventions.isEmpty) {
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  AppRegularText(appLocalizatons.translate("there_are_no_ongoing_interventions")),
                ],
              ),
            );
          }

          return Container(
            height: 0.3.sh,
            child: ListView.builder(
              itemCount: lengthOfList,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final Records intervention = _listOfOngoingInterventions[index]!;
                return Container(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), color: AppColor.kProgressColor),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 160.w,
                                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        AppBoldText("${intervention.clientFirstname} ${intervention.clientLastname}", color: AppColor.kBlackColor),
                                        SizedBox(height: 10.h),
                                        AppBoldText("${intervention.clientAddress}", color: AppColor.kPrimaryColor, fontSize: 12.sp),
                                        SizedBox(height: 5.h),
                                        AppBoldText("${intervention.clientPostalCode} ${intervention.clientCity}",
                                            color: AppColor.kPrimaryColor, fontSize: 12.sp),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 160.w,
                                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), color: AppColor.kPrimaryColor),
                                    child: Row(children: [
                                      Container(
                                          height: 25.h,
                                          width: 25.w,
                                          decoration: BoxDecoration(
                                              image:intervention.collaborationPicture!=null ?DecorationImage(image: NetworkImage(intervention.collaborationPicture!), fit: BoxFit.cover):DecorationImage(image: AssetImage('assets/images/img_user.jpeg'), fit: BoxFit.cover),
                                              shape: BoxShape.circle,
                                              color: AppColor.kWhiteColor)),
                                      SizedBox(width: 10.w),
                                      AppBoldText("${intervention.technicianFirstname} ${intervention.technicianLastname}", fontSize: 11.sp, color: AppColor.kWhiteColor)
                                    ]),
                                  ),
                                ],
                              )),
                          Positioned(
                            top: -8,
                            right: 5,
                            child: Container(
                              height: 20,
                              width: 50,
                              decoration: BoxDecoration(color: AppColor.kPrimaryColor, borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: AppBoldText("ACC 658", fontSize: 10, color: AppColor.kWhiteColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else if (state is TeamLeaderOngoingInterventionsLoading) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 0.04.sw,vertical: 0.04.sh),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.grey.shade300,
                    child: Container(
                      width: 1.sw,
                      height: 14,
                      color: Colors.grey,
                    )),
                SizedBox(
                  height: 0.01.sh,
                ),
                Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.grey.shade300,
                    child: Container(
                      width: 0.6.sw,
                      height: 14,
                      color: Colors.grey,
                    )),
              ],
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}