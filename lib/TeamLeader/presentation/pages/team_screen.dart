import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imc/Auth/data/local_database/auth_hive_helper.dart';
import 'package:imc/common_models/interventions_count_model.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_page_cubits/intervention_count_cubit/intervention_count_cubit.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_page_cubits/ongoing_intervention_cubit/team_leader_ongoing_interventions_cubit.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_page_cubits/team_leader_team_members_cubit/team_leader_team_members_cubit.dart';
import 'package:imc/TeamLeader/presentation/widgets/ongoing_interventions_container.dart';
import 'package:imc/TeamLeader/presentation/widgets/team_leader_team_container.dart';
import 'package:imc/common_widgets/common_drawer.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    initTeamLeaderHomeScreenData();
    super.initState();
  }

  ///[initTeamLeaderHomeScreenData] will initialise the data for team leader home screen(interventions count, team members and ongoing interventions)
  void initTeamLeaderHomeScreenData() {
    //accessing the 'intervention count' bloc
    final _interventionsCountBloc = BlocProvider.of<InterventionCountCubit>(context);
    //getting total of interventions count for the team leader from the 'intervention count' bloc
    _interventionsCountBloc.getTeamLeaderInterventionsCount();

    //accessing the 'team leader team members' bloc
    final _teamMemberBloc = BlocProvider.of<TeamLeaderTeamMembersCubit>(context);
    //getting the members(technicians) for the team leader from 'team leader team members' bloc
    _teamMemberBloc.getTeamLeaderTeamMembers();

    //accessing the 'team leader ongoing interventions' bloc
    final _ongoingInterventionsBloc = BlocProvider.of<TeamLeaderOngoingInterventionsCubit>(context);
    //getting the list of ongoing interventions for the team leader from 'team leader ongoing interventions' bloc
    _ongoingInterventionsBloc.getTeamLeaderOngoingInterventions();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    String locale = Localizations.localeOf(context).languageCode;

    return Scaffold(
      key: scaffoldKey,
      drawer: CommonDrawer(userRoleId: AuthHiveHelper.getUserRoleId),
      backgroundColor: AppColor.kWhiteColor,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 0.024.sh),
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0, offset: Offset(0, 5))],
                color: AppColor.kPrimaryColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 50.w),
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    GestureDetector(
                      onTap: () => scaffoldKey.currentState?.openDrawer(),
                      child: Container(
                        width: 40.r,
                        height: 40.r,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          image: DecorationImage(
                            image:  NetworkImage('${AuthHiveHelper.getUserPicture}'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          border: Border.all(color: AppColor.kWhiteColor, width: 2.0),
                        ),
                      ),
                    ),
                    AppBoldText("${DateFormat("dd MMMM yyyy",locale).format(DateTime.now())}", color: AppColor.kWhiteColor, fontSize: 16),
                    Text("")
                  ]),
                ],
              ),
            ),
          ),
          BlocBuilder<InterventionCountCubit, InterventionCountState>(
            builder: (context, state) {
              if (state is InterventionCountLoaded) {
                final Records? records = state.interventionsCount;
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 0.04.sw, vertical: 0.02.sh),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppBoldText(appLocalizations.translate("done"), color: AppColor.kPrimaryColor),
                              AppRegularText("${records?.ralise}", color: AppColor.kPrimaryColor, fontSize: 20)
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppBoldText(appLocalizations.translate("to_do"), color: AppColor.kToDOColor),
                              AppRegularText('${records?.anepasraliser}', color: AppColor.kToDOColor, fontSize: 20)
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppBoldText(appLocalizations.translate("grip_case"), color: AppColor.kCaseColor),
                              AppRegularText('${records?.standby}', color: AppColor.kCaseColor, fontSize: 20)
                            ],
                          ),
                        )
                      ]),
                );
              } else if (state is InterventionCountLoading) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 0.04.sw, vertical: 0.04.sh),
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
              } else if (state is InterventionCountError) {
                return SizedBox(
                  height: 0.1.sh,
                  child: Center(
                    child: AppRegularText("${appLocalizations.translate("an_error_occured")}"),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
          Expanded(
              child: Container(
                color: AppColor.kBackGroundColor,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, top: 20.h),
                        child: AppBoldText(appLocalizations.translate("my_team"), color: Colors.black54, fontSize: 16.sp),
                      ),
                      TeamLeaderTeamContainer(),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20, left: 20),
                        child: AppBoldText(appLocalizations.translate("ongoing_interventions"), color: Colors.black54, fontSize: 14.sp),
                      ),
                      OngoingInterventionsContainer(),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}