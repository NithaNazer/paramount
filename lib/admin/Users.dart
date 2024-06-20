import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Provider/Mainprovider.dart';
import 'package:provider/provider.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading:InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_outlined)),
        title:Text("Users",style:TextStyle(color:Colors.black,fontSize:20,fontWeight:FontWeight.w700)),
      ),
      body:SingleChildScrollView(
        child: Consumer<Mainprovider>(
           builder: (context,value,child) {
             return ListView.builder(
               padding:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
               physics: ScrollPhysics(),
               itemCount: value.RegistrstionList.length,
               shrinkWrap:true,
               scrollDirection:Axis.vertical,
               itemBuilder:(context,int index){
                 return Container(
                   height: 100,
                   width: 100,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Column(
                         children: [
                           Text("Name",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.grey),),
                           Text( value.RegistrstionList[index].name,style: TextStyle(fontSize: 15,),),
                         ],
                       ),
                       Column(
                         children: [
                           Text("Phone",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
                           Text(value.RegistrstionList[index].phone,style: TextStyle(fontSize: 15,),),
                         ],
                       ),
                     ],
                   ),
                 );

               }
             );
           }
         ),
      ),

    );
  }
}
