import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Provider/Mainprovider.dart';
import 'package:provider/provider.dart';

import '../admin/BuyAndRent.dart';
import 'Buy and Rent user.dart';

class AboutUs extends StatelessWidget {
  String userid;
  String name;
  String phone;

   AboutUs({super.key,required this.userid,required this.name,required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading:false,
        backgroundColor:Colors.indigo,
        title:Text("About Us",style:GoogleFonts.inter(color:Colors.white,fontSize:18,fontWeight:FontWeight.bold)),
      ),
       body:Column(
         children: [
           SizedBox(height:50,),
           
           Padding(
             padding: const EdgeInsets.only(left:5),
             child: Text("Paramount properties covers the entire property sale and rent journey,"
                 "handling everything from marketing to contracts,facility bookings,"
                 "and move-outs offering a comprehensive and streamlined experience for our users.",style:TextStyle(color:Colors.black54,fontSize:18),),
           ),

           SizedBox(height:80,),

           Padding(
             padding: const EdgeInsets.only(left:10),
             child: Row(
               children: [
                 Image.asset("assets/img_27.png",scale:3),
                 Text("  :  Paramount123",style:GoogleFonts.aBeeZee(color:Colors.black87,fontSize:13,fontWeight:FontWeight.normal)),
               ],
             ),
           ),

           SizedBox(height:15,),

           Padding(
             padding: const EdgeInsets.only(left:10),
             child: Row(
               children: [
                 Image.asset("assets/img_28.png",scale:3),
                 Text("  : +91 9000000000",style:GoogleFonts.aBeeZee(color:Colors.black87,fontSize:13,fontWeight:FontWeight.normal)),
               ],
             ),
           ),



           Consumer<Mainprovider>(
             builder: (context,value,child) {
               return InkWell(
                 onTap:() {
                   value.getcategory();
                   Navigator.push(context, MaterialPageRoute(builder: (context) => Buyandrentuser (userid: userid,name:name,phone: phone,),));
                 },
                 child: Padding(
                   padding: const EdgeInsets.only(top:380,left:300),
                   child: Container(
                     width:80,
                     height :35,
                     decoration:BoxDecoration(
                       color:Colors.indigo,
                       borderRadius: BorderRadius.circular(10),
                     ),

                     child:Padding(
                       padding: const EdgeInsets.only(left:20),
                       child: Text("Skip",style:GoogleFonts.aBeeZee(color:Colors.white,fontSize:20),
                       ),


                       ),
                   ),

                 ),
               );
             }
           ),

         ],
       ),
    );
  }
}
