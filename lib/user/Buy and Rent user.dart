import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Provider/Mainprovider.dart';
import 'package:project/admin/Types.dart';
import 'package:provider/provider.dart';

import 'BottomNavigation.dart';
import 'Login.dart';
import 'UserTypes.dart';

class Buyandrentuser extends StatelessWidget {
  String userid;
  String name;
  String phone;

   Buyandrentuser({super.key,required this.userid,required this.name,required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: Colors.indigoAccent,
      body:Column(
        children: [

          SizedBox(height:350,),
           SizedBox(
             height:100,
             width:500,
             child: Center(
               child: Consumer<Mainprovider>(
                 builder: (context,value,child) {
                   return ListView.builder(
                       padding:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                       physics: ScrollPhysics(),
                       itemCount: value.BRaddList.length,
                       shrinkWrap:true,
                       scrollDirection:Axis.horizontal,
                     itemBuilder: (context, index) {
                       return Padding(
                         padding: const EdgeInsets.only(left: 50,right: 50),
                         child: InkWell(onTap: () {
                           print("cgcgfc"+phone);
                           if(index==0){
                             value.getbuyType(value.BRaddList[index].id,"buy");
                             Navigator.push(context, MaterialPageRoute(builder: (context) =>BottomNavigation(catid:value.BRaddList[index].id.toString(),userid:userid,name:name,phone:phone,houseid: "",convid:"",from:"buy",)));

                           }
                             else{
                             value.getbuyType(value.BRaddList[index].id,"");
                             Navigator.push(context, MaterialPageRoute(builder: (context) =>BottomNavigation(catid:value.BRaddList[index].id.toString(),userid:userid,name:name,phone:phone,houseid: "",convid:"",from:"rent",)));

                           }
                               // Navigator.push(context, MaterialPageRoute(builder: (context) =>userTypes (catid: value.BRaddList[index].id.toString(),),));
                         },
                           child: Container(
                                       width:100,
                                       height: 30,
                                       decoration:BoxDecoration(
                                         color:Colors.indigo,
                                         borderRadius:BorderRadius.circular(10),
                                       ),
                                       child: Center(child: Text(value.BRaddList[index].name,style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),


                                     ),
                         ),
                       );
                     },
                            );
                 }
               ),
             ),
           )
      //     Row(
      //       children: [
      //
      //         Padding(
      //       padding: const EdgeInsets.only(top:250,left:90),
      //       child: Container(
      //         width:130,
      //         height: 50,
      //         decoration:BoxDecoration(
      //           color:Colors.indigo,
      //           borderRadius:BorderRadius.circular(10),
      //         ),
      //         child: Center(child: Text("Rent",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
      //
      //
      //       ),
      //     )
      //   ],
      // ),
        ],
      ),

      );
    // ),
    // );
  }
}
