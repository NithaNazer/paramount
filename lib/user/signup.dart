import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Provider/Mainprovider.dart';
import 'Login.dart';

class signup extends StatelessWidget {
  const signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Text("Paramount",style:GoogleFonts.amarante(color:Colors.black,fontSize:20,fontWeight:FontWeight.bold)),
                ),
                SizedBox(height:50,),
                Text("Sign Up",style:GoogleFonts.alatsi(color:Colors.black,fontSize:20,fontWeight:FontWeight.bold)),
                SizedBox(height:20,),
                Text("Create new account",style:GoogleFonts.alatsi(color:Colors.grey,fontSize:15,fontWeight:FontWeight.w300)),
                SizedBox(height:50,),
                SizedBox(
                  width:300,
                  height:100,
                  child: Consumer<Mainprovider>(
                    builder: (context,value,child) {
                      return TextFormField(
                        controller:value.RegisterNamecontroller,
                        decoration:InputDecoration(
                          prefixIcon:Icon(Icons.person),
                          hintText:"Name",
                          hintStyle:TextStyle(color:Colors.grey),
                          border:OutlineInputBorder(),
                        ),
                      );
                    }
                  ),
                ),
                
                SizedBox(
                  width:300,
                  height:100,
                  child:Consumer<Mainprovider>(
                    builder: (context,value,child) {
                      return TextField(
                        controller:value.RegisterPhonecontroller,
                        decoration:InputDecoration(
                          prefixIcon:Icon(Icons.call_rounded),
                          hintText:"Mobile Number",
                          hintStyle:TextStyle(color: Colors.grey),
                          border:OutlineInputBorder(),
                        ),
                      );
                    }
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(left:50),
                  child: Row(
                    children: [
                      Container(
                        width:23,
                        height:23,
                        decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(8),border: Border.all(width: 1,color: Colors.green)
                        ),
                      ),
                        SizedBox(width:7,),
                        Column(
                          children: [
                            Text("By signing up,you agree to our",style:GoogleFonts.anekTamil(color:Colors.grey,fontSize:10)),
                            Text("Terms and Conditions and Privacy Policy",style:GoogleFonts.anekTamil(color:Colors.black,fontSize:10)),
                          ],
                        ),
                    ],
                  ),
                ),

                SizedBox(height:20,),


                Consumer<Mainprovider>(
                  builder: (context,value,child) {
                    return InkWell(
                      onTap:() {
                        value.AddRegistration();

                        Navigator.push(context, MaterialPageRoute(builder:(context) => login(),));
                      },
                      child: Container(
                          width:280,
                          height:50,
                          decoration:BoxDecoration(
                            color:Colors.indigo,
                            borderRadius:BorderRadius.circular(15),
                          ),
                          child:Center(child: Text("Create Account",style:GoogleFonts.inter(fontSize:23,fontWeight:FontWeight.bold,color:Colors.white,)))

                      ),
                    );
                  }
                ),


                SizedBox(height:20,),


                Padding(
                  padding: const EdgeInsets.only(left:100),
                  child: Row(
                    children: [
                      Text("Already Registered?",style:TextStyle(color:Colors.black,fontSize:15),),
                      Builder(
                        builder: (context) {
                          return InkWell(onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>login ()));
                          },
                              child: Text("Log in now",style:TextStyle(color:Colors.indigo,fontSize:15),));
                        }
                      )
                    ],
                  ),
                ),





              ],
            ),
          ),
        ),


    );
  }
}
