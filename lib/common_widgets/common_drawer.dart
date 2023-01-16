
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/Analytics_screen/presentation/cubit/analytics_time_cubit/analytics_time_cubit.dart';
import 'package:imc/Analytics_screen/presentation/cubit/analytics_week_cubit/analytics_week_cubit.dart';
import 'package:imc/Auth/data/local_database/auth_hive_helper.dart';
import 'package:imc/Auth/presentation/cubit/cubit/login_cubit.dart';
import 'package:imc/Auth/presentation/pages/signin_email_screen.dart';
import 'package:imc/InterventionDetails/presentation/cubit/customer_interventions_history_cubit/customer_interventions_history_cubit_cubit.dart';
import 'package:imc/InterventionDetails/presentation/cubit/tech_marque_cubit/tech_marque_cubit.dart';
import 'package:imc/Planning_day/presentation/cubit/team_leader_cubit/planning_day_cubit.dart';
import 'package:imc/Planning_day/presentation/cubit/technician_cubit/planning_day_cubit.dart';
import 'package:imc/Planning_day/presentation/map_cubit/planning_day_map_cubit.dart';
import 'package:imc/Planning_month/presentation/cubit/team_leader_cubit/planning_month_cubit.dart';
import 'package:imc/Planning_month/presentation/cubit/technician_cubit/planning_month_cubit.dart';
import 'package:imc/Planning_week/data/model/event_model.dart';
import 'package:imc/Planning_week/presentation/cubit/team_leader_cubit/planning_week_cubit.dart';
import 'package:imc/Planning_week/presentation/cubit/technician_cubit/planning_week_cubit.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_leader_upload_pdf_cubit/team_leader_questions_upload_pdf_cubit.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_member/cubit/team_member_interventions_cubit.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_page_cubits/intervention_count_cubit/intervention_count_cubit.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_page_cubits/ongoing_intervention_cubit/team_leader_ongoing_interventions_cubit.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_page_cubits/team_leader_team_members_cubit/team_leader_team_members_cubit.dart';
import 'package:imc/base_screen/data/local_storage/local_database.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/constant/app_constant.dart';
import 'package:imc/core/utils/app_localizations.dart';

class CommonDrawer extends StatefulWidget {
  const CommonDrawer({
    Key? key,
    required this.userRoleId,
  }) : super(key: key);
  final int userRoleId;

  @override
  State<CommonDrawer> createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
  //function to get the Role name according to the passed role id
  String mapRoleIdToRoleName(int id) {
    if (id == UserRoles.TECHNICIAN_ROLE_ID) {
      return "Technician";
    } else if (id == UserRoles.TEAM_LEADER_ROLE_ID) {
      return "Team Leader";
    }
    return "Anonymous User";
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    print("user role : ${mapRoleIdToRoleName(widget.userRoleId)}");
    print('user name : ${AuthHiveHelper.getUserName}');
    return Drawer(
      backgroundColor: AppColor.kPrimaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: Row(
              children: [
                Container(
                  width: 50.r,
                  height: 50.r,
                  decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(image: NetworkImage('${AuthHiveHelper.getUserPicture}'), fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      border: Border.all(color: AppColor.kWhiteColor, width: 2.0)),
                ),
                SizedBox(width: 15.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBoldText('${AuthHiveHelper.getUserName}', color: AppColor.kWhiteColor),
                    AppRegularText(mapRoleIdToRoleName(widget.userRoleId), color: AppColor.kWhiteColor, fontSize: 10.sp)
                  ],
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
              child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<PlanningMonthCubit>(context).resetCubit();
                    BlocProvider.of<PlanningDayCubit>(context).resetCubit();
                    BlocProvider.of<PlanningDayCompletedInterventionCubit>(context).resetCubit();
                    BlocProvider.of<PlanningDayMapCubit>(context).resetCubit();
                    BlocProvider.of<PlanningWeekCubit>(context).resetCubit();
                    BlocProvider.of<CustomerInterventionsHistoryCubit>(context).resetCubit();
                    // BlocProvider.of<InterventionDetailsCubit>(context).resetCubit();
                    BlocProvider.of<TechMarqueCubit>(context).resetCubit();
                    BlocProvider.of<LoginCubit>(context).resetCubit();
                    // BlocProvider.of<RCInterventionDetailsCubit>(context).resetCubit();
                    BlocProvider.of<AnalyticsWeekCubit>(context).resetCubit();
                    BlocProvider.of<AnalyticsTimeCubit>(context).resetCubit();
                    // BlocProvider.of<TeamLeaderQuestionCubit>(context).resetCubit();
                    BlocProvider.of<InterventionCountCubit>(context).resetCubit();
                    BlocProvider.of<TeamLeaderOngoingInterventionsCubit>(context).resetCubit();
                    BlocProvider.of<TeamLeaderTeamMembersCubit>(context).resetCubit();
                    BlocProvider.of<TeamLeaderQuestionsUploadPdfCubit>(context).resetCubit();
                    BlocProvider.of<TeamMemberInterventionsCubit>(context).resetCubit();
                    BlocProvider.of<TeamLeaderPlanningMonthCubit>(context).resetCubit();
                    BlocProvider.of<TeamLeaderPlanningDayCubit>(context).resetCubit();
                    BlocProvider.of<TeamLeaderPlanningDayCompletedInterventionCubit>(context).resetCubit();
                    BlocProvider.of<TeamLeaderPlanningWeekCubit>(context).resetCubit();

                    final _allCalenderEvents = CalendarControllerProvider.of<Event>(context).controller.events;
                    _allCalenderEvents.forEach((element) {
                      CalendarControllerProvider.of<Event>(context).controller.remove(element);

                    });

                    // BlocProvider.of<technicianWeekCubit.PlanningWeekCubit>(context).resetCubit();
                    AuthHiveHelper.isUserLoggedIn(false);
                    AuthHiveHelper.saveRefreshTokenInHive(null);
                    AuthHiveHelper.saveAccessTokenInHive(null);
                    AuthHiveHelper.saveUserNameInHive(null);
                    AuthHiveHelper.saveUserPictureInHive(null);
                    UserHiveHelper.saveBreakTimePassed(null);
                    UserHiveHelper.setIsTimerActive(false);
                    Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (BuildContext context) {
                      return SignInEmailScreen();
                    }), (route) => false);
                  },
                  child: Container(
                    height: 80.h,
                    child: Row(
                      children: [
                        Icon(Icons.logout, color: AppColor.kWhiteColor),
                        SizedBox(width: 10.w),
                        AppBoldText(appLocalizations.translate("logout"), color: AppColor.kWhiteColor, fontSize: 12.sp)
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}