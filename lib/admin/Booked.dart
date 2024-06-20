import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Provider/Mainprovider.dart';
import 'package:provider/provider.dart';

import 'More info.dart';

class Booked extends StatelessWidget {
  const Booked({super.key});

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.indigo,
        leading:InkWell(
            onTap:() {

              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_outlined)),
    title:Text("Booked",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),),
        centerTitle: true,
      ),
        body:SingleChildScrollView(
          physics:ScrollPhysics(),
          child: Column(
            children: [
              // SizedBox(height:10,),
              Center(
              child: Consumer<Mainprovider>(
                builder: (context,value,child) {

                  return SingleChildScrollView(
                    child: ListView.builder(
                      padding:EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      itemCount:value.Booklist.length,
                      shrinkWrap: true,
                      scrollDirection:Axis.vertical,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, int index){
                        var item=value.Booklist[index];
                        print("bbnnm"+value.Booklist[index].book_name);
                       return Container(
                         margin: EdgeInsets.symmetric(vertical: 10),
                         padding: EdgeInsets.all(20),
                         decoration: BoxDecoration(
                           color: Colors.indigo,
                           borderRadius: BorderRadius.circular(10),
                         ),
                    
                    
                       child: Column(
                         crossAxisAlignment:CrossAxisAlignment.start,
                       children: [
                       Row(
                       mainAxisAlignment:MainAxisAlignment.spaceBetween,
                       children: [
                       Text("Name          :",style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20)),
                       Text(value.Booklist[index].book_name,
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
                       Text("Mobile No    :",style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),
                         Text(value.Booklist[index].book_phone,style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),

                       ],
                       ),

                       SizedBox(height:30,),

                       Row(
                       mainAxisAlignment:MainAxisAlignment.spaceBetween,
                       children: [
                       Text("Date               :",style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),
                         Text(value.Booklist[index].book_date,style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),

                       ],
                       ),

                       SizedBox(height:30,),


                       Row(
                       children: [
                         InkWell(
                       onTap:() {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => Moreinfo(
                         id: item.id,book_name:item.book_name,book_phone: item.book_phone,
                         book_date:item.book_date,book_time:item.book_time,userid:item.userid,typeid:item.typeid,type: item.type,),));
                       },

                       child: Container(
                         margin: EdgeInsets.only(left: 28),
                       width:width/1.4,
                       height:35,
                       decoration:BoxDecoration(
                       color:Colors.white,
                       borderRadius:BorderRadius.circular(5),
                       ),
                       child:Center(child: Text("More Info:",style:GoogleFonts.alatsi(color:Colors.indigo,fontSize:16,fontWeight:FontWeight.normal))),
                       ),
                       ),



                         SizedBox(height:20,)
                       ],
                       ),
                       ],
                       ),
                       );
                     },
                    ),
                  );
                }
              ),
              ),
              ],
              ),
        ),
    );
  }
}
