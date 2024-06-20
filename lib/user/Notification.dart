import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class notification extends StatelessWidget {
  const notification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar:AppBar(
            backgroundColor:Colors.indigo,
            title:Text("Notifications",style:GoogleFonts.inter(color:Colors.white,fontSize:18,fontWeight:FontWeight.bold)),
          ),
      body:Column(
        children: [
          SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.only(left:23),
            child: Container(
              height:100,
              width:360,
              decoration:BoxDecoration(
                color:Colors.indigo,
                borderRadius:BorderRadius.circular(8),
              ),
              child:Center(child: Text("Your request has been confirmed successfully!",style:GoogleFonts.abel(fontSize:20,color:Colors.white,fontWeight: FontWeight.bold))),
            ),
          ),

          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left:23),
            child: Container(
              height:100,
              width:360,
              decoration:BoxDecoration(
                color:Colors.indigo,
                borderRadius:BorderRadius.circular(8),
              ),
              child:Center(child: Text("The date is already booked!kindly book another date.",style:GoogleFonts.abel(fontSize:18,color:Colors.white,fontWeight: FontWeight.bold))),
            ),
          ),


          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left:23),
            child: Container(
              height:100,
              width:360,
              decoration:BoxDecoration(
                color:Colors.indigo,
                borderRadius:BorderRadius.circular(8),
              ),
              child:Center(child: Text("Sorry! There is an error in your booking.",style:GoogleFonts.abel(fontSize:18,color:Colors.white,fontWeight: FontWeight.bold))),
            ),
          )
        ],
      ),



    );
  }
}
