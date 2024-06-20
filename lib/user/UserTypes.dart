import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/user/Buy%20and%20Rent%20user.dart';
import 'package:provider/provider.dart';
import '../Provider/Mainprovider.dart';
import '../admin/conferenceadd.dart';
import '../admin/conventadd.dart';
import 'About us.dart';
import 'Lists.dart';
import 'convLists.dart';

class userTypes extends StatelessWidget{
  String catid;
  String userid;
  String name;
  String phone;
  String from;
  userTypes({super.key,required this.catid,required this.userid,required this.name,required this.phone,required this.from});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
  appBar:AppBar(leading: InkWell(
      onTap:() {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>Buyandrentuser(userid:userid,name:name,phone:phone),));
      },
      child: Icon(Icons.arrow_back_outlined)),),
body:SingleChildScrollView(child:
      Consumer<Mainprovider>(
          builder: (context,value,child) {
           return GridView.builder(
              shrinkWrap: true,
                itemCount: value.TypeList.length,
                physics: ScrollPhysics(),
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8
                ),
                itemBuilder: (BuildContext context,int index){
                  return InkWell(onTap:() {
                    if (index == 3 || index == 4) {
                      value.getsubtypecon(value.TypeList[index].id,);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => convlists(catid:catid,userid:userid,name:name,phone:phone,from: from)));
                    } else {
                      value.gethouseType(value.TypeList[index].id,from);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => lists(catid:catid,userid:userid,name:name,phone:phone,from:from),));
                    }
                  },

                    child:Container(
                       decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children:[
                            Container(
                              width:width/2,
                             height:height/6,
                              decoration:BoxDecoration(
                                  image:DecorationImage(image:NetworkImage(value.TypeList[index].photo.toString()),
                                  fit:BoxFit.fill,
                                  )
                              ),
                            ),
                            Text(value.TypeList[index].name)
                          ],
                        ),
                      ),
                  );
              });
          }

  ),
),
 );
        }
}