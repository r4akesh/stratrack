import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandle {
  static Future<bool> isNotificationGranted() async {
    if (await Permission.notification.request().isGranted) {
      return true;
    } else {
      permissionDialog(
          title: "Notification Permission",
          des:
              "This app needs notification access to show notifications.\nGo to settings -> Turn on notification permission");
      return false;
    }
  }

  static Future<bool> isLocationPermission()async{
    return await Permission.location.isGranted;
  }

  static Future<bool> cameraPermission() async {
    if (await Permission.camera.request().isGranted) {
      return true;
    } else {
      permissionDialog(
          title: "Camera Permission",
          des: "This app needs camera access to click and upload images of cars defect points.\nGo to settings -> App permissions -> Turn on camera permission");
      return false;
    }
  }

  static Future<bool> locationPermission() async {
    if (await Permission.location.request().isGranted) {
      return true;
    } else {
      permissionDialog(
          title: "Location Permission",
          des: "This app needs location access to get your location.\nGo to settings -> App permissions -> Turn on location permission");
      return false;
    }
  }

  static Future<bool> storagePermission() async {
    if (await Permission.storage.request().isGranted) {
      return true;
    } else {
      permissionDialog(
          title: "Gallery Permission",
          des:
              "This app needs storage access to pick and upload images of cars defect points.\nGo to settings -> App permissions -> Turn on storage permission");
      return false;
    }
  }

  static Future<bool> platformPermission() async {
    if (Platform.isIOS) {
      if (await isNotificationGranted() &&
          await cameraPermission() &&
          await storagePermission()) {
        return true;
      } else {
        return false;
      }
    } else {
      if (await cameraPermission() && await storagePermission()) {
        return true;
      } else {
        return false;
      }
    }
  }

  static permissionDialog({String? title, String? des}) {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text('$title'),
              content: Text('$des'),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: const Text('Dany'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                CupertinoDialogAction(
                  child: const Text('Settings'),
                  onPressed: () => openAppSettings(),
                ),
              ],
            ));
  }
}
