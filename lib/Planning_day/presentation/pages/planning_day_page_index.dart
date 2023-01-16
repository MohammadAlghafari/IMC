import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/Planning_day/presentation/cubit/team_leader_cubit/planning_day_cubit.dart';
import 'package:imc/Planning_day/presentation/cubit/technician_cubit/planning_day_cubit.dart';
import 'package:imc/Planning_day/presentation/pages/internal_pages/completed_tasks_planning_day_widget.dart';
import 'package:imc/Planning_day/presentation/pages/internal_pages/planning_day_map_widget.dart';
import 'package:imc/Planning_day/presentation/pages/internal_pages/todo_tasks_planning_day_widget.dart';
import 'package:imc/common_widgets/common_drawer.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_constant.dart';
import 'package:imc/core/utils/app_localizations.dart';
import '../../../../../core/constant/app_color.dart';
import 'package:intl/intl.dart';
import 'package:imc/Auth/data/local_database/auth_hive_helper.dart';

class PlanningDayScreenIndex extends StatefulWidget {
  const PlanningDayScreenIndex({Key? key}) : super(key: key);

  @override
  State<PlanningDayScreenIndex> createState() => _PlanningDayScreenIndexState();
}

class _PlanningDayScreenIndexState extends State<PlanningDayScreenIndex> {
  /// [_index] value will be used in the page view for switching between the to-do,realized,map page
  int _index = 0;

  PageController pageController = PageController(initialPage: 0);

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    initDataFromBloc();
    super.initState();
  }

  ///[initDataFromBloc] initialize data(intervention for today) according the the [UserRoles] we get from local DB
  void initDataFromBloc() {
    if (AuthHiveHelper.getUserRoleId == UserRoles.TECHNICIAN_ROLE_ID) {
      //accessing "technician's planning day" cubit
      final _planningDayCubit = BlocProvider.of<PlanningDayCubit>(context);
      //getting technician's  today interventions
      _planningDayCubit.getTechnicianInterventionForToday();
    } else {
      //accessing "team leader's planning day" cubit

      final _planningDayCubit = BlocProvider.of<TeamLeaderPlanningDayCubit>(context);
      //getting team leader's  today interventions

      _planningDayCubit.getTeamLeaderInterventionForToday([InterventionStatus.InterventionStatusPlanifiee.interventionStatusCode]);
    }
  }

  @override
  Widget build(BuildContext context) {
    //var to get the locale languaged code
    String locale = Localizations.localeOf(context).languageCode;

    final appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      key: scaffoldKey,
      drawer: CommonDrawer(userRoleId: AuthHiveHelper.getUserRoleId),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                height: 0.18.sh,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0, offset: Offset(0, 5))],
                    color: AppColor.kPrimaryColor,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        GestureDetector(
                          onTap: () => scaffoldKey.currentState?.openDrawer(),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                color: const Color(0xff7c94b6),
                                image: DecorationImage(image:  NetworkImage('${AuthHiveHelper.getUserPicture}'), fit: BoxFit.cover),
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                border: Border.all(color: AppColor.kWhiteColor, width: 2.0)),
                          ),
                        ),
                        AppBoldText(
                          "${DateFormat("dd MMMM yyyy", locale).format(DateTime.now())}",
                          color: AppColor.kWhiteColor,
                          fontSize: 18,
                        ),
                        Text("")
                      ]),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, -16),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                    GestureDetector(
                      onTap: () {
                        pageController.animateToPage(0, duration: Duration(microseconds: 100), curve: Curves.bounceInOut);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [BoxShadow(color: AppColor.kBlackShadowColor, blurRadius: 3)],
                              color: _index == 0 ? Color(0xff363535) : Colors.white),
                          child: Center(
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                                  child: Row(
                                    children: [
                                      AppBoldText(appLocalizations.translate("to_do"),
                                          color: _index == 0 ? AppColor.kWhiteColor : Color(0xff7F7F7F), fontSize: 12),
                                      SizedBox(width: 10),
                                      Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColor.kPrimaryColor,
                                          ))
                                    ],
                                  )))),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                        onTap: () {
                          pageController.animateToPage(1, duration: Duration(microseconds: 100), curve: Curves.bounceInOut);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [BoxShadow(color: AppColor.kBlackShadowColor, blurRadius: 3)],
                                borderRadius: BorderRadius.circular(25),
                                color: _index == 1 ? Color(0xff363535) : Colors.white),
                            child: Center(
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                                    child: Row(
                                      children: [
                                        AppBoldText(appLocalizations.translate("realized"),
                                            color: _index == 1 ? AppColor.kWhiteColor : Color(0xff7F7F7F), fontSize: 12),
                                        SizedBox(width: 10),
                                        Container(
                                            height: 20, width: 20, decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.kPrimaryColor))
                                      ],
                                    ))))),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        pageController.animateToPage(2, duration: Duration(microseconds: 100), curve: Curves.bounceInOut);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [BoxShadow(color: AppColor.kBlackShadowColor, blurRadius: 3)],
                            color: _index == 2 ? Color(0xff363535) : Colors.white),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            child: AppBoldText(appLocalizations.translate("map"),
                                color: _index == 2 ? AppColor.kWhiteColor : Color(0xff7F7F7F), fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
          Expanded(
            child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    _index = index;
                  });
                },
                children: [TodoTaskPlanningDayWidget(), CompletedTaskPlanningDayWidget(), PlanningDayMapWidget()]),
          ),
        ],
      ),
    );
  }
}