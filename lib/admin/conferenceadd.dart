// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:project/Provider/Mainprovider.dart';
// import 'package:provider/provider.dart';
//
// class addconference extends StatelessWidget {
//   String from;
//   String oldid;
//   addconference({super.key,required this.from,required this.oldid});
//   final formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//           Column(
//           children: [
//           Consumer<Mainprovider>(
//               builder: (context,value,child) {
//         return InkWell(
//         onTap: () {
//         showBottomSheet(context);
//         },
//         child:Column(
//         children:List.generate(value.fileImagecList.length, (index) {
//         return CircleAvatar(
//         radius: 60,
//         backgroundImage: FileImage(value.fileImagecList[index]),
//         );
//         }),
//         ),
//         );
//         }
//         ),
//
//
//           SizedBox(height:30),
//
//
//             SizedBox(width:7),
//
//             Consumer<Mainprovider>(
//                 builder: (context,value,child) {
//                   return InkWell(
//                     onTap: () {
//                       showBottomSheet(context);
//                     },
//                    child:Center(
//                       child:value.filecImage!=null? CircleAvatar(
//                         radius:60,
//                         backgroundColor:Colors.grey,
//                         backgroundImage: FileImage(value.filecImage!),
//                       ):value.confImage!=""?
//                       child: CircleAvatar(
//                         radius:60,
//                         backgroundColor:Colors.grey,
//                         child:Icon(Icons.image,size:45),
//                       ),
//                     ),
//                   );
//                 }
//             ),
//
//               SizedBox(
//                 width:380,
//                 height: 90,
//                 child:Consumer<Mainprovider>(
//                     builder: (context,value,child) {
//                       return TextField(
//                         controller: value.conventionDescriptionController,
//                         decoration:InputDecoration(
//                           hintText:"Description",
//                           hintStyle:TextStyle(color:Colors.grey),
//                           border:OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
//                           fillColor:Colors.grey,
//
//                         ),
//                         style:TextStyle(color:Colors.black),
//                       );
//                     }
//                 ),
//               ),
//
//
//               SizedBox(height:20,),
//
//
//               SizedBox(
//                 width:380,
//                 height:90,
//                 child:Consumer<Mainprovider>(
//                     builder: (context,value,child) {
//                       return TextField(
//                         controller: value.conventionAddressController,
//                         decoration:InputDecoration(
//                           hintText:"Address",
//                           hintStyle:TextStyle(color:Colors.grey),
//                           border:OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
//                           fillColor:Colors.grey,
//
//                         ),
//                         style:TextStyle(color:Colors.black),
//                       );
//                     }
//                 ),
//               ),
//
//
//               SizedBox(height:20,),
//
//
//
//               SizedBox(
//                 width:380,
//                 height:90,
//                 child:Consumer<Mainprovider>(
//                     builder: (context,value,child) {
//                       return TextField(
//                         controller:value.conventionPriceController,
//                         decoration:InputDecoration(
//                           hintText:"Price",
//                           hintStyle:TextStyle(color:Colors.grey),
//                           border:OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
//                           fillColor:Colors.grey,
//
//                         ),
//                         style:TextStyle(color:Colors.black),
//                       );
//                     }
//                 ),
//               ),
//
//             SizedBox(height:60,),
//
//             Consumer<Mainprovider>(
//                 builder: (context,value,child) {
//                   return Container(
//                     width:100,
//                     height:50,
//                     decoration:BoxDecoration(
//                       color:Colors.indigo,
//                       borderRadius:BorderRadius.circular(8),
//                     ),
//                     child:InkWell(
//                         onTap: () {
//                        value.addConftype(oldid);
//                        value.confclear();
//
//                         },
//                         child: Center(child: Text("Add",style:TextStyle(color:Colors.white,fontWeight:FontWeight.w600,fontSize:15)))),
//                   );
//                 }
//               )
//             ],
//           ),
//       ],
//     ),
//       ),
//     ),
//     );
//
//   }
//
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
//                     mainprovider.getConfImgcamera(), Navigator.pop(context)
//                   }),
//               ListTile(
//                   leading:  Icon(Icons.photo, color: Colors.blue),
//                   title: const Text('Gallery',),
//                   onTap: () => {
//                     mainprovider.getConfImggallery(),Navigator.pop(context)
//                   }),
//             ],
//           );
//         });
//
//   }
//
//
//
// }
