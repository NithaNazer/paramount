// import 'package:flutter/material.dart';
// import 'package:project/Provider/Mainprovider.dart';
// import 'package:provider/provider.dart';
//
// import 'AdminLists.dart';
//
// class addflat extends StatelessWidget {
//   String from;
//   String oldid;
//   addflat({super.key,required this.from,required this.oldid});
//   final formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body:SafeArea(
//           child: SingleChildScrollView(
//             child: Form(key: formKey,
//               child: Column(
//                 children: [
//                   Consumer<Mainprovider>(
//                       builder: (context,val,child) {
//                         return InkWell(onTap: () {
//                           showBottomSheet(context);
//                         },
//                           child: val.subtypefileimg!=null?Center(
//                             child: CircleAvatar(
//                               radius:60,
//                               backgroundColor:Colors.grey,
//                               backgroundImage:FileImage(val.subtypefileimg!),
//                             ),
//                           ):Center(
//                             child: CircleAvatar(
//                               radius:60,
//                               backgroundColor:Colors.grey,
//                               child:Icon(Icons.image,size:45),
//                             ),
//                           ),
//                         );
//                       }
//                   ),
//                   SizedBox(height:50,),
//
//
//
//                   SizedBox(
//                     width:380,
//                     height:60,
//                     child:Consumer<Mainprovider>(
//                       builder: (context,value,child) {
//                         return TextFormField(
//                           controller:value.HouseNameController,
//                           decoration:InputDecoration(
//                             hintText:"Name",
//                             hintStyle:TextStyle(color:Colors.grey),
//                             border:OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
//                             fillColor:Colors.black,
//
//                           ),
//                             validator:(value){
//                               if(value!.isEmpty){
//                                 return "this field is required";
//                               }else{
//
//                               }
//                             }
//
//                         );
//                       }
//                     ),
//                   ),
//
//
//                   SizedBox(height:12,),
//                   SizedBox(
//                     width:380,
//                     height:60,
//                     child:Consumer<Mainprovider>(
//                       builder: (context,value,child) {
//                         return TextFormField(
//                           controller: value.HouseLocationController,
//                           decoration:InputDecoration(
//                             hintText:"Location",
//                             hintStyle:TextStyle(color:Colors.grey),
//                             border:OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
//                             fillColor:Colors.black
//                           ),
//                             validator:(value){
//                               if(value!.isEmpty){
//                                 return "this field is required";
//                               }else{
//
//                               }
//                             }
//
//                         );
//                       }
//                     ),
//                   ),
//
//                   SizedBox(height:12,),
//                   SizedBox(
//                     width:380,
//                     height:60,
//                     child:Consumer<Mainprovider>(
//                       builder: (context,value,child) {
//                         return TextFormField(
//                           controller:value.HousePriceController,
//                           decoration:InputDecoration(
//                             hintText:"Price",
//                             hintStyle:TextStyle(color:Colors.grey),
//                             border:OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
//                             fillColor:Colors.black,
//                           ),
//
//                             validator:(value){
//                               if(value!.isEmpty){
//                                 return "this field is required";
//                               }else {
//
//                               }
//                             }
//                         );
//                       }
//                     ),
//                   ),
//
//                   SizedBox(height:15,),
//
//                   Consumer<Mainprovider>(
//                       builder: (context,value,child) {
//                         return Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Row(
//                               children: [
//                                 Radio(
//                                     activeColor: Colors.indigo,
//                                     value: "buy",
//                                     groupValue:value.checkvalue,
//                                     onChanged: (value1){
//                                       value.checkvalue = value1.toString();
//                                       value.notifyListeners();
//                                     }
//                                 ),
//                                 Text("Buy")
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Radio(
//                                     activeColor: Colors.indigo,
//                                     value: "rent",
//                                     groupValue:value.checkvalue,
//                                     onChanged: (value1){
//                                       value.checkvalue = value1.toString();
//                                       value.notifyListeners();
//                                     }
//                                 ),
//                                 Text("Rent")
//                               ],
//                             ),                    ],
//                         );
//                       }
//                   ),
//
//
//
//
//                   SizedBox(height:12,),
//                   SizedBox(
//                     width:380,
//                     height:60,
//                     child:Consumer<Mainprovider>(
//                       builder: (context,value,child) {
//                         return TextFormField(
//                           controller:value.HouseDescriptionController,
//                           decoration:InputDecoration(
//                             hintText:"Description",
//                             hintStyle:TextStyle(color:Colors.grey),
//                             border:OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
//                             fillColor:Colors.black,
//                           ),
//                             validator:(value){
//                               if(value!.isEmpty){
//                                 return "this field is required";
//                               }else{
//
//                               }
//                             }
//                         );
//                       }
//                     ),
//                   ),
//
//
//                   SizedBox(height:12,),
//                   SizedBox(
//                     width:380,
//                     height:60,
//                     child:Consumer<Mainprovider>(
//                       builder: (context,value,child) {
//                         return TextFormField(
//                           controller:value.HouseBedroomsController,
//                           decoration:InputDecoration(
//                             hintText:"No of Bedrooms",
//                             hintStyle:TextStyle(color:Colors.grey),
//                             border:OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
//                             fillColor:Colors.black
//
//                           ),
//                             validator:(value){
//                               if(value!.isEmpty){
//                                 return "this field is required";
//                               }else{
//
//                               }
//                             }
//                         );
//                       }
//                     ),
//                   ),
//
//
//                   SizedBox(height:12,),
//                   SizedBox(
//                     width:380,
//                     height:60,
//                     child:Consumer<Mainprovider>(
//                       builder: (context,value,child) {
//                         return TextFormField(
//                           controller:value.HouseBathroomsController,
//                           decoration:InputDecoration(
//                             hintText:"No of Bathrooms",
//                             hintStyle:TextStyle(color:Colors.grey),
//                             border:OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
//                             fillColor:Colors.black
//
//                           ),
//                             validator:(value){
//                               if(value!.isEmpty){
//                                 return "this field is required";
//                               }else{
//
//                               }
//                             }
//
//                         );
//                       }
//                     ),
//                   ),
//
//
//                   SizedBox(height:12,),
//                   SizedBox(
//                     width:380,
//                     height:60,
//                     child:Consumer<Mainprovider>(
//                       builder: (context,value,child) {
//                         return TextFormField(
//                           controller:value.HouseParkingController,
//                           decoration:InputDecoration(
//                             hintText:"Parking Facility",
//                             hintStyle:TextStyle(color:Colors.grey),
//                             border:OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
//                             fillColor:Colors.black
//
//                           ),
//                             validator:(value){
//                               if(value!.isEmpty){
//                                 return "this field is required";
//                               }else{
//
//                               }
//                             }
//                         );
//                       }
//                     ),
//                   ),
//
//
//                   SizedBox(height:12,),
//                   SizedBox(
//                     width:380,
//                     height:60,
//                     child:Consumer<Mainprovider>(
//                       builder: (context,value,child) {
//                         return TextFormField(
//                           controller:value.HouseContactController,
//                           decoration:InputDecoration(
//                             hintText:"Contact Details",
//                             hintStyle:TextStyle(color:Colors.grey),
//                             border:OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
//                             fillColor:Colors.black
//
//                           ),
//                             validator:(value){
//                               if(value!.isEmpty){
//                                 return "this field is required";
//                               }else{
//
//                               }
//                             }
//                         );
//                       }
//                     ),
//                   ),
//
//                   SizedBox(height:20),
//
//                   Consumer<Mainprovider>(
//                       builder: (context,value,child) {
//                         return Container(
//                           width:100,
//                           height:50,
//                           decoration:BoxDecoration(
//                             color:Colors.indigo,
//                             borderRadius:BorderRadius.circular(8),
//                           ),
//                           child:Center(child: InkWell(
//                               onTap:() {
//                             final FormState? form = formKey.currentState;
//                             if(form!.validate()){
//                             if(value.subtypefileimg!=null){
//
//                             if(value.checkvalue.isNotEmpty){
//                             value.addflats(oldid);
//                             Navigator.pop(context);
//                             }else{
//                             ScaffoldMessenger.of(context)
//                                 .showSnackBar( SnackBar(
//                             backgroundColor: Colors.white,
//                             content: Text(
//                             "provided option",style: TextStyle(color: Colors.indigo,fontSize: 20,fontWeight: FontWeight.w800,)),
//                             duration:
//                             Duration(milliseconds: 3000),
//                             ));
//                             }
//                             }else{
//                             ScaffoldMessenger.of(context)
//                                 .showSnackBar( SnackBar(
//                             backgroundColor: Colors.white,
//                             content: Text(
//                             "provided image",style: TextStyle(color: Colors.indigo,fontSize: 20,fontWeight: FontWeight.w800,)),
//                             duration:
//                             Duration(milliseconds: 3000),
//                             ));
//                             }
//
//                             }
//
//                             },
//                               child: Text("Add",style:TextStyle(color:Colors.white,fontWeight:FontWeight.w600,fontSize:15)))),
//                         );
//                       }
//                   )
//                 ],
//               ),
//             ),
//           ),
//         )
//
//     );
//   }
//
//   void showBottomSheet(BuildContext context) {
//     Mainprovider mainprovider =Provider.of<Mainprovider>(context,listen: false);
//     showModalBottomSheet(
//         elevation: 10,
//         backgroundColor: Colors.white,
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(10.0),
//               topRight: Radius.circular(10.0),
//             )),
//         context: context,
//         builder: (BuildContext bc) {
//           return Wrap(
//             children: <Widget>[
//               ListTile(
//                   leading:  Icon(
//                     Icons.camera_enhance_sharp,
//                     color:Colors.blue,
//                   ),
//                   title: const Text('Camera',),
//                   onTap: () => {
//                     mainprovider.getIImgcameraflat(), Navigator.pop(context)
//                   }),
//               ListTile(
//                   leading:  Icon(Icons.photo, color: Colors.blue),
//                   title: const Text('Gallery',),
//                   onTap: () => {
//                     mainprovider.getIImggalleryflat(),Navigator.pop(context)
//                   }),
//             ],
//           );
//         });
//
//   }
//
//
// }
