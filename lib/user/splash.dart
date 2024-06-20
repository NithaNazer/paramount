import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Provider/Mainprovider.dart';
import 'package:project/user/Login.dart';
import 'package:provider/provider.dart';

import '../Provider/Login Provider.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {

    print("codee id her");

    Timer? _timer;
    final FirebaseFirestore db = FirebaseFirestore.instance;
    String type= '';

    FirebaseAuth auth = FirebaseAuth.instance;
    var loginUser = auth.currentUser;

    super.initState();

    LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);
    Mainprovider mainProvider = Provider.of<Mainprovider>(context, listen: false);



    Timer(const Duration(seconds: 3), () {
      if (loginUser == null) {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => login(),));
      }
      else {
        loginProvider.userAuthorized(loginUser.phoneNumber, context);
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
            height: height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(image:AssetImage("assets/image 9.jpeg",),fit:BoxFit.cover),
              ),

        child: Column(
          children: [
            SizedBox(height: height/20,),
            Text("PARAMOUNT",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 30),),
            Text("Properties",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.circle,color:Colors.black,size:5,),
                    Text("Buy",style:GoogleFonts.alatsi(color:Colors.black,fontWeight:FontWeight.w600,fontSize:8),),
                    ],
              ),
              SizedBox(width: width/8,),
              Row(
                children: [
                  Icon(Icons.circle,color:Colors.black,size:5,),
                  Text("Rent",style:GoogleFonts.alatsi(color:Colors.black,fontWeight:FontWeight.w600,fontSize:8),),
                ],
              ),
            ],
          ),

            SizedBox(height:8),

            Text("Discover Your Dream Place",style:GoogleFonts.alatsi(color:Colors.grey,fontWeight:FontWeight.w600,fontSize:8)),

          ],
        ),
      ),
    );
  }
}
