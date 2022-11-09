import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:stattrack/controller/DashboardController.dart';
import 'package:stattrack/main.dart';
import 'package:stattrack/network/apiClient.dart';
import 'package:stattrack/utils/commen.dart';
import 'package:stattrack/utils/constant.dart';

import '../model/updateProfileModel.dart';
import '../utils/imagePicker/pick_image.dart';

class ProfileEditController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  var filePath = "".obs;
  var isLoading = false.obs;
  final apiClient = Apiclient.instance;
  var coverimageFile = "".obs;
  Rx<File?> profileImage = Rx<File?>(null);
  TextEditingController fname = TextEditingController();
  TextEditingController lastname = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    setData();
  }

  pickImage() async {
    try {
      var file = await PickImage.imagePickOption();
      profileImage.value = file;
      print("data file" + file.path);
      // updateProfileAPICall(file);
    } on Exception catch (e) {
      print(["Error =>", e]);
    }
  }

  void setImageFileListFromFile(XFile? value) {
    var _imageFileList = value == null ? null : <XFile>[value];
    print("pickedFile2");
    print(_imageFileList![0].name);
  }

  void updateProfileAPICall() async {
    var file = profileImage.value;
    var multipat;
    if (file != null) {
      multipat = await dio.MultipartFile.fromFile(
          file.path == null ? "" : file.path,
          filename: file.path == null ? "" : file.path.split("/").last);
    }

    Map<String, dynamic> map = new Map<String, dynamic>();
    try {
      map = {
        "firstName": fname.text,
        "lastName": lastname.text,
        "userId": MyApp.box.read("id"),
        // "photo":await MultipartFile(file.path, filename: file.path.split("/").last)
        "photo": multipat
      };
    } catch (e) {
      print("data photo" + e.toString());
    }

    try {
      isLoading.value = true;
      update();
      var data = await apiClient?.post(
        url: BASE_URL + "users/updateProfilePicture",
        body: map,
        context: Get.context!,
      );

      var responce = UpdateProfileModel.fromJson(data);
      isLoading.value = false;

      print("data>>" + responce.data!.profileImage.toString());
      MyApp.box.write("imageUrl", responce.data!.profileImage.toString());
      MyApp.box.write("firstName", responce.data!.firstName.toString());
      MyApp.box.write("lastName", responce.data!.lastName.toString());
      update();
      toast("You have successfully update your profile");
      // Get.offAll(const Login());
    } catch (e) {
      print("data catch" + e.toString());
    } finally {
      print("data finally");
      isLoading.value = false;
      update();
    }
  }

  void setData() {
    fname.text = MyApp.box.read("firstName");
    lastname.text = MyApp.box.read("lastName");
  }

  @override
  onClose() async {
    super.onClose();
    band();
  }

  band() async {
    await Future.delayed(Duration(microseconds: 300));
    Get.find<DashboardController>().update();
  }
}
