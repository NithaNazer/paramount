import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Provider/Mainprovider.dart';
import 'package:provider/provider.dart';


import 'addhouse.dart';

class AdminLists extends StatelessWidget {
   AdminLists({super.key});


   List<String>images=[
  //   "assets/img_12.png",
  //   "assets/img_10.png",
  //   "assets/img_9.png",
  //   "assets/img_11.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          floatingActionButton:  Consumer<Mainprovider>(
            builder: (context,value,child) {
              return FloatingActionButton(
              onPressed: (){
                value.Icategoryclear();
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageAdd ()));
                  },
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.add),
                  );
            }
          ),
        appBar:AppBar(toolbarHeight: 100,
        title: SizedBox(width: 400,
        child:TextField(

        decoration: InputDecoration(labelText: "Search",
        fillColor: Colors.white,
        border: OutlineInputBorder(
        borderRadius:  BorderRadius.circular(15),

    ),
    suffixIcon:Icon(Icons.search),

    ),
    ),
    ),),




    body: SingleChildScrollView(
    child: Column(
    children: [

    Padding(
    padding: const EdgeInsets.only(right: 240),
    child: Text("53 Results Found",style:GoogleFonts.alatsi(fontWeight:FontWeight.w500,fontSize:17,color:Colors.black)),
    ),


    SizedBox(height: 1,),
    Consumer<Mainprovider>(
      builder: (context,value,child) {
        return ListView.builder(itemCount:value.TypeIList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder:(BuildContext context,int index){
        return  Container(
        height: 150,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blue,),
        margin: EdgeInsets.only(top: 40,right: 30,left: 30),
        child:Image.network(value.TypeIList[index].photo.toString(),fit: BoxFit.cover,),
        );
        }
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
