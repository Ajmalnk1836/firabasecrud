import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasecrud/app/modules/constants/const.dart';
import 'package:firebasecrud/app/modules/home/views/home_view.dart';
import 'package:firebasecrud/app/modules/model/usermodel.dart';
import 'package:firebasecrud/app/modules/useraddscreen/controllers/useraddscreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class Screenedit extends StatefulWidget {
  final String? names;
  final int? ages;
  final String? clas;
  final int? admino;
  final String? clgname;
  final String? id;
  final String? image;
  Screenedit(
      {Key? key,
      this.names,
      this.ages,
      this.clas,
      this.admino,
      this.clgname,
      this.id,
      this.image})
      : super(key: key);

  @override
  State<Screenedit> createState() => _ScreeneditState();
}

class _ScreeneditState extends State<Screenedit> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  TextEditingController age = TextEditingController();

  TextEditingController classes = TextEditingController();

  TextEditingController admisionum = TextEditingController();

  TextEditingController collegename = TextEditingController();

  //final uid = FirebaseAuth.instance.currentUser!.uid;
  final docUse = FirebaseFirestore.instance.collection("user").doc();

  late String ids;

  UseraddscreenController controller = Get.put(UseraddscreenController());
  @override
  void initState() {
    // TODO: implement initState
    name.text = widget.names.toString();
    age.text = widget.ages.toString();
    classes.text = widget.clas.toString();
    admisionum.text = widget.admino.toString();
    collegename.text = widget.clgname.toString();
    ids = widget.id.toString();
    super.initState();
    final String image = widget.image.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(children: [
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
                  Text("EDIT USER",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold, fontSize: 33)),
                ],
              ),
              Container(
                  height: getHeight(context, 100),
                  width: getWidth(context, 80),
                  child: Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    Stack(children: [
                      UseraddscreenController.instance.imagefile == null
                          ? CircleAvatar(
                              radius: 80,
                              backgroundImage:
                                  //FileImage()
                                  NetworkImage(widget.image.toString()),
                              // backgroundImage: FileImage(
                              //     UseraddscreenController
                              //         .instance.imagefile!),
                            )
                          : CircleAvatar(
                              radius: 80,
                              backgroundImage: FileImage(
                                  UseraddscreenController.instance.imagefile!),
                            ),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          label: Text(
                            "Username",
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
                      controller: age,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          label: Text(
                            "Age",
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
                      controller: classes,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          label: Text(
                            "class",
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
                      controller: admisionum,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          label: Text(
                            "admissionnumber",
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
                      controller: collegename,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          label: Text(
                            "Collegename",
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
                    ElevatedButton(
                      child: Text('Edit '),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final docUser = FirebaseFirestore.instance
                              .collection("users")
                              .doc(ids);
                          controller.userEdit(
                              name.text.toString(),
                              int.parse(age.text.toString()),
                              classes.text.toString(),
                              int.parse(admisionum.text.toString()),
                              collegename.text.toString(),
                              ids.toString(),
                              widget.image.toString());
                          Get.off(HomeView());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          padding: EdgeInsets.symmetric(
                              horizontal: 140, vertical: 19),
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ]))
            ]),
          ),
        ),
      ),
    );
  }
}
