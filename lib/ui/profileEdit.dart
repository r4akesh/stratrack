import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stattrack/controller/ProfileEditController.dart';
import 'package:stattrack/main.dart';
import 'package:stattrack/ui/changePassword.dart';

import '../utils/colors.dart';
import '../utils/commen.dart';
import '../utils/constant.dart';

class ProfileEdit extends StatelessWidget {
  ProfileEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileEditController>(
        init: ProfileEditController(),
        builder: (value) => Scaffold(
              appBar: appBarProfile(value),
              body: profileView(context, value),
            ));
  }

  AppBar appBarProfile(ProfileEditController editController) {
    // print("data url"+MyApp.box.read("imageUrl"));
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 150,
      elevation: 0,
      flexibleSpace: Stack(
        children: [
          Image.asset(
            topHeaderImg,
            fit: BoxFit.fill,
            height: 200,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 40,
                  height: 40,
                  child: Image.asset(
                    backIcon,
                    scale: 3,
                    height: 20,
                    width: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          editController.pickImage();
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          child: ClipOval(
                            child: SizedBox.fromSize(
                                size: const Size.fromRadius(39),
                                child: Obx(() =>
                                    editController.profileImage.value != null
                                        ? Image.file(File(editController
                                            .profileImage.value!.path))
                                        : MyApp.box.read("imageUrl") == null
                                            ? Image.asset(demoImage5)
                                            : MyApp.box
                                                    .read("imageUrl")
                                                    .toString()
                                                    .isEmpty
                                                ? Image.asset(demoImage5)
                                                : Image.network(
                                                    MyApp.box.read("imageUrl"),
                                                    fit: BoxFit.fill))),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Image.asset(
                            cameraIcon,
                            scale: 2.5,
                          ))
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText(
                          MyApp.box.read("firstName") != null
                              ? MyApp.box.read("firstName") +
                                  " " +
                                  MyApp.box.read("lastName")
                              : "",
                          txtColor: Colors.white,
                        ),
                        appText(
                            MyApp.box.read("email") != null
                                ? MyApp.box.read("email")
                                : "",
                            txtColor: appLightBlue,
                            fontweight: FontWeight.w400,
                            fontSize: 14)
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container profileView(
      BuildContext context, ProfileEditController editController) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: appText("First name",
                        fontweight: FontWeight.w400,
                        fontSize: 16,
                        txtColor: appTextGrey)),
                Expanded(
                    child: appTextFieldEdit(controller: editController.fname)),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              thickness: 1,
            ),
            Row(
              children: [
                Expanded(
                    child: appText("Last name",
                        fontweight: FontWeight.w400,
                        fontSize: 16,
                        txtColor: appTextGrey)),
                Expanded(
                    child:
                        appTextFieldEdit(controller: editController.lastname)),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: appText("Email",
                        fontweight: FontWeight.w400,
                        fontSize: 16,
                        txtColor: appTextGrey)),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: MyApp.box.read("email") != null
                        ? appText(MyApp.box.read("email"),
                            fontweight: FontWeight.w400,
                            fontSize: 16,
                            txtColor: appTextGrey)
                        : appText(""),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: appText("Password",
                        fontweight: FontWeight.w400,
                        fontSize: 16,
                        txtColor: appTextGrey)),
                Expanded(
                    child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(ChangePassword());
                          },
                          child: appText("Change ?",
                              fontweight: FontWeight.w600,
                              fontSize: 16,
                              txtColor: appOrange),
                        ))),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
                onTap: () {
                  editController.updateProfileAPICall();
                },
                child: editController.isLoading.value
                    ? CircularProgressIndicator()
                    : appButton(context, "Submit", 60, appOrange))
          ],
        ),
      ),
    );
  }
}
