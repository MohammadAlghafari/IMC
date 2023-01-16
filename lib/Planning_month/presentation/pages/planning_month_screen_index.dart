import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/Auth/data/local_database/auth_hive_helper.dart';
import 'package:imc/Planning_month/presentation/widgets/month_all_appointment.dart';
import 'package:imc/Planning_month/presentation/widgets/month_calender_widget.dart';
import '../../../../../core/constant/app_color.dart';
import 'package:imc/common_widgets/common_drawer.dart';

class PlanningMonthScreen extends StatefulWidget {
  const PlanningMonthScreen({Key? key}) : super(key: key);

  @override
  State<PlanningMonthScreen> createState() => _PlanningMonthScreenState();
}

class _PlanningMonthScreenState extends State<PlanningMonthScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CommonDrawer(userRoleId: AuthHiveHelper.getUserRoleId),
      body: Stack(children: [
        Column(
          children: [
            MonthCalenderWidget(),
            Expanded(child: MonthAllAppointmentsWidget()),
          ],
        ),
        Positioned(
            left: 65.w,
            top: 55.h,
            child: GestureDetector(
              onTap: () => scaffoldKey.currentState?.openDrawer(),
              child: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(image: NetworkImage('${AuthHiveHelper.getUserPicture}'), fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      border: Border.all(color: AppColor.kWhiteColor, width: 2.0))),
            )),
      ]),
    );
  }
}