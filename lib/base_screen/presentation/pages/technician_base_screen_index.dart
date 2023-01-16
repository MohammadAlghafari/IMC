import 'dart:developer';

import 'package:dio_log/dio_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:imc/Analytics_screen/presentation/pages/analytics_screen_index.dart';
import 'package:imc/Planning_day/presentation/pages/planning_day_page_index.dart';
import 'package:imc/Planning_month/presentation/pages/planning_month_screen_index.dart';
import 'package:imc/Planning_week/presentation/pages/planning_week_page_index.dart';
import 'package:imc/base_screen/data/api/timer_api_handler.dart';
import 'package:imc/base_screen/data/local_storage/local_database.dart';
import 'package:imc/base_screen/data/models/break_time_model.dart';
import 'package:imc/base_screen/presentation/manager/timer_bloc/timer_bloc.dart';
import 'package:imc/base_screen/presentation/widgets/intervention_count_speed_dial_widget.dart';
import 'package:imc/common_widgets/common_rounded_button.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/constant/app_icons.dart';
import 'package:imc/core/utils/app_localizations.dart';

class BaseScreenIndex extends StatefulWidget {
  const BaseScreenIndex({Key? key}) : super(key: key);

  @override
  State<BaseScreenIndex> createState() => _BaseScreenIndexState();
}

class _BaseScreenIndexState extends State<BaseScreenIndex> {
  // selected index of the bottom navigation
  int _selectedTab = 0;
  PageController _controller = PageController();

  // It is the time for lunch break
  int timeForBreak = 1 * 60 * 60;
  bool _isLoading = false;

  ///[navigateToPage] switches between all the pages provided to the [PageView]
  void navigateToPage(int index) {
    _controller.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.bounceInOut);
    _selectedTab = index;
  }

  ///[_startBreakTimer] to start the break time from the floating [SpeedDial] widget
  void _startBreakTimer(BuildContext context) async {
    setState((){
      _isLoading = true;
    });

    try {
      // calling the start break time api and getting how much time is left
      final _breakTimeApiHandler = BreakTimeApiHandler();
      BreakTimeModel? response = await _breakTimeApiHandler.startBreakTimer();
      if (response.errors != null && response.errors!.isEmpty) {
        timeForBreak = (response.records?.timeRemained ?? 0) * 60;
        // starting the bloc for the timer
        log("TIME $timeForBreak");
        BlocProvider.of<TimerBloc>(context).add(TimerStarted(timeForBreak));
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${response.errors?.first}")));
      }


    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("An error occurred!")));
    }

    setState((){
      _isLoading = false;
    });
  }

  ///[_pauseBreakTimer] to start the break time from the floating [SpeedDial] widget
  void _pauseBreakTimer(BuildContext context) async {
    setState((){
      _isLoading = true;
    });

    try {
      // calling the start break time api and getting how much time is left
      final _breakTimeApiHandler = BreakTimeApiHandler();
      BreakTimeModel? response = await _breakTimeApiHandler.resumeWork();
      if (response.errors != null && response.errors!.isEmpty) {
        timeForBreak = response.records?.timeRemained ?? 0;
        // pausing the bloc for the timer
        BlocProvider.of<TimerBloc>(context).add(TimerPaused());
        UserHiveHelper.setIsTimerActive(false);      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${response.errors?.first}")));
      }


    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("An error occurred!")));
    }

    setState((){
      _isLoading = false;
    });
  }


  // ///[_pauseBreakTimer] to pause the break time from the floating [SpeedDial] widget
  // void _pauseBreakTimer() {
  //   BlocProvider.of<TimerBloc>(context).add(TimerPaused());
  //   UserHiveHelper.setIsTimerActive(false);
  // }

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      bool? isBreakTimerActive = UserHiveHelper.getIsTimerActive;
      if (isBreakTimerActive) {
        _startBreakTimer(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return Material(
      child: Stack(
        children: [
          Scaffold(
            floatingActionButton: SpeedDial(
              direction: SpeedDialDirection.up,
              icon: Icons.add,
              activeIcon: Icons.close,
              buttonSize: Size(45, 45),
              childrenButtonSize: Size(55, 55), elevation: 0,
              overlayOpacity: 0.2,
              children: [
                SpeedDialChild(
                    child: InterventionCountSpeedDialWidget(),
                    label: "Interventions",
                    labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    backgroundColor: Colors.blue),
                SpeedDialChild(
                    foregroundColor: Colors.red,
                    child: Icon(
                      Icons.pause,
                      color: Colors.white,
                    ),
                    onTap: () {
                      _startBreakTimer(context);
                    },
                    label: appLocalizations.translate("break"),
                    labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    backgroundColor: Colors.blue),
                SpeedDialChild(
                    child: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    label: appLocalizations.translate("mail"),
                    labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    backgroundColor: Colors.blue,
                )
              ],
              // animatedIcon: AnimatedIcons.menu_close,
            ),
            body: Container(
              child: PageView(
                controller: _controller,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  PlanningMonthScreen(),
                  PlanningDayScreenIndex(),
                  PlanningWeekScreenIndex(),
                  AnalyticScreenIndex(),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedTab,
              onTap: (itemIndex) {
                setState(() {
                  navigateToPage(itemIndex);
                });
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColor.kPrimaryColor,
              unselectedItemColor: Color(0xffA7A7A7),
              items: [
                BottomNavigationBarItem(
                    label: appLocalizations.translate("month"),
                    icon: ImageIcon(
                      AssetImage(AppIcons.month),
                    )),
                BottomNavigationBarItem(
                    label: appLocalizations.translate("day"),
                    icon: ImageIcon(
                      AssetImage(AppIcons.planning),
                    )),
                BottomNavigationBarItem(
                    label: appLocalizations.translate("week"),
                    icon: ImageIcon(
                      AssetImage(AppIcons.week),
                    )),
                BottomNavigationBarItem(
                    label: appLocalizations.translate("analytics"),
                    icon: ImageIcon(
                      AssetImage(AppIcons.analytics),
                    )),
              ],
            ),
          ),


          BlocBuilder<TimerBloc, TimerState>(
            builder: (context, state) {
              if (state is TimerRunInProgressState) {
                final duration = state.duration;
                final minutesStr = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
                final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
                return Stack(
                  children: [
                    ModalBarrier(
                      color: Colors.grey.withOpacity(0.7),
                      dismissible: false,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                    backgroundColor: AppColor.kPrimaryColor,
                                    child: Icon(
                                      Icons.pause,
                                      color: Colors.white,
                                      size: 30.r,
                                    ),
                                    radius: 40.r),
                                SizedBox(
                                  height: 0.02.sh,
                                ),
                                AppBoldText(
                                  '$minutesStr:$secondsStr',
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 0.02.sh, horizontal: 0.06.sw),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CommonRoundedButton(
                                    btnText: "Resume",
                                    textColor: AppColor.kPrimaryColor,
                                    color: AppColor.kWhiteColor,
                                    onPressed: () {
                                      _pauseBreakTimer(context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),

          if(_isLoading)
            Stack(
              children: [
                ModalBarrier(
                  color: Colors.grey.withOpacity(0.7),
                  dismissible: false,
                ),
                Center(
                  child: CircularProgressIndicator(),
                )
              ],
            ),

          FloatingActionButton(
            child: Text("LOG"),
              onPressed: (){
                Future.delayed(Duration(milliseconds: 500));
                // dismissDebugBtn();
                itemEntry = OverlayEntry(
                    builder: (BuildContext context) =>
                        DraggableButtonWidget());

                ///显示悬浮menu
                Overlay.of(context)?.insert(itemEntry!);

          }),
        ],
      ),
    );
  }
}
