

import 'package:crud/providers/Registration_providers.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Student_List.dart';

class Login extends StatelessWidget {
  String from;
  String sId;
   Login({super.key,required this.from,required this.sId});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal,title: Text("Add Student",style: TextStyle(color: Colors.white),),),
      backgroundColor: Colors.teal.shade50,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.teal.shade700,
                ),
                child: Consumer<Registration>(
                                  builder: (context,value,child) {
                                    return TextField(controller:value.namecontroller ,style: TextStyle(color: Colors.white),

                            decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    hintText: "name",
                                    hintStyle: TextStyle(color: Colors.white)
                            ),
                          );}),








            ),
          ),
          SizedBox(height: 30,),
          Center(child: Container(
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.teal.shade700,
            ),
            child: Consumer<Registration>(
                builder: (context,value,child) {
                  return TextField(
                    controller: value.phonecontroller,style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: "phone",
                        hintStyle: TextStyle(color: Colors.white)
                    ),
                  );
                }
            ),
          )),
          SizedBox(height: 30,),
          Consumer<Registration>(
              builder: (context,value,child) {
                return TextButton(onPressed: (){
                  print("code here");
                  if(from=='NEW'){
                    value.addData('NEW', '');
                  }
                  else{
                    value.addData('EDIT',sId);
                  }
                  value.getData();
                  Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) =>Primary()));
                },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal.shade800,
                  ),
                  child: Text("save",style: TextStyle(color: Colors.white),
                  ),
                );
              }
          )
        ],
      ),

    );
  }
}
