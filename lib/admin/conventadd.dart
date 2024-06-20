import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Provider/Mainprovider.dart';
import 'package:provider/provider.dart';

class RentAdd extends StatelessWidget {
  String from;
  String oldid;
  String typename;
  RentAdd({super.key,required this.from,required this.oldid,required this.typename});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(
        child: SingleChildScrollView(
          child: Column(
          children: [
            Column(
              children: [
                Consumer<Mainprovider>(
                  builder: (context,value,child) {
                    return InkWell(
                      onTap: () {
                        showBottomSheet(context);
                      },
                      child:Column(
                        children:List.generate(value.fileImageList.length, (index) {
                          return CircleAvatar(
                           radius: 60,
                            backgroundImage: FileImage(value.fileImageList[index]),
                          );
                        }),
                      ),
                    );
                  }
                ),

                SizedBox(width:7,),
          
                Consumer<Mainprovider>(
                  builder: (context,value,child) {
                    return InkWell(
                      onTap: () {
                        showBottomSheet(context);
                      },
                      child: Center(
                        child:value.fileImage!=null? CircleAvatar(
                          radius:60,
                          backgroundColor:Colors.grey,
                          backgroundImage: FileImage(value.fileImage!),
                        ):value.conImage!=""?
                                  child: CircleAvatar(
                                  radius:60,
                                  backgroundColor:Colors.grey,
                                  child:Icon(Icons.image,size:45),
                        ),
                      ),
                    );
                  }
                ),
                SizedBox(width:7,),
          
          
            //     InkWell(
            //         onTap:() {
            //           Navigator.push(context,MaterialPageRoute(builder: (context) => ConventionImage(),));
            //         },
            //         child: Icon(Icons.arrow_forward)),
            //
            //   ],
            // ),
                SizedBox(height:70,),
          
            SizedBox(
              width:380,
              height:90,
              child:Consumer<Mainprovider>(
                builder: (context,value,child) {
                  return TextField(
                    controller: value.conventionDescriptionController,
                    decoration:InputDecoration(
                      hintText:"Description",
                      hintStyle:TextStyle(color:Colors.grey),
                      border:OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
                      fillColor:Colors.grey,
          
                    ),
                    style:TextStyle(color:Colors.black),
                  );
                }
              ),
            ),
          
          
            SizedBox(height:20,),
          
          
            SizedBox(
              width:380,
              height:90,
              child:Consumer<Mainprovider>(
                builder: (context,value,child) {
                  return TextField(
                    controller: value.conventionAddressController,
                    decoration:InputDecoration(
                      hintText:"Address",
                      hintStyle:TextStyle(color:Colors.grey),
                      border:OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
                      fillColor:Colors.black,
          
                    ),
                    style:TextStyle(color:Colors.black),
                  );
                }
              ),
            ),
          
          
            SizedBox(height:20,),
          
          
          
            SizedBox(
              width:380,
              height:90,
              child:Consumer<Mainprovider>(
                builder: (context,value,child) {
                  return TextField(
                    controller:value.conventionPriceController,
                    decoration:InputDecoration(
                      hintText:"Price",
                      hintStyle:TextStyle(color:Colors.red),
                      border:OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
                      fillColor:Colors.grey,
          
                    ),
                    style:TextStyle(color:Colors.black),
                  );
                }
              ),
            ),
          
          
          
          
          
          
          
            SizedBox(height:60,),
          
          
            Consumer<Mainprovider>(
              builder: (context,value,child) {
                return Container(
                  width:100,
                  height:50,
                  decoration:BoxDecoration(
                    color:Colors.indigo,
                    borderRadius:BorderRadius.circular(8),
                  ),
                  child:InkWell(
                      onTap: () {
                        value.addConvtype(oldid,typename);
                        value.convclear();
                      },
                      child:
                  Center(child: Text("Add",style:TextStyle(color:Colors.white,fontWeight:FontWeight.w600,fontSize:15)))),
                );
              }
            )
          ],
          ),
      ],
        ),
        ),
        ),
    );

  }



  void showBottomSheet(BuildContext context) {
    Mainprovider mainprovider =Provider.of<Mainprovider>(context,listen: false);
    showModalBottomSheet(
        elevation:10,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading:  Icon(
                    Icons.camera_enhance_sharp,
                    color:Colors.blue,
                  ),
                  title: const Text('Camera',),
                  onTap: () => {
                    mainprovider.getConvImgcamera(), Navigator.pop(context)
                  }),
              ListTile(
                  leading:  Icon(Icons.photo, color: Colors.blue),
                  title: const Text('Gallery',),
                  onTap: () => {
                    mainprovider.getConvImggallery(),Navigator.pop(context)
                  }),
            ],
          );
        });

  }
}
