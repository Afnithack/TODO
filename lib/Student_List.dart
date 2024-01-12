import 'package:crud/providers/Registration_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Add_Student.dart';

class Primary extends StatelessWidget {
  const Primary({super.key});

  @override
  Widget build(BuildContext context) {
    Registration provider=Provider.of<Registration>(context,listen: false);
    provider.getData();
    return Scaffold(floatingActionButton: Consumer<Registration>(
      builder: (context,value,child) {
        return FloatingActionButton (
            backgroundColor: Colors.teal.shade800,onPressed: () {
           value.clearfunction();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>Login(from: 'NEW',sId:'' ,)),
          );
        },
            child: Icon(Icons.add,color: Colors.white),);
      }
    ),
        appBar: AppBar(
          backgroundColor: Colors.teal.shade800,
          title: Center(child: Text("Student List",style: TextStyle(color: Colors.white),)),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right:110),
          child: Consumer<Registration>(
              builder: (context,value,child) {
                return  value.studentList.isNotEmpty?
                  ListView.builder(
                  itemCount:value.studentList.length,
                  itemBuilder: (context, index) {

                    return Container(height: 80,color: Colors.white,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(height: 80,
                            ),
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(value.studentList[index].name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                              Text(value.studentList[index].phone,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                            ],),
                          Row(
                            children: [
                              Consumer<Registration>(
                                  builder: (context,value3,child) {
                                    return IconButton(onPressed: (){
                                        value.editData(value.studentList[index].id);
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(from:"EDIT",sId: value.studentList[index].id)));

                                    }, icon: Icon(Icons.edit),);


                                  }
                              ),
                              Consumer<Registration>(
                                  builder: (context,value3,child) {
                                    return IconButton(onPressed: (){
                                      print(value3.studentList[index].id+"hhuhuhuhuh");
                                      print(value3.studentList[index].name+"nnbnnn");
                                       value3.deleteData(value3.studentList[index].id,context);

                                       }, icon: Icon(Icons.delete),);


                                  }
                              ),
                            ],
                          ),

                        ],
                      ),
                    );
                  },
                  ):
                Text("Student List is empty");

              }
          ),
        )

    );
  }
}
