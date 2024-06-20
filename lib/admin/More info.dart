import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Provider/Mainprovider.dart';

class Moreinfo extends StatelessWidget {
  String id;
  String book_name;
  String book_phone;
  String book_date;
  String book_time;
  String userid;
  String typeid;
  String type;
  Moreinfo({super.key,required this.id,required this.book_name,required this.book_phone,required this.book_date,required this.book_time,required this.userid,required this.typeid,required this.type});

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.grey,
        leading:InkWell(
            onTap:() {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_outlined)),
        title: SizedBox(width: 400,
          child:TextField(
            decoration: InputDecoration(labelText: "Booking Details",
              fillColor: Colors.grey,
              border: OutlineInputBorder(
                borderRadius:  BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ),
    body:SingleChildScrollView(

      child: Column(
      children: [
      SizedBox(height:60,),
      Center(
      child: Padding(
      padding: const EdgeInsets.only(top:50),
      child: Column(
      children: [
        Center(
          child: Consumer<Mainprovider>(
              builder: (context,value,child) {

                return SingleChildScrollView(
                child: Container(
                          height:500,
                          width:300,
                          decoration:BoxDecoration(
                            color:Colors.indigo,
                            borderRadius:BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Name   :",style:GoogleFonts.inriaSans(color:Colors.black,fontWeight:FontWeight.w500,fontSize:20)),
                                  Text(book_name,
                                    style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20),
                                    //
                                    // )),
                                  )
                                ],
                              ),

                              SizedBox(height:20,),
                              Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Mobile No:",style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),
                                  Text(book_phone,style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),
                                  // SizedBox(
                                  //   width:100,
                                  //   height:30,
                                  //   child:TextField(
                                  //     decoration:InputDecoration(
                                  //       filled: true,
                                  //       fillColor:Colors.grey,
                                  //       border:OutlineInputBorder(),
                                  //     ),
                                  //     style:TextStyle(color:Colors.white),
                                  //   ),
                                  // ),
                                ],
                              ),

                              SizedBox(height:30,),

                              Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Time:",style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),
                                  Text(book_time,style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),

                                ],
                              ),

                              SizedBox(height:20,),


                              Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("User ID:",style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),
                                  Text(userid,style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),
                                ],
                              ),


                               SizedBox(height:20,),



                              Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Type ID:",style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),
                                  Text(typeid,style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),
                                ],
                              ),


                              SizedBox(height:20,),


                              Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Type :",style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),
                                  Text(type,style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),
                                ],
                              ),

                            ],
                          ),

                        ),
                );



              }
          ),
        ),
      // Row(
      // mainAxisAlignment:MainAxisAlignment.spaceEvenly,
      // children: [
      // Text("Name     :",style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20)),
      // SizedBox(
      // width:100,
      // height:30,
      // child:TextField(
      // decoration:InputDecoration(
      // filled: true,
      // fillColor:Colors.grey,
      // border:OutlineInputBorder(),
      // ),
      // style:TextStyle(color:Colors.white),
      // ),
      // ),
      // ],
      // ),
      //
      // SizedBox(height:30),
      //
      //   Padding(
      //     padding: const EdgeInsets.only(right:5),
      //     child: Row(
      //       mainAxisAlignment:MainAxisAlignment.spaceEvenly,
      //       children: [
      //         Text("Mobile No    :",style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),
      //         SizedBox(
      //           width:100,
      //           height:30,
      //           child:TextField(
      //             decoration:InputDecoration(
      //               filled: true,
      //               fillColor:Colors.grey,
      //               border:OutlineInputBorder(),
      //             ),
      //             style:TextStyle(color:Colors.white),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      //
      //   SizedBox(height:30,),
      //
      //   Padding(
      //     padding: const EdgeInsets.only(right:5),
      //     child: Row(
      //       mainAxisAlignment:MainAxisAlignment.spaceEvenly,
      //       children: [
      //         Text("Date    :",style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),
      //         SizedBox(
      //           width:100,
      //           height:30,
      //           child:TextField(
      //             decoration:InputDecoration(
      //               filled: true,
      //               fillColor:Colors.grey,
      //               border:OutlineInputBorder(),
      //             ),
      //             style:TextStyle(color:Colors.white),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      //
      //   SizedBox(height:30,),
      //
      //   Padding(
      //     padding: const EdgeInsets.only(right:5),
      //     child: Row(
      //       mainAxisAlignment:MainAxisAlignment.spaceEvenly,
      //       children: [
      //         Text("Event     :",style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),
      //         SizedBox(
      //           width:100,
      //           height:30,
      //           child:TextField(
      //             decoration:InputDecoration(
      //               filled: true,
      //               fillColor:Colors.grey,
      //               border:OutlineInputBorder(),
      //             ),
      //             style:TextStyle(color:Colors.white),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      //
      //   SizedBox(height:30,),
      //
      //   Padding(
      //     padding: const EdgeInsets.only(right:5),
      //     child: Row(
      //       mainAxisAlignment:MainAxisAlignment.spaceEvenly,
      //       children: [
      //         Text("More info    :",style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),
      //         SizedBox(
      //           width:180,
      //           height:60,
      //           child:TextField(
      //             decoration:InputDecoration(
      //               filled: true,
      //               fillColor:Colors.grey,
      //               border:OutlineInputBorder(),
      //             ),
      //             style:TextStyle(color:Colors.white),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),

      ],
      ),
      ),
      ),
        ],
      ),
    ),
    );
  }
}
