import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Provider/Mainprovider.dart';
import 'BuyAndRent.dart';
import 'Types.dart';

class Buyandrentadd extends StatelessWidget {
  String from;
  String oldid;
   Buyandrentadd({super.key,required this.from,required this.oldid});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar:AppBar(
      leading:InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_outlined)),
      title: Text(from=="EDIT"?"Edit category":"Add Category",style:TextStyle(color:Colors.black,fontSize:20,fontWeight:FontWeight.w700)),
    ),
      body:SingleChildScrollView(
        child: Form(key: formKey,
          child: Column(
            children: [
              SizedBox(height: 250,),

              Consumer<Mainprovider>(
                 builder: (context,value,child) {
                   return Padding(
                     padding: const EdgeInsets.only(top:60,left:60,right: 60),
                     child: TextFormField(
                      controller:value.BRTypecontroller ,
                      decoration:InputDecoration(
                        hintText: "Add",
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
                      ),validator: (value){
                        if(value!.isEmpty){
                          return "this field is required";
                   }else{

                        }
                   }

                               ),
                   );
                 }
               ),


               SizedBox(height: 70,),

               Consumer<Mainprovider>(
                 builder: (context,value,child) {
                   return InkWell(
                     onTap:() {
                       print("jfbdhfbdhf"+oldid);
                       final FormState? form = formKey.currentState;
                       if(form!.validate()){
                         if(from=="NEW"){
                           value.addcategory(from,"");
                         }
                         else{
                           value.addcategory(from,oldid);
                         }
                         Navigator.push(context, MaterialPageRoute(builder: (context) => BuyandRent(),));
                      }
                       },
                     child: value.categoryloader?CircularProgressIndicator(color: Colors.indigo,):Container(
                        height:45,
                        width:120,
                        decoration:BoxDecoration(
                          color:Colors.indigo,
                          borderRadius:BorderRadius.circular(8),
                        ),
                        child:Center(child: Text(from=="EDIT"?"EDIT":"ADD",style:GoogleFonts.aBeeZee(color:Colors.white,fontWeight:FontWeight.w600,fontSize:20)))),
                   );
                 }
               ),
            ],
          ),
        ),
      ),
    );
  }
}
