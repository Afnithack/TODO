
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../student_model.dart';

class Registration with ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final DatabaseReference root = FirebaseDatabase.instance.ref();

  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  List<StudentModel> studentList = [];

  void addData(String from, String sId) {
    print("djgsf");
    DateTime tod = DateTime.now();
    String stdid = tod.millisecondsSinceEpoch.toString();
    HashMap<String, Object> map = HashMap();

    map["name"] = namecontroller.text.toString();
    map["phone"] = phonecontroller.text.toString();
    if (from == "NEW") {
      db.collection("Students").doc(stdid).set(map);
    } else {
      db.collection("Students").doc(sId).update(map);


      notifyListeners();
    }
  }

  void getData() {
    db.collection("Students").get().then((value) {
      if (value.docs.isNotEmpty) {
        studentList.clear();
        for (var data in value.docs) {
          studentList.add(
              StudentModel(data.id, data.get("name"), data.get("phone")
              ));
          notifyListeners();
          print(studentList.length.toString());
        }
      }
      notifyListeners();

    });
  }
  void editData(String id){

    db.collection("Students").doc(id).get().then((value){
      if (value.exists){
        Map<dynamic,dynamic> map=value.data() as Map;
        namecontroller.text=map["name"].toString();
        phonecontroller.text=map["phone"].toString();
        notifyListeners();
      }
    });
  }

  void deleteData(sId,BuildContext context){
    print("object"+sId);
    db.collection("Students").doc(sId).delete();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("deleted successfully"),
      backgroundColor: Colors.green,));
    notifyListeners();
    getData();


  }
  void clearfunction(){
    namecontroller.clear();
    phonecontroller.clear();
  }

}




