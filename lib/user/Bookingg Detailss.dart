import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Provider/Mainprovider.dart';

class BookinggDetailss extends StatelessWidget {
  const BookinggDetailss({super.key});

  @override
  Widget build(BuildContext context) {
    print("nnnn");
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        // leading:InkWell(
        //     onTap: () {
        //       Navigator.pop(context);
        //     },
        //     child: Icon(Icons.arrow_back_outlined)),
        backgroundColor: Colors.indigo,
        title:Text("Booking Details",style:TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.w700)),
      ),
      body:Consumer<Mainprovider>(
          builder: (context,value,child) {
            return SingleChildScrollView(
              child: ListView.builder(
                  padding:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: value.Booklist.length,
                  shrinkWrap:true,
                  itemBuilder:(context,int index){
                    return Padding(
                      padding: const EdgeInsets.only(top:100),
                      child: Container(
                        height:400,
                        width:500,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color:Colors.indigo,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            Row(
                              children: [
                                Text("Property       :       ",style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black),),
                                Text( value.Booklist[index].type,style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black),),
                              ],
                            ),

                            Row(
                              children: [
                                Text("PropertyID   : ",style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black),),
                                Text( value.Booklist[index].id,style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black),),
                              ],
                            ),


                            Row(
                              children: [
                                Text("Name            :     ",style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black),),
                                Text( value.Booklist[index].book_name,style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black),),
                              ],
                            ),


                            Row(
                              children: [
                                Text("Phone           :     ",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                                Text(value.Booklist[index].book_phone,style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black),),
                              ],
                            ),


                            Row(
                              children: [
                                Text("Visit Date     : ",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                                Text(value.Booklist[index].book_date,style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black),),
                              ],
                            ),



                            Row(
                              children: [
                                Text("Visit Time     :    ",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                                Text(value.Booklist[index].book_time,style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black),),
                              ],
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

