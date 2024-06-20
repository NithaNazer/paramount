import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../Provider/Login Provider.dart';
import '../constant/mycolors.dart';
import '../constant/refactor.dart';

class otp extends StatelessWidget {
  const otp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SizedBox(
         child: Column(
           children: [
             SizedBox(height: 350),
             Text("Enter OTP",style:GoogleFonts.blackHanSans(color:Colors.black,fontSize:25,fontWeight:FontWeight.w500)),
             Consumer<LoginProvider>(
                 builder: (context,vale,child) {
                   return Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10),
                     child:Pinput(
                       controller:vale.otpverifycontroller,
                       length: 6,
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       defaultPinTheme: PinTheme(
                           textStyle:
                           TextStyle(fontWeight: FontWeight.bold),
                           height: 50,
                           width: 50,
                           decoration: BoxDecoration( boxShadow: [
                             BoxShadow(
                               color: Colors.white,
                               blurRadius: 2.0, // soften the shadow
                               spreadRadius: 1.0, //extend the shadow
                             ),
                           ], borderRadius: BorderRadius.circular(15),
                               border: Border.all(width: 1,
                                   color:Colors.indigo.withOpacity(0.9)))),

                       onCompleted: (pin){
                         vale.verify(context);

                       },

                     ),
                   );
                 }
             ),

             SizedBox(height:40,),
             
             Container(
               width:100,
               height :35,
               decoration:BoxDecoration(
                 color:Colors.indigo,
               ),
               child:Padding(
                 padding: const EdgeInsets.only(left:20),
                 child: Text("Verify",style:GoogleFonts.inter(color:Colors.white,fontSize:20),
             ),
               ),
             ),
           ],
         ),








     ),
    );
  }
}
