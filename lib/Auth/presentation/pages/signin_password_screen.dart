import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/Auth/data/local_database/auth_hive_helper.dart';
import 'package:imc/Auth/presentation/cubit/cubit/login_cubit.dart';
import 'package:imc/base_screen/presentation/pages/team_lead_base_screen_index.dart';
import 'package:imc/base_screen/presentation/pages/technician_base_screen_index.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/common_widgets/custom_textfield.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/constant/app_constant.dart';
import 'package:imc/core/utils/app_function.dart';
import 'package:imc/core/utils/app_localizations.dart';


class SignInPasswordScreen extends StatefulWidget {
  final String? emailPassed;
  SignInPasswordScreen({Key? key, this.emailPassed}) : super(key: key);
  @override
  State<SignInPasswordScreen> createState() => _SignInPasswordScreenState();
}

class _SignInPasswordScreenState extends State<SignInPasswordScreen> {
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kBackGroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: AppColor.kBackGroundColor,
        child: Form(
          key: formGlobalKey,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(text: "IMC ", style: TextStyle(color: AppColor.kPrimaryColor)),
                        TextSpan(text: "RÉSEAUX", style: TextStyle(color: AppColor.kBlackColor)),
                      ]),
                    ),
                    SizedBox(height: .1.sh),
                    AppBoldText("Bonjour ${widget.emailPassed},", color: AppColor.kBlackColor, fontSize: 18),
                    SizedBox(height: .02.sh),
                    AppRegularText(appLocalizations.translate("enter_password"), color: AppColor.kRegularTextColor),
                    SizedBox(height: .07.sh),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5.0, offset: Offset(0, 2))]),
                            child: CustomTextField(
                                hintText: appLocalizations.translate("password"),
                                controller: passwordController,
                                suffixVisibility: true,
                                validate: (val) => val!.isEmpty ? appLocalizations.translate("enter_your_password") : null,
                                obscureText: true),
                          ),
                        ),
                        SizedBox(width: 15.w),
                        GestureDetector(
                          onTap: () {
                            if (formGlobalKey.currentState!.validate()) {
                              BlocProvider.of<LoginCubit>(context).loginWithEmailPassword(
                                emailVal: widget.emailPassed ?? 'null value',
                                passwordVal: passwordController.text.trim(),
                              );
                              disposeKeyboard();
                            }
                          },
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(color: AppColor.kPrimaryColor, shape: BoxShape.circle),
                            child: Icon(Icons.arrow_forward_ios, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: .2.sh),

                  ]),
                ),
              ),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginErrorState) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.errorMessage),
                    ));
                  }
                  if (state is LoginLoadedState) {
                    try {
                      //Navigating according to the role id(technician or teamleader) we get from the local DB.
                      int roleId = AuthHiveHelper.getUserRoleId;
                      if (roleId == UserRoles.TECHNICIAN_ROLE_ID) {
                        Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_) {
                          return BaseScreenIndex();
                        }), (route) => false);
                      } else {
                        Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_) {
                          return TeamLeadBaseScreenIndex();
                        }), (route) => false);
                      }
                    } catch (e) {
                      log("sign_in_password_screen_error_from_hive: ${e}");
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("An error occurred!"),
                      ));
                    }
                  }
                },
                builder: (context, state) {
                  if (state is LoginLoadingState) {
                    return Stack(
                      children: [
                        Container(
                          child: ModalBarrier(
                            dismissible: false,
                            color: Colors.grey.withOpacity(0.6),
                          ),
                        ),
                        Center(child: CircularProgressIndicator())
                      ],
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}