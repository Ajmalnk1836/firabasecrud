import 'package:firebasecrud/app/modules/constants/const.dart';
import 'package:firebasecrud/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/useraddscreen_controller.dart';

class UseraddscreenView extends GetView<UseraddscreenController> {
  UseraddscreenController controller = Get.put(UseraddscreenController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // final name =
    return Scaffold(
        body: SafeArea(
            child: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.green,
                  ),
                  iconSize: 30,
                ),
                SizedBox(width: 80),
                Text("ADD USER",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold, fontSize: 33)),
              ],
            ),
            Container(
              height: getHeight(context, 100),
              width: getWidth(context, 80),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  GetBuilder<UseraddscreenController>(
                    builder: (controller) => Stack(
                      children: [
                        UseraddscreenController.instance.imagefile == null
                            ? CircleAvatar(
                                radius: 80,
                                backgroundImage: NetworkImage(
                                    "https://www.w3schools.com/howto/img_avatar.png"))
                            : CircleAvatar(
                                radius: 80,
                                backgroundImage: FileImage(
                                    UseraddscreenController
                                        .instance.imagefile!),
                              ),
                        Positioned(
                            top: 100,
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                        title: "",
                                        content: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("Camera"),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      controller.selectCamera();

                                                      Get.back();
                                                    },
                                                    icon: Icon(
                                                      Icons.camera,
                                                      color: Colors.black,
                                                    ))
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("Gallery"),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      controller
                                                          .selectgallery();

                                                      Get.back();
                                                    },
                                                    icon: Icon(
                                                      Icons.photo,
                                                      color: Colors.black,
                                                    ))
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 30,
                                    )))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        label: Text(
                          "name",
                        ),
                        prefixIcon: Icon(Icons.person),
                        prefixIconColor: Colors.red,
                        fillColor: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.age,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        label: Text(
                          "Age",
                        ),
                        prefixIcon: Icon(Icons.ac_unit_sharp),
                        prefixIconColor: Colors.red,
                        fillColor: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.classes,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        label: Text(
                          "class",
                        ),
                        prefixIcon: Icon(Icons.class_),
                        prefixIconColor: Colors.red,
                        fillColor: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.admisionum,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        label: Text(
                          "admissionnumber",
                        ),
                        prefixIcon: Icon(Icons.numbers),
                        prefixIconColor: Colors.red,
                        fillColor: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.collegename,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        label: Text(
                          "Collegename",
                        ),
                        prefixIcon: Icon(Icons.school),
                        prefixIconColor: Colors.red,
                        fillColor: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: Text('Add '),
                    onPressed: () async {
                      if (controller.imagefile == null) {
                        Get.snackbar("empty", "message");
                      }
                      if (_formKey.currentState!.validate() &&
                          controller.imagefile != null) {
                        controller.useradd(
                            controller.name.text,
                            int.parse(controller.age.text),
                            controller.classes.text,
                            int.parse(controller.admisionum.text),
                            controller.collegename.text);
                        Get.off(HomeView());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding:
                            EdgeInsets.symmetric(horizontal: 140, vertical: 19),
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
