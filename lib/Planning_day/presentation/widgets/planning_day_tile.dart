import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';

class PlanningDayTile extends StatelessWidget {
  final Color tileColor;
  final bool isRC;
  final String clientName;
  final String clientAddress;
  final String clientAccNo;
  final String interventionNumber;
  const PlanningDayTile({Key? key, required this.tileColor, required this.isRC, required this.clientName, required this.clientAddress, required this.clientAccNo, required this.interventionNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: tileColor.withOpacity(0.18), borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          // margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),

          child: Container(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppBoldText("$clientName"),
                      AppBoldText(
                        "$clientAddress",
                        color:tileColor,
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if(clientAccNo!='null')  Transform.translate(
                      offset: Offset(-10, -20),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(color: tileColor, border: Border.all(color:tileColor), borderRadius: BorderRadius.circular(60)),
                        child: Text(
                          "ACC $clientAccNo",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: tileColor,
                      radius: 12,
                      child: AppBoldText(
                        "$interventionNumber",
                        color:AppColor.kWhiteColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        if (isRC)
          Transform.translate(
            offset: Offset(10, -16.h),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                  border: Border.all(color: tileColor),
                  color: AppColor.kWhiteColor,
                  borderRadius: BorderRadius.circular(60)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.notifications,
                    color: tileColor,
                    size: 16,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "RC",
                    style: TextStyle(fontSize: 12, color: tileColor),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}