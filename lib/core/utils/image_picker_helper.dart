import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imc/core/utils/app_function.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerHelper{

  static ImagePicker _imagePicker = ImagePicker();

  static Future<String?> openBottomSheet(BuildContext context) async {
    String? imagePath;
    if (Platform.isIOS)
      imagePath = await showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
                child: Text(
                  'Camera',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async {
                  var imagePath = await _browseImage(ImageSource.camera).catchError((e) async {
                    await openAppSettings();
                  });

                  Navigator.pop(context, imagePath);
                }),
            CupertinoActionSheetAction(
              child: Text(
                'Gallery',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () async {
                var imagePath = await _browseImage(ImageSource.gallery);

                Navigator.pop(context, imagePath);
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
    else {
      imagePath = await showModalBottomSheet(context: context, builder: (_) {
        return Container(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Photo Library'),
                tileColor: Colors.white,
                onTap: () async {
                  var imagePath = await _browseImage(ImageSource.gallery);
                  Navigator.pop(context, imagePath);
                },
              ),
              Divider(
                height: 0.5,
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                tileColor: Colors.white,
                onTap: () async {
                  String? imagePath;
                  final cameraPermissionStatus = await Permission.camera.status;
                  if (cameraPermissionStatus.isDenied) {
                    Permission.camera.request().then((value) async {
                      if (value.isPermanentlyDenied) {
                        await openAppSettings();
                      } else if (value.isDenied) {
                        Permission.camera.request();
                      } else if (value.isGranted) {
                        imagePath = await _browseImage(ImageSource.camera);
                      }
                    });
                  } else if (cameraPermissionStatus.isRestricted) {
                    await openAppSettings();
                  } else if (cameraPermissionStatus.isGranted) {
                    imagePath = await _browseImage(ImageSource.camera);
                  }

                  Navigator.pop(context, imagePath);
                },
              ),
            ],
          ),
        );
      });
    }

    if(imagePath != null) {
      String imgExtension = imagePath.split(".").last.toLowerCase();
      if(imgExtension != "png" && imgExtension != "jpg" && imgExtension != "jpeg"){
        flutterToast("Image type not allowed.");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Image type not allowed.")));
        return null;
      }
    }
    return imagePath;

  }

  static Future<String?> _browseImage(ImageSource imageSource) async {
    try {
      var pickedFile = await _imagePicker.pickImage(
        source: imageSource,
        imageQuality: 50,
      );
      if(pickedFile != null)
        return pickedFile.path;

      return null;
    } on Exception catch (e) {
      throw e;
    }
  }

}