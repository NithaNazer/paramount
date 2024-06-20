import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Provider/Mainprovider.dart';
import 'package:project/constant/myfunctions.dart';
import 'package:provider/provider.dart';

import 'BookNow.dart';

class Propdetails extends StatelessWidget {
  String housephoto;
  String houseid;
  String housename;
  String houselocation;
  String houseprice;
  String housedescription;
  String housenoofbedrooms;
  String housenoofbathrooms;
  String houseparking;
  String housecontact;
  String option;
  String typeid;
  String type;

  Propdetails({
    super.key,
    required this.housephoto,
    required this.houseid,
    required this.housename,
    required this.houselocation,
    required this.houseprice,
    required this.housedescription,
    required this.housenoofbedrooms,
    required this.housenoofbathrooms,
    required this.houseparking,
    required this.housecontact,
    required this.option,
    required this.typeid,
    required this.type,

  });

  @override
  Widget build(BuildContext context) {
    Mainprovider provider=Provider.of<Mainprovider>(context,listen: false);

    print("hihih" + housename);
    print("ssssssss" + houselocation);
    print("hjhkloooo" + housecontact);
    print("mmmmmmmmmmm" + housenoofbathrooms);
    print("vhgjch" + houseid);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              back(context);
            },
            child: Icon(Icons.arrow_back_outlined)),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Consumer<Mainprovider>(
            builder: (context,value,child) {
              return Column(
                children: [
                  Container(
                    height: 230,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        image: DecorationImage(
                            image: NetworkImage(housephoto.toString()), fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 1, right: 130),
                            child: Column(
                              children: [
                                // SizedBox(width: 5,),

                                Text(housename.toString(),
                                    style: GoogleFonts.aboreto(
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 25)),

                                // SizedBox(height:10,),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, right: 100),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.indigo,
                                          ),
                                          Text(houselocation.toString(),
                                              style: GoogleFonts.alatsi(
                                                  color: Colors.indigo,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, right: 220),
                                  child: Text(houseprice.toString(),
                                      style: GoogleFonts.inriaSans(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18)),
                                ),

                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(housedescription.toString(),
                                        style: GoogleFonts.inriaSans(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18)),
                                  ],
                                ),
                              ],
                            ),
                  ),

                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor:Colors.grey,
                          child:Icon(Icons.bed),
                        ),
                        Text(housenoofbedrooms.toString(),style:GoogleFonts.inriaSans(color:Colors.black87,fontWeight:FontWeight.w500,fontSize:18)),
                      ],
                    ),



                    SizedBox(width:5,),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor:Colors.grey,
                          child:Icon(Icons.bathroom),
                        ),

                        Text(housenoofbathrooms.toString(),style:GoogleFonts.inriaSans(color:Colors.black87,fontWeight:FontWeight.w500,fontSize:18)),
                      ],
                    ),


                    SizedBox(width:5,),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor:Colors.grey,
                          child:Icon(Icons.local_parking),
                        ),
                        Text(houseparking.toString(),style:GoogleFonts.inriaSans(color:Colors.black87,fontWeight:FontWeight.w500,fontSize:18)),
                      ],
                    ),
                  ],
                ),


                SizedBox(height: 40,),
                        Padding(
                          padding: const EdgeInsets.only(right: 230),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(housecontact.toString(), style: GoogleFonts.inriaSans(color: Colors.blueGrey, fontWeight: FontWeight.w500, fontSize: 18)),
                            ],
                          ),
                        ),

                SizedBox(
                              height: 80,
                            ),
                            Container(
                              height: 40,
                              width: 110,
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => HouseBooking(typeid:typeid,type:type,houseid: houseid,)));
                                      },
                                      child: Text("BookNow",
                                          style: GoogleFonts.aBeeZee(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15)))),
                            ),
                      ],
                    ),
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
