import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Provider/Mainprovider.dart';
import 'package:project/user/UserTypes.dart';
import 'package:project/user/plotlist.dart';
import 'package:provider/provider.dart';

import '../constant/myfunctions.dart';
import 'BottomNavigation.dart';
import 'housedetails.dart';


class lists extends StatelessWidget {
  String catid;
  String userid;
  String name;
  String phone;
  String from;
  lists({super.key,required this.catid,required this.userid,required this.name,required this.phone,required this.from});

  @override
  Widget build(BuildContext context) {

    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          leading: InkWell(onTap: (){
            back(context);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigation(catid: catid,userid: userid,name:name,phone:phone,houseid:"",convid:"",from:from,)));
          },
              child: Icon(Icons.arrow_back_outlined)),
          toolbarHeight: 100,
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
          child: Consumer<Mainprovider>(
            builder: (context,value,child) {
              print("bvjhs"+value.Typehouse.length.toString());
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 240),
                    child: Text("${value.Typehouse.length} Results Found",style:GoogleFonts.alatsi(fontWeight:FontWeight.w500,fontSize:17,color:Colors.black)),
                  ),


                  SizedBox(height: 1,),
                  Consumer<Mainprovider>(
                    builder: (context,value,child) {
                      return ListView.builder(
                          itemCount:value.Typehouse.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder:(BuildContext context,int index){
                            var item=value.Typehouse[index];
                            return  InkWell(
                              onTap:() {
                                Navigator.push(context, MaterialPageRoute(builder:(context) => Propdetails(
                                  housephoto: item.housephoto,houseid:item.houseid,housename: item.housename,
                                    houselocation:item.houselocation,houseprice:item.houseprice,housedescription:item.housedescription,
                                    housenoofbedrooms: item.housenoofbedrooms,housenoofbathrooms: item.housenoofbathrooms,houseparking: item.houseparking,
                                    housecontact:item.housecontact,option:item.option,typeid:item.typeid,type: item.type,
                                  ),));
                                // }



                              },

                              child: Container(
                                // height: height/1,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blue,),
                                margin: EdgeInsets.only(top: 40,right: 30,left: 30),
                                child:Column(
                                  children: [
                                    Image.network(value.Typehouse[index].housephoto.toString(),fit: BoxFit.cover,),
                                  ],
                                ),
                              ),
                            );
                      }

                      );
                    }
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
