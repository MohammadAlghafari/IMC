import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/Auth/presentation/pages/signin_password_screen.dart';
import 'package:imc/common_widgets/custom_button.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/common_widgets/custom_textfield.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/constant/app_icons.dart';
import 'package:imc/core/utils/app_localizations.dart';
import '../../../../core/utils/globle.dart';

class SignInEmailScreen extends StatefulWidget {
  const SignInEmailScreen({Key? key}) : super(key: key);

  @override
  State<SignInEmailScreen> createState() => _SignInEmailScreenState();
}

class _SignInEmailScreenState extends State<SignInEmailScreen> {
  //* textEditingController created for email
  TextEditingController emailTextController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      body: Column(children: [
        Container(
          height: 0.35.sh,
          color: AppColor.kWhiteColor,
          child: Center(
            child: Image.asset(
              AppIcons.logo,
              scale: 1.2,
            ),
          ),
        ),
        Expanded(
            child: Container(
              color: AppColor.kBackGroundColor,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: formGlobalKey,
                    child: Column(children: [
                      SizedBox(height: .08.sh),
                      AppBoldText(appLocalizations.translate("identify_yourself"), color: AppColor.kBlackColor, fontSize: 18),
                      SizedBox(height: .06.sh),
                      Container(
                        decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5.0, offset: Offset(0, 2))]),
                        child: CustomTextField(
                            hintText: appLocalizations.translate("id"),
                            controller: emailTextController,
                            validate: (val) => validateEmail(val?.trim(), context)),
                      ),
                      SizedBox(height: .03.sh),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: CustomButton(
                            title: appLocalizations.translate("continue"),
                            color: AppColor.kPrimaryColor,
                            textColor: AppColor.kWhiteColor,
                            onPressed: () {
                              if (formGlobalKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (ctx) => SignInPasswordScreen(
                                      emailPassed: emailTextController.text.trim(),
                                    ),
                                  ),
                                );
                              }
                            }),
                      ),
                    ]),
                  ),
                ),
              ),
            )),
      ]),
    );
  }
}