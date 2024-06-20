import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Provider/Mainprovider.dart';
import 'package:provider/provider.dart';

import 'BuyAndRent.dart';
import '../user/Login.dart';
import 'AdminLists.dart';
import 'Booked.dart';
import 'Requests.dart';
import 'Types.dart';
import 'Users.dart';

class HomeAdmin extends StatelessWidget {
  String userid;
  String houseid;
  String convid;
   HomeAdmin({super.key,required this.userid,required this.houseid,required this.convid});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        InkWell(onTap: () {
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
          child: Text("Logout",style:TextStyle(color:Colors.black,fontWeight:FontWeight.bold,fontSize:18),
                ),
        ),SizedBox(width: 10,)
      ]
      ,),
      body:SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
               padding: const EdgeInsets.only(left:70,top:10),
               child: Container(
                 height:60,
                 width:230,
                 decoration:BoxDecoration(
                   color:Colors.indigo,
                   borderRadius:BorderRadius.circular(8),
                 ),
                 child:Center(child: Consumer<Mainprovider>(
                   builder: (context,value,child) {
                     return InkWell
                       (onTap:() {
                         value.GetRegistration();
                       Navigator.push(context, MaterialPageRoute(builder: (context) => Requests()));
                     },
                     child: Text("REQUESTS",style:GoogleFonts.aBeeZee(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20)));
                   }
                 )),
                   ),
                   ),
              Padding(
                   padding: const EdgeInsets.only(left:70,top:50),
                   child: Container(
                   height:60,
                   width:230,
                   decoration:BoxDecoration(
                   color:
                 Colors.indigo,
                    borderRadius:BorderRadius.circular(8),
                  ),
                  child:Center(child: Consumer<Mainprovider>(
                    builder: (context,value,child) {
                      return InkWell(onTap:(){
                        value.GetCustomers();
                        Navigator.push(context, MaterialPageRoute(builder:(context) => Users()));
                      },
                      child: Text("USERS",style:GoogleFonts.aBeeZee(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20)));
                    }
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:70,top:50),
                child: Consumer<Mainprovider>(
                  builder: (context,value,child) {
                    return Container(
                      height:60,
                      width:230,
                      decoration:BoxDecoration(
                        color:Colors.indigo,
                        borderRadius:BorderRadius.circular(8),
                      ),
                      child:Center(child: InkWell(onTap:(){
                        value.getcategory();
                        Navigator.push(context,MaterialPageRoute(builder: (context) => BuyandRent()));
                      },
                          child: Text("CATEGORY",style:GoogleFonts.aBeeZee(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20)))),
                    );
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:70,top:50),
                child: Consumer<Mainprovider>(
                  builder: (context,value,child) {
                    return Container(
                      height:60,
                      width:230,
                      decoration:BoxDecoration(
                        color:Colors.indigo,
                        borderRadius:BorderRadius.circular(8),
                      ),
                      child:Center(child: InkWell(onTap:(){
                        value.getType();

                        Navigator.push(context,MaterialPageRoute(builder: (context) => Types(catid: '',typename:'',)));
                      },
                          child: Text("TYPE",style:GoogleFonts.aBeeZee(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20)))),
                    );
                  }
                ),
              ),

          

              Padding(
                padding: const EdgeInsets.only(left:70,top:50),
                child: Consumer<Mainprovider>(
                  builder: (context,value,child) {
                    return Container(
                      height:60,
                      width:230,
                      decoration:BoxDecoration(
                        color:Colors.indigo,
                        borderRadius:BorderRadius.circular(8),
                      ),
                      child:Center(child: InkWell
                        (onTap:(){
                          print("nnnnnn"+userid);

                        value.get_DETAIL(houseid,convid);
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>Booked()));
                      },
                          child: Text("BOOKINGS",style:GoogleFonts.aBeeZee(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20)))),
                    );
                  }
                ),
              ),
          
          
          


            ],
          ),
        ),
      ),


    );
  }
}
