import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Provider/Mainprovider.dart';
import 'package:provider/provider.dart';

import 'Users.dart';

class Requests extends StatelessWidget {
  const Requests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading:InkWell(
            onTap:() {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_outlined)),
        title:Text("Requests",style:TextStyle(color:Colors.black,fontSize:20,fontWeight:FontWeight.w700)),),
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:60),
            Consumer<Mainprovider>(
              builder: (context,value,child) {
                return ListView.builder( padding:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    physics: ScrollPhysics(),
                    itemCount:value.RegistrstionList.length ,
                    shrinkWrap:true,
                    scrollDirection:Axis.vertical,
                    itemBuilder:(context,int index){
                  return Padding(
                    padding: const EdgeInsets.only(bottom:10),
                    child: Container(
                      height:230,
                      width:300,
                      decoration:BoxDecoration(
                        color:Colors.indigo,
                      ),
                      child:Padding(
                        padding: const EdgeInsets.only(top:50),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("       Name                   :",style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20)),
                                SizedBox(width:5,),
                                Text(value.RegistrstionList[index].name,style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20)),
                              ],
                            ),
        
                            SizedBox(height:30,),
                            Padding(
                              padding: const EdgeInsets.only(left:35),
                              child: Row(
                                children: [
                                  Text("Phone              :",style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20)),
                                  SizedBox(width:5,),
                                  Text(value.RegistrstionList[index].phone,style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),
        
                                ],
                              ),
                            ),
        
                            SizedBox(height:30,),
        
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right:95,left:15),
                                  child: Consumer<Mainprovider>(
                                    builder: (context,value,child) {
                                      return InkWell(
                                        onTap:() {
                                       value.statusapprove(value.RegistrstionList[index].id,value.RegistrstionList[index].name,value.RegistrstionList[index].phone,context);
                                        },
                                        child: Container(
                                          width:90,
                                          height:35,
                                          decoration:BoxDecoration(
                                            color:Colors.white,
                                            borderRadius:BorderRadius.circular(5),
                                          ),
                                          child:Center(child: Text("Accept",style:GoogleFonts.alatsi(color:Colors.indigo,fontSize:16,fontWeight:FontWeight.normal))),
                                        ),
                                      );
                                    }
                                  ),
                                ),
        
                                Consumer<Mainprovider>(
                                  builder: (context,value,child) {
                                    return InkWell(
                                      onTap:() {
                                        value.statusreject(value.RegistrstionList[index].id,context);
                                      },
                                      child: Container(
                                        width:90,
                                        height:35,
                                        decoration:BoxDecoration(
                                          color:Colors.white,
                                          borderRadius:BorderRadius.circular(5),
                                        ),
                                        child:Center(child: Text("Reject",style:GoogleFonts.alatsi(color:Colors.indigo,fontSize:16,fontWeight:FontWeight.normal))),
                                      ),
                                    );
                                  }
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                    });
              }
            ),
        
        
        
        
        
        
        
        
        
          ],
        ),
      )
    );
  }
}
