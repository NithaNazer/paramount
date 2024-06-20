import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Provider/Mainprovider.dart';
import 'package:provider/provider.dart';

import 'Types.dart';
import 'buyand rentadd.dart';
import '../user/UserTypes.dart';


class BuyandRent extends StatelessWidget {
  const BuyandRent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
      Consumer<Mainprovider>(
          builder: (context,value,child) {
            return FloatingActionButton(
              onPressed: (){
               value. BRTypecontroller.clear();

                Navigator.push(context, MaterialPageRoute(builder: (context)=>Buyandrentadd(from: "NEW",oldid: "")));
              },
              backgroundColor: Colors.blue,
              child: Icon(Icons.add),
            );
          }
      ),
      appBar:AppBar(
        leading:InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_outlined)),
        title:Text("Category",style:TextStyle(color:Colors.black,fontSize:20,fontWeight:FontWeight.w700)),
      ),

      backgroundColor:Colors.white,
      body:
      Consumer<Mainprovider>(
        builder: (context,value,child) {
          return Center(
            child: value.getcategoryloader?Center(child: CircularProgressIndicator(color: Colors.indigo,)):ListView.builder(
              // padding:EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                physics: ScrollPhysics(),
                itemCount: value.BRaddList.length,
                shrinkWrap:true,
                scrollDirection:Axis.vertical,
                itemBuilder:(context,int index) {
            return InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content:  Text(
                        "Do you want to  EDIT or DELETE ?",style: TextStyle(
                        fontSize:17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
                    actions: <Widget>[
                      Center(
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                value.deletecategory(
                                    value.BRaddList[index].id,context);
                                Navigator.of(context).pop();

                              },
                              child: Container(
                                height: 45,
                                width: 90,
                                decoration: BoxDecoration(
                                    color:Colors.red ,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x26000000),
                                        blurRadius: 2.0, // soften the shadow
                                        spreadRadius: 1.0, //extend the shadow
                                      ),
                                    ] ),
                                child: Center(child:  Text("Delete",style: TextStyle( color:Colors.white,fontSize: 17,fontWeight: FontWeight.w700))),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                print("dnnvfhfhf"+value.BRaddList[index].id);
                                value.editcategory(
                                    value.BRaddList[index].id);
                                Navigator.pop(context);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Buyandrentadd(
                                              from: "EDIT",
                                              oldid: value.BRaddList[index].id
                                          ),
                                    ));
                              },
                              child:Container(
                                height: 45,
                                width: 90,
                                decoration: BoxDecoration(
                                    color:Colors.indigo ,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x26000000),
                                        blurRadius: 2.0, // soften the shadow
                                        spreadRadius: 1.0, //extend the shadow
                                      ),
                                    ] ),
                                child: Center(child:  Text("Edit",style: TextStyle( color:Colors.white,fontSize: 17,fontWeight: FontWeight.w700))),
                              ),)
                          ],
                        ),
                      ),

                    ],
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical:20,horizontal: 50),
                height: 80,
                width: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.indigo
                ),
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(value.BRaddList[index].name,
                        style: TextStyle(fontSize: 30,color:Colors.white),),
                    ),
                  ],
                ),
              ),
            );
                }
                ),
          );
        }
      ),
    );
  }
}
