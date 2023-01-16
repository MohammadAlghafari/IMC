import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/common_widgets/custom_text.dart';


class CommonRoundedButton extends StatelessWidget {
  final String btnText;
  final Color? color;
  final Color? textColor;
  final onPressed;

  const CommonRoundedButton(
      {this.btnText = '', this.onPressed, this.color , this.textColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),        primary: onPressed == null ? Colors.black12 : color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60)
        )
      ),
      onPressed: (){
       if(onPressed != null){
         onPressed();
       }
      },
      child: AppBoldText(btnText, fontSize: 16.sp, color: onPressed == null ? Colors.black26 : textColor, textAlign: TextAlign.center,),
    );
  }
}
