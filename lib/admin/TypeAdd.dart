import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Provider/Mainprovider.dart';
import '../modelclass/modelclass.dart';
import 'Types.dart';

class TypeAdd extends StatelessWidget {
  String from;
  String oldid;
  TypeAdd({super.key,required this.from,required this.oldid});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Form(key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:60,),
              Padding(
                padding: const EdgeInsets.only(top:190,left:120),
                child: Consumer<Mainprovider>(
                  builder: (context,value,child) {
                    return InkWell(
                      onTap: () {
                        showBottomSheet(context);
                      },

                      child:value.TypeaddImg!=null?Container(
                        width:150,
                        height:150,
                        decoration:BoxDecoration(
                          color:Colors.grey,
                        ),
                        child:Image.file(value.TypeaddImg!),
                      ):value.Image!=""?Container(
                        width:150,
                        height:150,
                        decoration:BoxDecoration(
                          color:Colors.grey,
                        ),
                        child:Image.network(value.Image),
                      ): Container(
                        width:150,
                        height:150,
                        decoration:BoxDecoration(
                          color:Colors.grey,
                        ),
                        child:Center(child: Icon(Icons.image,size:40)),
                      ),
                    );
                  }
                ),
              ),

              SizedBox(height:2,),

               Consumer<Mainprovider>(
                builder: (context,value,child) {
                  return Padding(
                    padding: const EdgeInsets.only(top:60,left:60,right: 60),
                    child: TextFormField(
                      controller:value.Typecontroller ,
                      decoration:InputDecoration(
                        label:Text("Type name"),
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
                      ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "this field is required";
                          }else{

                          }
                        }
                    ),
                  );
                }
              ),

              SizedBox(height:2,),



              Consumer<Mainprovider>(
                builder: (context,value,child) {
                  return Autocomplete<categorymodel>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        return value.BRaddList
                            .where((categorymodel item) => item.name
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase()))
                            .toList();
                      },
                      displayStringForOption: (categorymodel option) =>
                      option.name,
                      fieldViewBuilder: (BuildContext context,
                          TextEditingController fieldTextEditingController,
                          FocusNode fieldFocusNode,
                          VoidCallback onFieldSubmitted) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          fieldTextEditingController.text = value.categoryct.text;
                        });

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          child: Center(
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                              child: SizedBox(
                                width: 300,
                                child: TextFormField(
                                  cursorColor: Colors.indigo,
                                  maxLines: 1,

                                  style: const TextStyle(
                                      color: Colors.black, fontWeight: FontWeight.w200),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black),
                                        borderRadius: BorderRadius.circular(10)),
                                    hintText: "Category name",
                                    hintStyle: const TextStyle(
                                        color: Colors.black, ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return "this field is required";
                                      }else{
                                      }


                                    },
                                  onChanged: (txt) {},
                                  controller: fieldTextEditingController,
                                  focusNode: fieldFocusNode,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      onSelected: (categorymodel selection) {
                        value.categoryct.text = selection.name;
                        value.categorytypesid = selection.id;
                      },
                      optionsViewBuilder: (BuildContext context,
                          AutocompleteOnSelected<categorymodel> onSelected,
                          Iterable<categorymodel> options) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              width: 200,
                              height: 200,
                              child: ListView.builder(
                                padding: const EdgeInsets.all(10.0),
                                itemCount: options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final categorymodel option = options.elementAt(index);

                                  return GestureDetector(
                                    onTap: () {
                                      onSelected(option);
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            // border: Border(left: BorderSide(color: Colors.white,width: .6,
                                            // ))
                                          ),
                                          height: 30,
                                          width: 200,
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Center(
                                                  child: Text(option.name,
                                                      style: const TextStyle(
                                                        fontFamily: 'cantata',
                                                        color: Colors.black,
                                                      )),
                                                ),
                                              ]),
                                        ),
                                        Divider(
                                          thickness: 1,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                      );
                }
              ),

            Consumer<Mainprovider>(
              builder: (context,value,child) {
                return Padding(
                  padding: const EdgeInsets.only(top:10
                      ,left:60,right: 60),
                  child: TextFormField(
                    controller:value.statusct ,
                    decoration:InputDecoration(
                     label:Text("Status"),
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
                    ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "this field is required";
                        }else{

                        }
                      }

                  ),
                );
              }
            ),






              SizedBox(height:30),

              Padding(
                padding: const EdgeInsets.only(left:120),
                child: Consumer<Mainprovider>(
                  builder: (context,value,child) {
                    return InkWell(
                      onTap: () {
                        final FormState? form = formKey.currentState;
                        if (form!.validate()) {
                          if (value.TypeaddImg != null || value.Image != "") {
                            if (from == "NEW") {
                              value.addtype(from, "");
                            }
                            else {
                              value.addtype(from, oldid);
                            }

                            value.getType();
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Types(catid: '',typename: '',),));
                          }
                          else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                              backgroundColor: Colors.white,
                              content: Text(
                                  "Image provided", style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,)),
                              duration:
                              Duration(milliseconds: 3000),
                            ));
                          }
                        }
                      },

                        child:value.typeloader?CircularProgressIndicator(color: Colors.indigo,):Container(
                          height:45,
                          width:120,
                          decoration:BoxDecoration(
                            color:Colors.indigo,
                            borderRadius:BorderRadius.circular(8),
                          ),
                          child:Center(child:Text(from=="EDIT"?"EDIT":"ADD",style:GoogleFonts.aBeeZee(color:Colors.white,fontWeight:FontWeight.w600,fontSize:20)))),

                    );
                  }
                ),
                ),
            ],
          ),
        ),
      )

    );
  }

  void showBottomSheet(BuildContext context) {
    Mainprovider mainprovider =Provider.of<Mainprovider>(context,listen: false);
    showModalBottomSheet(
        elevation: 10,
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
                    mainprovider.getImgcamera(), Navigator.pop(context)
                  }),
              ListTile(
                  leading:  Icon(Icons.photo, color: Colors.blue),
                  title: const Text('Gallery',),
                  onTap: () => {
                    mainprovider.getImggallery(),Navigator.pop(context)
                  }),
            ],
          );
        });

  }
}


