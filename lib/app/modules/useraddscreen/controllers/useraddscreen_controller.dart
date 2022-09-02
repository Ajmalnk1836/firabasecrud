import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebasecrud/app/modules/model/usermodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UseraddscreenController extends GetxController {
  //TODO: Implement UseraddscreenController

  static UseraddscreenController instance = Get.find();

  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController classes = TextEditingController();
  TextEditingController admisionum = TextEditingController();
  TextEditingController collegename = TextEditingController();

  final count = 0.obs;
  File? imagefile;

  String? downloadurl;
  @override
  void onInit() {
    super.onInit();
  }

  void userdelete(
    String id,
  ) {
    final docUser = FirebaseFirestore.instance.collection("users").doc(id);
    docUser.delete();
  }
   String validateSample(String value) {
    if (value.trim().isEmpty) {
      return 'This field should not be empty';
    } else if (value.length < 4) {
      return 'Minimum allowed is 6 charaters';
    }
    return "";
  }

  void userEdit(String name, int age, String classs, int admnumber,
      String collegename, String userid, String image) async {
    // try {
    final docUser = FirebaseFirestore.instance.collection("users").doc(userid);
    // await uploadImage();
    final usermodel = Usermodel(
        name: name,
        age: age,
        id: docUser.id,
        classes: classs,
        admissionnumber: admnumber,
        collegename: collegename,
        image: image);
    final json = usermodel.tojson();
    await docUser.update(json);
    imagefile = null;
    // } catch (e) {
    //   Get.snackbar("About user", "Not matcthed",
    //       backgroundColor: Colors.red,
    //       snackPosition: SnackPosition.BOTTOM,
    //       titleText: Text(
    //         "Account creation failed",
    //         style: TextStyle(color: Colors.white),
    //       ),
    //       messageText: Text(
    //         e.toString(),
    //         style: TextStyle(color: Colors.white),
    //       ));
    // }
  }

  void useradd(String name, int age, String classs, int admnumber,
      String collegename) async {
    try {
      final docUser = FirebaseFirestore.instance.collection("users").doc();

      await uploadImage();
      final usermodel = Usermodel(
          id: docUser.id,
          name: name,
          age: age,
          classes: classs,
          admissionnumber: admnumber,
          collegename: collegename,
          image: downloadurl);
      final json = usermodel.tojson();
      await docUser.set(json);
      imagefile = null;
      Get.snackbar("Suucessfull", "congrats",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
    } catch (e) {
      Get.snackbar("About user", "Not matcthed",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Account creation failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  Future selectCamera() async {
    final pickcamera =
        await ImagePicker().pickImage(source: ImageSource.camera);
    imagefile = File(pickcamera!.path);
    update();
  }

  Future selectgallery() async {
    final pickgallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    imagefile = File(pickgallery!.path);
    update();
  }

  Future uploadImage() async {
    final postId = DateTime.now().microsecondsSinceEpoch.toString();
    final docUser = FirebaseFirestore.instance.collection("users").doc();
    //final userId = FirebaseAuth.instance.currentUser?.uid;
    FirebaseFirestore firebasefirestore = FirebaseFirestore.instance;
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("${docUser.id}profileimage1")
        .child("post$postId");
    await ref.putFile(imagefile!);
    downloadurl = await ref.getDownloadURL();
    print(downloadurl);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
