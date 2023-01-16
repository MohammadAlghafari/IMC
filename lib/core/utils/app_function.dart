import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'dart:ui' as ui;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:imc/core/constant/app_color.dart';

import 'package:path_provider/path_provider.dart';

import '../constant/app_constant.dart';

flutterToast(String msg) {
  return Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_LONG, textColor: Colors.white, backgroundColor: Colors.black, fontSize: 14);
}

Future<bool> checkConnection() async {
  ConnectivityResult result = await Connectivity().checkConnectivity();
  return (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi);
}

void disposeKeyboard() {
  return FocusManager.instance.primaryFocus?.unfocus();
}

/// This function converts byteData to File and save it in temporary directory
Future<File> convertByteDataToFile(ui.Image image, int id) async {
  try {
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final buffer = byteData!.buffer;
    var tempDirectory = await getTemporaryDirectory();
    String tempPath = tempDirectory.path;
    var filePath = tempPath + '/file_${id}.png';

    return await File(filePath).writeAsBytes(buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  } catch (e) {
    log("Error while converting $e");
    throw e;
  }
}

///function to get color according to the passed interventionStatus
Color getColor(int? interventionStatus) {
  //grip case - status 2 - red
  if (interventionStatus == InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusCode) {
    return AppColor.kCaseColor;
    //semi-grip case - status 3 - orange
  } else if (interventionStatus == InterventionStatus.InterventionStatusStandBy.interventionStatusCode) {
    return AppColor.kToDOColor;
    //success case - status 4 - green
  } else if (interventionStatus == InterventionStatus.InterventionStatusRealisee.interventionStatusCode) {
    return AppColor.kSuccessColor;
    //todos case - status 1 - grey
  } else if (interventionStatus == InterventionStatus.InterventionStatusPlanifiee.interventionStatusCode || interventionStatus == null) {
    return AppColor.kAlertColor;
  } else {
    return AppColor.kPrimaryColor;
  }
}

///Function to get the duration(in minutes) of a intervention from it's schedule.
int getDurationOfInterventionSchedule({required String scheduleEndTime, required String scheduleStartTime}){
  int endTimeParsedVal = int.parse(scheduleEndTime.substring(11,13));
  int startTimeParsedVal = int.parse(scheduleStartTime.substring(11,13));
  return (endTimeParsedVal-startTimeParsedVal)*60;
}