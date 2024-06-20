import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/user/BookNow.dart';

import 'convBooking.dart';


class Conventionlists2 extends StatelessWidget {
  List<dynamic> photo;
  String convid;
  String convdescription;
  String convaddress;
  String convprice;
  String typeid;
  String type;
  Conventionlists2({super.key,required this.photo,required this.convid,required this.convdescription,required this.convaddress,required this.convprice,
    required this.typeid,required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          SafeArea(
            child: Container(
              height:320,
              width:460,
              decoration:BoxDecoration(
                color:Colors.black,
                borderRadius:BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(photo[0]),
                  fit: BoxFit.cover,
              ),
              ),
            ),
          ),
          SizedBox(height:8,),
          Row(
            children: [
              Container(
                height:75,
                width:94,
                decoration:BoxDecoration(
                  color:Colors.white,
                  borderRadius:BorderRadius.circular(5),
                ),
                child: Image.network(photo[1], fit: BoxFit.cover),
              ),


          SizedBox(width:2),

          Container(
            height:75,
            width:94,
            decoration:BoxDecoration(
              color:Colors.white,
              borderRadius:BorderRadius.circular(5),
            ),
            child: Image.network(photo[2], fit: BoxFit.cover),
          ),
            ],
          ),

          SizedBox(height:30,),

   
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
    child: Column(
      children: [
        Row(
          children: [
            Text(" Description      :",style:GoogleFonts.inriaSans(color:Colors.indigo,fontWeight:FontWeight.w500,fontSize:20)),
            SizedBox(width:5,),
            Expanded(child: Text(convdescription,style:GoogleFonts.inriaSans(color:Colors.indigo,fontWeight:FontWeight.w500,fontSize:20),)),
          ],
        ),
            
            SizedBox(height:30,),
            Row(
              children: [
                Text(" Address          :",style:GoogleFonts.inriaSans(color:Colors.indigo,fontWeight:FontWeight.w500,fontSize:20)),
                SizedBox(width: 5,),
                Expanded(child: Text(convaddress,style:GoogleFonts.inriaSans(color:Colors.indigo,fontWeight:FontWeight.w500,fontSize:20),))
              ],
            ),
                     
            
            
            SizedBox(height:30,),
            Row(
            children: [
            Text(" Price            :",style:GoogleFonts.inriaSans(color:Colors.indigo,fontWeight:FontWeight.w500,fontSize:20)),
              SizedBox(width:5,),
             Expanded (child: Text(convprice ,style:GoogleFonts.inriaSans(color:Colors.indigo,fontWeight:FontWeight.w500,fontSize:20),)),
            ],
            ),
            
            SizedBox(height:30,),
       
      ],
    ),
    ),
    // }

          SizedBox(height:70,),

          Container(
            height:40,
            width:110,
            decoration:BoxDecoration(
              color:Colors.indigo,
              borderRadius:BorderRadius.circular(10),
            ),
            child:InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ConvBooking(typeid:typeid,type: type,convid:convid),));

                },

                child: Center(child: Text("BookNow",style:GoogleFonts.aBeeZee(color:Colors.white,fontWeight:FontWeight.w500,fontSize:15)))),
          ),

        ],
      ),
    );
  }
}
