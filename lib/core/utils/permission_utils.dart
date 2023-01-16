import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:location/location.dart' as locationPackage;
import 'package:permission_handler/permission_handler.dart';

class PermissionHelperFunctions {

  static locationPackage.Location location = locationPackage.Location();

  // THis is the permission to ask user for location
  // and if user denies it it asks for permission again
  static enableLocation(BuildContext context, Function? onPermissionGranted) async {
    PermissionStatus status = await Permission.location.status;
    if (status.isDenied) {
      PermissionStatus currentPermissionStatus = await Permission.location.request();
      if (currentPermissionStatus.isPermanentlyDenied) {
        showPleaseGrantPermissionDialog(
            context,
            "IMC needs location access. To continue, please allow location access in Settings.",
            openAppSettings
        );
      } else if (currentPermissionStatus.isDenied) {
        showPleaseGrantPermissionDialog(
            context,
            "IMC needs location access. To continue, please allow location access",
                () {
              enableLocation(context, onPermissionGranted);
            });
      } else if (currentPermissionStatus.isGranted) {
        if (await Permission.locationWhenInUse.serviceStatus.isDisabled) {
          enableLocationService(context);
        } else {
          if(onPermissionGranted != null){
            onPermissionGranted();
          }
        }
      }
    } else if (status.isGranted) {
      if (await Permission.locationWhenInUse.serviceStatus.isDisabled) {
        enableLocationService(context);
      } else {
        if(onPermissionGranted != null){
          onPermissionGranted();
        }
      }
    }
  }

  // THis is the permission to ask user for location service
  // Sometime users have to enable location service and it asks for it
  // and if user denies it it asks for permission again
  static enableLocationService(BuildContext context) async {
    bool _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      bool currentStatus = await location.requestService();
      if (!currentStatus) {
        showPleaseGrantPermissionDialog(context,
            "Please turn on location Services for better functionality", () {
              enableLocationService(context);
            });
      } else {
        enableLocation(context, null);
      }
    }
  }

  static enableCameraNMicFunction(BuildContext context,
      {required Function grantedCallback, Function? deniedCallback}) async {
    PermissionStatus cameraStatus = await Permission.camera.status;
    PermissionStatus micStatus = await Permission.microphone.status;
    if (cameraStatus.isDenied || micStatus.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.camera,
        Permission.microphone,
      ].request();

      PermissionStatus currentCameraPermission = statuses[Permission.camera]!;
      PermissionStatus currentMicPermission = statuses[Permission.microphone]!;

      if (currentCameraPermission.isPermanentlyDenied) {
        showPleaseGrantPermissionDialog(
            context,
            "Tova needs microphone permission to video call with doctors. To continue, please allow camera access in Settings.",
            openAppSettings);
      } else if (currentCameraPermission.isDenied) {
        showPleaseGrantPermissionDialog(context,
            "Tova needs microphone permission to video call with doctors. To continue, please allow microphone access.", () {
              enableCameraNMicFunction(context,
                  grantedCallback: grantedCallback, deniedCallback: deniedCallback);
            });
      } else if (currentCameraPermission.isGranted) {
        if (currentMicPermission.isGranted) {
          grantedCallback();
        }
      }

      // for microphone
      if (currentMicPermission.isPermanentlyDenied) {
        showPleaseGrantPermissionDialog(
            context,
            "Tova needs microphone permission to video call with doctors. To continue, please allow microphone access in Settings.",
            openAppSettings);
      } else if (currentMicPermission.isDenied) {
        showPleaseGrantPermissionDialog(context,
            "Tova needs microphone permission to video call with doctors. To continue, please allow microphone access.",
                () {
              enableCameraNMicFunction(context,
                  grantedCallback: grantedCallback, deniedCallback: deniedCallback);
            });
      } else if (currentMicPermission.isGranted) {
        if (currentCameraPermission.isGranted) {
          grantedCallback();
        }
      }
    } else {
      grantedCallback();
    }
  }


  static Future<bool> enableStoragePermission(BuildContext context) async {
    PermissionStatus status = await Permission.storage.status;
    if (status.isDenied) {
      PermissionStatus currentPermissionStatus = await Permission.storage.request();

      if (currentPermissionStatus.isPermanentlyDenied) {
        showPleaseGrantPermissionDialog(
            context,
            "Tova needs Files permission to pick files. To continue, please allow files permission access in Settings.",
            openAppSettings);
      } else if (currentPermissionStatus.isDenied) {
        showPleaseGrantPermissionDialog(context,
            "Tova needs Files permission to pick files. To continue, please allow files permission access.",
                () {
              enableStoragePermission(context);
            });
      }
      return false;
    }
    else if (status.isGranted) {
      return true;
    }
    return false;
  }


  //THis function shows dialog when user deny the permission
  static showPleaseGrantPermissionDialog(
      BuildContext context, String title, Function onPressed) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("$title"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Not Now")),
              TextButton(
                  onPressed: () {
                    // Again asking user to grant permission.
                    Navigator.pop(context);
                    onPressed();
                  },
                  child: Text("Grant Permission")
              )
            ],
          );
        });
  }
}
