import 'package:firebasecrud/app/modules/home/views/widget/edit.dart';
import 'package:firebasecrud/app/modules/model/usermodel.dart';
import 'package:firebasecrud/app/modules/useraddscreen/controllers/useraddscreen_controller.dart';
import 'package:firebasecrud/app/modules/useraddscreen/views/useraddscreen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('USERS'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder<List<Usermodel>>(
                  stream: controller.readusers(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      final users = snapshot.data;
                      return ListView.builder(
                          itemCount: users!.length,
                          itemBuilder: (BuildContext context, index) {
                            return Slidable(
                              key: ValueKey(0),
                              startActionPane: ActionPane(
                                  motion: const DrawerMotion(),
                                  children: [
                                    SlidableAction(
                                      backgroundColor: Colors.red,
                                      onPressed: (ctx) {
                                        showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            title: const Text("Confirm Delete"),
                                            content: const Text(
                                                "Are you sure you want to delete this item?"),
                                            actions: <Widget>[
                                              TextButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: const Text("Cancel")),
                                              TextButton(
                                                onPressed: () {
                                                  UseraddscreenController
                                                      .instance
                                                      .userdelete(users[index]
                                                          .id
                                                          .toString());
                                                },
                                                child: const Text("Ok"),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      icon: Icons.delete,
                                      label: "Delete",
                                    ),
                                    SlidableAction(
                                      backgroundColor: Colors.green,
                                      onPressed: (ctx) {
                                        print(users[index].name);
                                        print(users[index].admissionnumber);
                                        print(users[index].age);
                                        print(users[index].classes);
                                        print(users[index].collegename);
                                        print(users[index].id);
                                        print(users[index].image.toString());
                                        // Get.off(
                                        //   EditscreenView(),
                                        // );
                                      },
                                      icon: Icons.edit,
                                      label: "Edit",
                                    ),
                                  ]),
                              child: GestureDetector(
                                onTap: () => Get.to(
                                  Screenedit(
                                    names: users[index].name,
                                    admino: users[index].admissionnumber,
                                    ages: users[index].age,
                                    clas: users[index].classes,
                                    clgname: users[index].collegename,
                                    id: users[index].id,
                                    image: users[index].image,
                                  ),
                                ),
                                child: Container(
                                  height: 80,
                                  child: Card(
                                    child: ListTile(
                                      leading: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 9.0),
                                        child: CircleAvatar(
                                          radius: 30,
                                          backgroundImage:
                                              NetworkImage(users[index].image!),
                                        ),
                                      ),
                                      title: Text(
                                        users[index].name.toString(),
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                          users[index].collegename.toString()),
                                      trailing: Text(users[index]
                                          .admissionnumber
                                          .toString()),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                  }))
        ],
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          Get.to(
            UseraddscreenView(),
          );
        },
      ),
    );
  }
}
