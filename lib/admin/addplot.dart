// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:project/Provider/Mainprovider.dart';
// import 'package:provider/provider.dart';
//
// class plotadd extends StatelessWidget {
//   String from;
//   String oldid;
//   plotadd({super.key,required this.from,required this.oldid});
//   final formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//             children: [
//               SizedBox(height: 10,),
//               Consumer<Mainprovider>(
//                   builder: (context, value, child) {
//                     return InkWell(
//                       onTap: () {
//                         showBottomSheet(context);
//                       },
//                       child: value.plotaddimg != null ? Center(
//                           child: CircleAvatar(
//                               radius: 60,
//                               backgroundColor: Colors.grey,
//                               backgroundImage: FileImage(value.plotaddimg!)
//                           )) : value.Image != "" ?
//                       Center(
//                           child: CircleAvatar(
//                             radius: 60,
//                             backgroundColor: Colors.grey,
//                             backgroundImage: NetworkImage(value.ploImage),
//                           )) :
//                       Center(
//                         child: CircleAvatar(
//                           radius: 60,
//                           backgroundColor: Colors.grey,
//                           child: Icon(Icons.image, size: 45),
//                         ),
//
//                       ),
//                     );
//                   }
//               ),
//
//               SizedBox(height: 30,),
//
//
//               SizedBox(
//                 width: 380,
//                 height: 90,
//                 child: Consumer<Mainprovider>(
//                     builder: (context, value, child) {
//                       return TextField(
//                         controller: value.plotLandmarkController,
//                         decoration: InputDecoration(
//                           hintText: "LandMark",
//                           hintStyle: TextStyle(color: Colors.grey),
//                           border: OutlineInputBorder(borderRadius: BorderRadius
//                               .circular(12)),
//                           fillColor: Colors.grey,
//
//                         ),
//                         style: TextStyle(color: Colors.black),
//                       );
//                     }
//                 ),
//               ),
//
//
//               SizedBox(height: 10,),
//
//
//               SizedBox(
//                 width: 380,
//                 height: 90,
//                 child: Consumer<Mainprovider>(
//                     builder: (context, value, child) {
//                       return TextField(
//                         controller: value.plottAreaController,
//                         decoration: InputDecoration(
//                           hintText: "Area",
//                           hintStyle: TextStyle(color: Colors.grey),
//                           border: OutlineInputBorder(borderRadius: BorderRadius
//                               .circular(12)),
//                           fillColor: Colors.grey,
//
//                         ),
//                         style: TextStyle(color: Colors.black),
//                       );
//                     }
//                 ),
//               ),
//
//
//               SizedBox(
//                 width: 380,
//                 height: 90,
//                 child: Consumer<Mainprovider>(
//                     builder: (context, value, child) {
//                       return TextField(
//                         controller: value.plotPricecontroller,
//                         decoration: InputDecoration(
//                           hintText: "Price",
//                           hintStyle: TextStyle(color: Colors.grey),
//                           border: OutlineInputBorder(borderRadius: BorderRadius
//                               .circular(12)),
//                           fillColor: Colors.grey,
//
//                         ),
//                         style: TextStyle(color: Colors.black),
//                       );
//                     }
//                 ),
//               ),
//
//               SizedBox(
//                 width: 380,
//                 height: 90,
//                 child: Consumer<Mainprovider>(
//                     builder: (context, value, child) {
//                       return TextField(
//                         controller: value.plotDescriptionController,
//                         decoration: InputDecoration(
//                           hintText: "Description",
//                           hintStyle: TextStyle(color: Colors.grey),
//                           border: OutlineInputBorder(borderRadius: BorderRadius
//                               .circular(12)),
//                           fillColor: Colors.grey,
//
//                         ),
//                         style: TextStyle(color: Colors.black),
//                       );
//                     }
//                 ),
//               ),
//
//
//               SizedBox(height: 10,),
//
//
//               SizedBox(
//                 width: 380,
//                 height: 90,
//                 child: Consumer<Mainprovider>(
//                     builder: (context, value, child) {
//                       return TextField(
//                         controller: value.plotAddressController,
//                         decoration: InputDecoration(
//                           hintText: "Address",
//                           hintStyle: TextStyle(color: Colors.grey),
//                           border: OutlineInputBorder(borderRadius: BorderRadius
//                               .circular(12)),
//                           fillColor: Colors.grey,
//
//                         ),
//                         style: TextStyle(color: Colors.black),
//                       );
//                     }
//                 ),
//               ),
//
//
//               SizedBox(height: 10,),
//
//
//               SizedBox(
//                 width: 380,
//                 height: 90,
//                 child: Consumer<Mainprovider>(
//                     builder: (context, value, child) {
//                       return TextField(
//                         controller: value.plotContactController,
//                         decoration: InputDecoration(
//                           hintText: "Contact Number",
//                           hintStyle: TextStyle(color: Colors.grey),
//                           border: OutlineInputBorder(borderRadius: BorderRadius
//                               .circular(12)),
//                           fillColor: Colors.grey,
//
//                         ),
//                         style: TextStyle(color: Colors.black),
//                       );
//                     }
//                 ),
//               ),
//
//
//               SizedBox(height: 10,),
//
//               Consumer<Mainprovider>(
//                   builder: (context, value, child) {
//                     return Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Row(
//                           children: [
//                             Radio(
//                                 activeColor: Colors.indigo,
//                                 value: "buy",
//                                 groupValue: value.checkvalue,
//                                 onChanged: (value1) {
//                                   value.checkvalue = value1.toString();
//                                   value.notifyListeners();
//                                 }
//                             ),
//                             Text("Buy")
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Radio(
//                                 activeColor: Colors.indigo,
//                                 value: "rent",
//                                 groupValue: value.checkvalue,
//                                 onChanged: (value1) {
//                                   value.checkvalue = value1.toString();
//                                   value.notifyListeners();
//                                 }
//                             ),
//                             Text("Rent")
//                           ],
//                         ),
//                       ],
//                     );
//                   }
//               ),
//
//
//               Consumer<Mainprovider>(
//                 builder: (context,value,child) {
//                   return Container(
//                     width: 100,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: Colors.indigo,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: InkWell(
//                       onTap:() {
//                         value.addplot(oldid);
//                         value.plotclear();
//                       },
//                       child: Center(child: Text("Add", style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 15))),
//                     ),
//                   );
//                 }
//               )
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   void showBottomSheet(BuildContext context) {
//     Mainprovider mainprovider = Provider.of<Mainprovider>(
//         context, listen: false);
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
//                   leading: Icon(
//                     Icons.camera_enhance_sharp,
//                     color: Colors.blue,
//                   ),
//                   title: const Text('Camera',),
//                   onTap: () =>
//                   {
//                     mainprovider.getIImgcameraplot(), Navigator.pop(context)
//                   }),
//               ListTile(
//                   leading: Icon(Icons.photo, color: Colors.blue),
//                   title: const Text('Gallery',),
//                   onTap: () =>
//                   {
//                     mainprovider.getImggalleryplot(), Navigator.pop(context)
//                   }),
//             ],
//           );
//         });
//   }
// }
