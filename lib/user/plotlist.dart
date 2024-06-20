// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:project/Provider/Mainprovider.dart';
// import 'package:provider/provider.dart';
//
// import 'BookNow.dart';
//
// class plotlists extends StatelessWidget {
//   String option;
//   String plotid;
//   String plotphoto;
//   String plotLandmark;
//   String plotArea;
//   String plotprice;
//   String plotDescription;
//   String plotAddress;
//   String plotContactnumber;
//   String typeid;
//   String type;
//    plotlists({super.key,required this.option,required this.plotid,required this.plotphoto,required this.plotLandmark,required this.plotArea,
//    required this.plotprice,required this.plotDescription,required this.plotAddress,required this.plotContactnumber,required this.typeid,required this.type
//    });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Column(
//         children: [
//           Container(
//             height:80,
//             width:70,
//             decoration:BoxDecoration(
//               color:Colors.black87,
//             ),
//           ),
//           SizedBox(height:30,),
//           Consumer<Mainprovider>(
//               builder: (context,value,child) {
//                 return ListView.builder( padding:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//                     physics: ScrollPhysics(),
//                     itemCount:value.subtypeplt.length ,
//                     shrinkWrap:true,
//                     scrollDirection:Axis.vertical,
//                     itemBuilder:(context,int index){
//                       return Padding(
//                         padding: const EdgeInsets.only(bottom:10),
//                         child: Container(
//                           height:230,
//                           width:300,
//                           decoration:BoxDecoration(
//                             color:Colors.indigo,
//                           ),
//                           child:Padding(
//                             padding: const EdgeInsets.only(top:50),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Text("       Landmark                 :",style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20)),
//                                     SizedBox(width:5,),
//                                     Text(value.subtypeplt[index].plotLandmark,style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20)),
//                                   ],
//                                 ),
//
//                                 SizedBox(height:30,),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left:35),
//                                   child: Row(
//                                     children: [
//                                       Text("Area           :",style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20)),
//                                       SizedBox(width:5,),
//                                       Text(value.subtypeplt[index].plotArea,style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),
//
//                                     ],
//                                   ),
//                                 ),
//
//
//                                 SizedBox(height:30,),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left:35),
//                                   child: Row(
//                                     children: [
//                                       Text("Price            :",style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20)),
//                                       SizedBox(width:5,),
//                                       Text(value.subtypeplt[index].plotprice,style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),
//
//                                     ],
//                                   ),
//                                 ),
//
//                                 SizedBox(height:30,),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left:35),
//                                   child: Row(
//                                     children: [
//                                       Text("Description           :",style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20)),
//                                       SizedBox(width:5,),
//                                       Text(value.subtypeplt[index].plotDescription,style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),
//
//                                     ],
//                                   ),
//                                 ),
//
//
//                                 SizedBox(height:30,),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left:35),
//                                   child: Row(
//                                     children: [
//                                       Text("Price            :",style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20)),
//                                       SizedBox(width:5,),
//                                       Text(value.subtypeplt[index].plotprice,style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),
//
//                                     ],
//                                   ),
//                                 ),
//
//
//
//
//
//
//                                 SizedBox(height:30,),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left:35),
//                                   child: Row(
//                                     children: [
//                                       Text("Address         :",style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20)),
//                                       SizedBox(width:5,),
//                                       Text(value.subtypeplt[index].plotAddress,style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),
//
//                                     ],
//                                   ),
//                                 ),
//
//
//
//
//                                 SizedBox(height:30,),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left:35),
//                                   child: Row(
//                                     children: [
//                                       Text("Contact Number           :",style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20)),
//                                       SizedBox(width:5,),
//                                       Text(value.subtypeplt[index].plotContactnumber,style:GoogleFonts.inriaSans(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18)),
//
//                                     ],
//                                   ),
//                                 ),
//
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     });
//               }
//           ),
//
//
//
//
//
//           Container(
//             height:40,
//             width:110,
//             decoration:BoxDecoration(
//               color:Colors.indigo,
//               borderRadius:BorderRadius.circular(10),
//             ),
//             child:Center(child: InkWell(onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>BookNow()));
//             },
//                 child: Text("BookNow",style:GoogleFonts.aBeeZee(color:Colors.white,fontWeight:FontWeight.w500,fontSize:15)))),
//           )
//         ],
//       ),
//     );
//   }
// }
