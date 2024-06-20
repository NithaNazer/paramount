

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Provider/Mainprovider.dart';
import 'package:provider/provider.dart';

import 'After Booking.dart';

class ConvBooking extends StatelessWidget {
  String typeid;
  String type;
  String convid;
  ConvBooking({super.key,required this.typeid,required this.type,required this.convid});



  @override
  Widget build(BuildContext context) {
    Mainprovider provider=Provider.of<Mainprovider>(context,listen: false);
    return Scaffold(

      appBar:AppBar(
        backgroundColor:Colors.indigo,
        title:Text("Book Your Slot",style:TextStyle(color:Colors.white)),
      ),
      body:SingleChildScrollView(
        child: Consumer<Mainprovider>(
            builder: (context,value,child) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:320,top:30),
                    child: Text("Name",style:GoogleFonts.inter(color:Colors.black,fontSize:15,fontWeight:FontWeight.normal),),

                  ),
                  SizedBox(height:15,),
                  SizedBox(width: 400,
                    height:100,
                    child:   TextFormField(
                      controller:value.BOOKED_NAMEcontroller,

                      style: TextStyle(color: Colors.black),

                      keyboardType: TextInputType.name,

                      inputFormatters: [],


                      decoration: InputDecoration(


                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),

                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right:260,top:30),
                    child: Text("Mobile Number",style:GoogleFonts.inter(color:Colors.black87,fontSize:15,fontWeight:FontWeight.normal),),
                  ),
                  SizedBox(height:15,),
                  SizedBox(width: 400,
                    height:100,
                    child:   TextFormField(
                      controller: value.BOOKED_PHONEcontroller,
                      style: TextStyle(color: Colors.black),

                      keyboardType: TextInputType.name,

                      inputFormatters: [],


                      decoration: InputDecoration(


                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),

                        ),
                      ),
                    ),
                  ),




                  SizedBox(height:15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Consumer<Mainprovider>(
                        builder: (context,value,child) {
                          return Row(
                            children: [
                              Text("Date:"),
                              SizedBox(width: 130,),

                              InkWell( onTap: (){
                                value.selectDate(context);
                              },
                                  child: Icon(Icons.calendar_month,color: Colors.blue,)),
                              SizedBox(width: 3,),
                              Text(value.BOOKED_DATEcontroller.text,style: TextStyle(fontWeight: FontWeight.bold),),


                            ],
                          );
                        }
                    ),
                  ),


                  SizedBox(height:15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child:Consumer<Mainprovider>(
                        builder: (context,value,child) {
                          return Row(
                            children: [
                              Text("Time:"),
                              SizedBox(width: 127,),
                              InkWell(onTap: (){
                                value.selectTime(context);
                              },
                                  child: Icon(Icons.access_time,color: Colors.blue,)),
                              SizedBox(width: 3,),
                              Text(value.BOOKED_TIMEcontroller.text,style: TextStyle(fontWeight: FontWeight.bold),),

                            ],
                          );
                        }
                    ),
                  ),

                  SizedBox(height:20,),

                  Consumer<Mainprovider>(
                      builder: (context,value,child) {
                        return Container(
                          height:50,
                          width:120,
                          decoration:BoxDecoration(
                            color:Colors.indigo,
                            borderRadius:BorderRadius.circular(8),
                            border:Border.all(width:1,color:Colors.white),
                          ),
                          child:Center(child: InkWell(
                              onTap:(){
                                value.ADDCONVDETAIL(context,typeid,type,convid);
                                value.bookingclear();
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>AfterBooking()));
                              },

                              child: Text("Confirm",style:GoogleFonts.inriaSans(color:Colors.white,fontSize:20)))),
                        );
                      }
                  ),
                ],
              );
            }
        ),
      ),
    );

  }
}