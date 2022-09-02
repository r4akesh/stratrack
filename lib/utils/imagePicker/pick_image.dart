import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stattrack/utils/imagePicker/image_pick_option.dart';
import 'package:stattrack/utils/permission_handler.dart';

import 'crop_image.dart';
// import 'package:qbooker/app/utils/imagePicker/crop_image.dart';
// import 'package:qbooker/app/utils/imagePicker/image_pick_option.dart';
// import 'package:qbooker/app/utils/permission_handler.dart';

class PickImage {



  static Future<File> imagePickOption() async {
     ImagePickOption? _option = null;
    await Get.bottomSheet(
        Container(
            height: 140,
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Get.back();
                    _option = ImagePickOption.gallery;
                  },
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: const [
                    Icon(
                      Icons.image,
                      size: 66,
                    ),
                    Text(
                      "Gallery",
                      style: TextStyle(fontSize: 5 + 14),
                    )
                  ]),
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                    _option = ImagePickOption.camera;
                  },
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: const [
                    Icon(
                      Icons.camera,
                      size: 66,
                    ),
                    Text(
                      "Camera",
                      style: TextStyle(fontSize: 5 + 14),
                    )
                  ]),
                ),
              ],
            )),
        isDismissible: true,
        enableDrag: true);

    if (_option == null) throw Exception("Image not choose");
    return await _chooseImageFormLibrary(_option!);
  }


  static Future<File> _chooseImageFormLibrary(ImagePickOption type) async {
    final ImagePicker _picker = ImagePicker();
    XFile? image;
    if (type == ImagePickOption.camera) {
      image = await _picker.pickImage(
        source: ImageSource.camera,
      );
    } else {
      if (await PermissionHandle.storagePermission()) {
        image = await _picker.pickImage(source: ImageSource.gallery);
      }
    }

    File? file;

    if(image!=null){
      await Get.dialog(
          CropImage(
              image: File(image.path), onCompletion: (File? croppedImage) async {
            if(croppedImage!=null){
              file=croppedImage;
            }

          }));
    }

    if(file==null)throw Exception('File null :  image not Cropped');

    return file!;

  }
}
