import 'package:flutter/material.dart';
import 'package:project/Provider/Mainprovider.dart';
import 'package:provider/provider.dart';

import '../modelclass/modelclass.dart';
import 'TypeAdd.dart';
import 'addflats.dart';
import 'addhouse.dart';
import 'addplot.dart';
import 'addvilla.dart';
import 'conferenceadd.dart';
import 'conventadd.dart';

class Types extends StatelessWidget {
  String catid;
  String typename;
  Types({super.key,required this.catid,required this.typename});

   @override
  Widget build(BuildContext context) {
     Mainprovider mainprovider =Provider.of(context,listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    // List <String>Images=[
    //   "assets/img_2.png",
    //   "assets/img_3.png",
    //   "assets/img_4.png",
    //   "assets/img_5.png",
    //   "assets/img_29.png",
    //   "assets/img_30.png",
    // ];
    //
    //
    // List<String>names=[
    //   "House",
    //   "Villa",
    //   "Flats",
    //   "Plots",
    //   "Convention Centres",
    //   "Conference Halls"
    // ];

    return Scaffold(
appBar: AppBar(
  leading:InkWell(
      onTap: () {Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back_outlined)),
  title:Text("Types",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w700,fontSize:20)),
),

      body:SingleChildScrollView(
        child: Consumer<Mainprovider>(
          builder: (context,value,child) {
            return Center(
              child:value.gettypeloader?Center(child: CircularProgressIndicator(color: Colors.indigo,)): GridView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                padding: EdgeInsets.all(10),
                itemCount: value.TypeList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                ),

                itemBuilder: (BuildContext context, int index) {
                  gettypes item = value.TypeList[index];
                  return InkWell(
                    onDoubleTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content:  Text(
                              "Do you want to  EDIT or DELETE ?",style: TextStyle(
                              fontSize:17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                          actions: <Widget>[
                            Center(
                              child: Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      value.deleteType(
                                          item.id,context);
                                      Navigator.of(context).pop();

                                    },
                                    child: Container(
                                      height: 45,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          color:Colors.red ,
                                          borderRadius: BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x26000000),
                                              blurRadius: 2.0, // soften the shadow
                                              spreadRadius: 1.0, //extend the shadow
                                            ),
                                          ] ),
                                      child: Center(child:  Text("Delete",style: TextStyle( color:Colors.white,fontSize: 17,fontWeight: FontWeight.w700))),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      print("dnnvfhfhf"+value.TypeList[index].id);
                                      value.edittype(
                                          value.TypeList[index].id);
                                      Navigator.pop(context);

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TypeAdd(
                                                    from: "EDIT",
                                                    oldid: value.TypeList[index].id
                                                ),
                                          ));
                                    },
                                    child:Container(
                                      height: 45,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          color:Colors.indigo ,
                                          borderRadius: BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x26000000),
                                              blurRadius: 2.0, // soften the shadow
                                              spreadRadius: 1.0, //extend the shadow
                                            ),
                                          ] ),
                                      child: Center(child:  Text("Edit",style: TextStyle( color:Colors.white,fontSize: 17,fontWeight: FontWeight.w700))),
                                    ),)
                                ],
                              ),
                            ),

                          ],
                        ),
                      );
                    },
                    child: InkWell(
                      onTap: () {
                        if(index==0||index==1||index==2){
                          value.houseclear();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => addhouse(from:"NEW",oldid:item.id,typename:item.name,),));
                        }else if(index==3||index==4){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RentAdd(from:"NEW",oldid:item.id,typename:item.name,),));
                        }
                      },
                      child: Container(
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width:width/2,
                              height:height/6,
                              decoration: BoxDecoration(
                                  image:DecorationImage(image:NetworkImage(value.TypeList[index].photo.toString()),
                                    fit:BoxFit.fill,
                                  )
                              ),
                            ),
                            Text(value.TypeList[index].name.toString(),style:TextStyle(fontWeight:FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        ),
      ),


      floatingActionButton:
          Consumer<Mainprovider>(
            builder: (context,value,child) {
              return FloatingActionButton(
                  onPressed: (){
                    value.typesclear();
                    value.getType();
                    value.getcategory();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TypeAdd(from: "NEW",oldid: "")));
                  },
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.add),
                );
            }
          ),

    );
  }
}
