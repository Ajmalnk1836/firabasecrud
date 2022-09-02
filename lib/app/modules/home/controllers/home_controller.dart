import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasecrud/app/modules/model/usermodel.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  Stream<List<Usermodel>> readusers() => FirebaseFirestore.instance
      .collection("users")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Usermodel.fromJson(doc.data())).toList());
  @override
  void onInit() { 
    super.onInit();
  }


  
  //Future updateData
  // static Future<Response> updateEmployee({
  //   required String name,
  //   required String position,
  //   required String contactno,
  //   required String docId,
  // }) async {
  //   Response response = Response();
  //   DocumentReference documentReferencer =
  //       _Collection.doc(docId);

  //   Map<String, dynamic> data = <String, dynamic>{
  //     "employee_name": name,
  //     "position": position,
  //     "contact_no" : contactno
  //   };

  //   await documentReferencer
  //       .update(data)
  //       .whenComplete(() {
  //          response.code = 200;
  //         response.message = "Sucessfully updated Employee";
  //       })
  //       .catchError((e) {
  //           response.code = 500;
  //           response.message = e;
  //       });

  //       return response;
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
