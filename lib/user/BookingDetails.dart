// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:project/Provider/Mainprovider.dart';
// import 'package:provider/provider.dart';
//
// class Profile extends StatelessWidget {
//   const Profile({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//            appBar:AppBar(
//             backgroundColor:Colors.indigo,
//             leading: IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.arrow_back),
//             ),
//             title:Text("Booking Details",style:TextStyle(color:Colors.white)),
//           ),
//
//            body:Column(
//             children: [
//            Consumer<Mainprovider>(
//              builder: (context,value,child) {
//                return ListView.builder(
//                padding:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//                        physics: ScrollPhysics(),
//                        itemCount: value.RegistrstionList.length,
//                        shrinkWrap:true,
//                        scrollDirection:Axis.vertical,
//                        itemBuilder:(context,int index){
//                          return Container(
//                 height: 100,
//                 width: 100,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Column(
//                       children: [
//                         Text("Name",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.grey),),
//                         Text( value.RegistrstionList[index].name,style: TextStyle(fontSize: 15,),),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Text("Phone",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
//                         Text(value.RegistrstionList[index].phone,style: TextStyle(fontSize: 15,),),
//                       ],
//                     ),
//
//
//                     Column(
//                       children: [
//                         Text("Visit date",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
//                         Text(value.RegistrstionList[index].phone,style: TextStyle(fontSize: 15,),),
//                       ],
//                     ),
//                   ],
//                 ),
//     );
//
//
//                        }
//                    );
//
//              }
//            ),
//
//             ],
//           ),
//
//
//     );
//   }
// }
