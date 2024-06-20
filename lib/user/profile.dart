import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Provider/Mainprovider.dart';
import 'package:project/user/edit_page.dart';
import 'package:provider/provider.dart';

import 'Login.dart';

class profile extends StatelessWidget {
  String name;
  String phone;
  String userid;
  profile({super.key,required this.name,required this.phone,required this.userid,});

  @override
  Widget build(BuildContext context) {
    // Mainprovider provider = Provider.of<Mainprovider>(context,listen: true);

    print("dfghjiko"+name+phone+userid);
    return Scaffold(
          appBar:AppBar(
            backgroundColor:Colors.indigo,
            title:Text("Profile",style:GoogleFonts.alatsi(color:Colors.white,fontSize:18)),
          ),
      body:Consumer<Mainprovider>(
        builder: (context,value,child) {
          return Column(

            children: [
              SizedBox(height: 60),
              Consumer<Mainprovider>(
                builder: (context,value,child) {
                  return Container(
                    height:80,
                    width:350,
                    decoration: BoxDecoration(color:Colors.indigo,
                    borderRadius:BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:50),
                      child: Row(
                        children: [
                          Text("Name:",
                              style:GoogleFonts.actor(color:Colors.white,fontWeight:FontWeight.w600,fontSize:18)),
                          SizedBox(width:10,),
                          Text( name, // name
                              style:GoogleFonts.actor(color:Colors.white,fontWeight:FontWeight.w600,fontSize:18)),
                        ],
                      ),
                    ),
                  );
                }
              ),


              SizedBox(height:70,),

              Container(
                height:80,
                width:350,
                decoration: BoxDecoration(color:Colors.indigo,
                  borderRadius:BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    children: [
                      Text("Phone No:",style:GoogleFonts.actor(color:Colors.white,fontWeight:FontWeight.w600,fontSize:18)),
                      SizedBox(width:10,),
                      Text(phone,
                          style:GoogleFonts.actor(color:Colors.white,fontWeight:FontWeight.w600,fontSize:18)),
                    ],
                  ),
                ),
              ),
            SizedBox(height: 40,),
              GestureDetector(
                onTap: (){
                  print("cnbcbbc"+name);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => editprofile(),));
                },
                  child: Text("Edit profile",style:GoogleFonts.abel(color:Colors.black,fontWeight:FontWeight.w600,fontSize:20))),

              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Colors.white,
                      elevation: 20,
                      content:  Text(
                          "Do you want to Logout ?",style: TextStyle(
                          fontSize:17,

                          fontFamily:'ink nut',
                          fontWeight: FontWeight.w700,
                          color: Colors.indigo)),
                      actions: <Widget>[
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                FirebaseAuth auth = FirebaseAuth.instance;
                                auth.signOut();
                                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => login(),));
                              },
                              child: Container(
                                height: 45,
                                width: 90,
                                decoration: BoxDecoration(
                                    color:Colors.white ,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x26000000),
                                        blurRadius: 2.0, // soften the shadow
                                        spreadRadius: 1.0, //extend the shadow
                                      ),
                                    ] ),
                                child: Center(child:  Text("yes",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),
                              ),
                            ),
                            TextButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 45,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.indigo,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x26000000),
                                        blurRadius: 2.0, // soften the shadow
                                        spreadRadius: 1.0, //extend the shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(child: Text("No",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),
                                ))
                          ],
                        )
                      ],
                    ),
                  );

                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Text("Logout",style:TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize:15),),
                    )),
              ),

            ],
          );
        }
      ),
    );
  }
}
