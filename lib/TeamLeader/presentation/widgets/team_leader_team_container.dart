import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/TeamLeader/data/model/team_leader_team_members_model.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_page_cubits/team_leader_team_members_cubit/team_leader_team_members_cubit.dart';
import 'package:imc/TeamLeader/presentation/pages/technicien_details_screen/team_technicien_details_screen_index.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shimmer/shimmer.dart';

class TeamLeaderTeamContainer extends StatelessWidget {
  TeamLeaderTeamContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizatons = AppLocalizations.of(context);

    // TODO - THE CONTAINER SHOULD ONLY TAKE THE SPACE WHICH IS REQUIRED
    return BlocBuilder<TeamLeaderTeamMembersCubit, TeamLeaderTeamMembersState>(
      builder: (context, state) {
        if (state is TeamLeaderTeamMembersError) {
          return SizedBox(
            height: 0.3.sh,
            child: Center(
              child: AppRegularText("${appLocalizatons.translate("an_error_occured")}"),
            ),
          );
        }
        if (state is TeamLeaderTeamMembersLoaded) {
          final List<Records?>? listOfTeamMembers = state.recordsList;

          final int lengthOfList = (listOfTeamMembers?.length ?? 0) == 0 ? 1 : listOfTeamMembers!.length;

          if (listOfTeamMembers == null || listOfTeamMembers.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  AppRegularText(appLocalizatons.translate("there_are_no_team_members_assigned_to_you")),
                ],
              ),
            );
          }

          return Container(
            height: 0.3.sh, // ToDO -w This should be dynamic
            width: 1.sw,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GridView.builder(
                itemCount: lengthOfList,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 50, crossAxisSpacing: 20, mainAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, CupertinoPageRoute(builder: (ctx) => TeamTechnicienDetailsScreen(teamMemberRecord: listOfTeamMembers[index]!)));
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                image:listOfTeamMembers[index]!.collaborator?.picture!=null ?DecorationImage(image: NetworkImage(listOfTeamMembers[index]!.collaborator!.picture!), fit: BoxFit.cover):DecorationImage(image: AssetImage('assets/images/img_user.jpeg'), fit: BoxFit.cover),
                                shape: BoxShape.circle,
                                color: AppColor.kWhiteColor),
                          ),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  width: 0.2.sw,
                                  child: AppBoldText(listOfTeamMembers[index]?.collaborator?.name ?? "no name",
                                      fontSize: 12.sp, color: AppColor.kBlackColor),
                                ),
                                SizedBox(height: 5.h),
                                LinearPercentIndicator(
                                  barRadius: Radius.circular(15),
                                  lineHeight: 5.0,
                                  percent: index == 2 ? 0.8 : 0.5,
                                  progressColor: Colors.blue,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is TeamLeaderTeamMembersLoading) {
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