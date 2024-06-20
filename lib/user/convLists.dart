import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/user/Login.dart';
import 'package:provider/provider.dart';

import '../Provider/Mainprovider.dart';
import '../constant/myfunctions.dart';
import 'UserTypes.dart';
import 'conv details.dart';
import 'housedetails.dart';


class convlists extends StatelessWidget {
  // String oldid;
  //  String type;
  String catid;
  String userid;
  String name;
  String phone;
  String from;
   convlists({super.key,required this.catid,required this.userid,required this.name,required this.phone,required this.from});

  @override
  Widget build(BuildContext context) {

    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          leading: InkWell(onTap: (){
            Navigator.pop(context);
            // back(context);
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>userTypes(catid:catid,userid:userid,name:name,phone:phone,from:from,)));
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
                print("bvjhs"+value.subconv.length.toString());
                return Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(right:260),
                      child: Text("For Rent Only",style:GoogleFonts.inter(fontWeight:FontWeight.w500,fontSize:15,color:Colors.green),),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(right: 240),
                      child: Text("${value.subconv.length} Results Found",style:GoogleFonts.alatsi(fontWeight:FontWeight.w500,fontSize:17,color:Colors.black)),
                    ),



                    SizedBox(height: 1,),
                    ListView.builder(
                        itemCount:value.subconv.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder:(BuildContext ctx,int index){
                          var item=value.subconv[index];
                          return  InkWell(
                            onTap:() {
                              print("jhvjfhv0"+ item.convdescription);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Conventionlists2( photo: value.subconv[index].photo,
                                convid:item.convid,convdescription: item.convdescription,convaddress:item.convaddress,
                                convprice:item.convprice,typeid:item.typeid,type: item.type,),));
                              },
                            child: Container(
                              height: height/2,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blue,),
                              margin: EdgeInsets.only(top: 40,right: 30,left: 30),
                              child:Image.network(value.subconv[index].photo[0].toString(),fit: BoxFit.cover),
                            ),

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
