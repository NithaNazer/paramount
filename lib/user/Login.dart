import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Provider/Login%20Provider.dart';
import 'package:project/Provider/Mainprovider.dart';
import 'package:project/user/signup.dart';
import 'package:provider/provider.dart';

import 'otp.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Colors.white,
        body:
            SingleChildScrollView(
            child: Center(
              child: Column(
                children: [SizedBox(height: 50,),
                  Image.asset("assets/img_1.png",scale:5,),
                  Text("Paramount",style:GoogleFonts.marcellus(fontSize:25,fontWeight:FontWeight.w500,color:Colors.black)),
                  SizedBox(height:50,),
                  Text("Login",style:GoogleFonts.alatsi(fontSize:25,fontWeight:FontWeight.bold,color:Colors.black)),
                  SizedBox(height:10,),
                  Text("Login to your account",style:GoogleFonts.gowunBatang(fontSize:15,fontWeight:FontWeight.w500,color:Colors.grey)),
                 SizedBox(height:50,),
                 SizedBox(
                   width:300,
                   height:70,
                   child:Consumer<LoginProvider>(
                     builder: (context,val,child) {
                       return TextField(
                         controller: val.Loginphnnumber,
                         decoration:InputDecoration(
                           prefixIcon:Icon(Icons.call_rounded),
                           hintText:"Mobile Number",
                           hintStyle:TextStyle(color:Colors.grey),
                           border:OutlineInputBorder(),
                            fillColor:Colors.grey,
                         ),
                         style:TextStyle(color:Colors.black),
                       );
                     }
                   ),
                 ),


                  SizedBox(height:40,),

                  Consumer<LoginProvider>(
                    builder: (context,value,child) {
                      return Container(
                        width:280,
                        height:50,
                        decoration:BoxDecoration(
                          color:Colors.indigo,
                          borderRadius:BorderRadius.circular(15),
                        ),
                        child:Center(child: InkWell(onTap:(){
                           value.sendotp(context);
                        },
                          child: Text("Get OTP",style:GoogleFonts.inter(fontSize:15,fontWeight:FontWeight.w500,color:Colors.white,))))

                      );
                    }
                  ),


                  SizedBox(height:20,),


                     Padding(
                       padding: const EdgeInsets.only(left:100),
                       child: Row(
                        children: [
                          Text("New Member?",style:TextStyle(color:Colors.black,fontSize:15),),
                          Consumer<Mainprovider>(
                            builder: (context,value,child) {
                              return InkWell(onTap: () {
                                value.signupclear();
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
                              },
                                  child: Text("Sign up now",style:TextStyle(color:Colors.indigo,fontSize:15),));
                            }
                          )
                        ],
                    ),
                     ),














                ],
                  ),
      ),
            ),
          ),
    );
  }
}
