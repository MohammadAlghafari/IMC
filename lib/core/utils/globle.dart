import 'package:flutter/material.dart';
import 'package:imc/core/utils/app_localizations.dart';

String? validateEmail(String? value, BuildContext ctx) {
  final appLocalizations = AppLocalizations.of(ctx);

  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (value!.isEmpty) {
    return appLocalizations.translate("enter_valid_email");
  }
  if (!regex.hasMatch(
    value.toString(),
  )) {
    return appLocalizations.translate("enter_valid_email");
  } else {
    return null;
  }
}

class InterventionStatus{
  static const INTERVENTION_STATUS_KO = 2;
  static const INTERVENTION_STATUS_SEMI_KO = 3;
  static const INTERVENTION_STATUS_COMPLETED = 4;
}