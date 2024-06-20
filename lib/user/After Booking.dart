import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AfterBooking extends StatelessWidget {
  const AfterBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.indigo,
      body:SafeArea(
        child: SizedBox(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right:350),
                child: InkWell(
                    onTap:() {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back,color:Colors.white)),
              ),
            Padding(
              padding: const EdgeInsets.only(top:320,left:40),
              child: Text("Booked Successfully",style:GoogleFonts.abhayaLibre(color:Colors.white,fontSize:27,fontWeight:FontWeight.w700),),
            ),
           
            ],
          ),
        ),
      ),


    );
  }
}
