import 'dart:io';
import 'dart:ui';

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Provider/Mainprovider.dart';
import 'package:project/user/Bookingg%20Detailss.dart';
import 'package:project/user/profile.dart';
import 'package:provider/provider.dart';

import 'BookingDetails.dart';
import 'UserTypes.dart';
import 'Notification.dart';
import '';

// class BottomNavigation extends StatefulWidget {
//   String catid;
//    BottomNavigation({super.key,required this.catid});
//
//   @override
//   State<BottomNavigation> createState() => BottomNavigationState();
// }
//
// class BottomNavigationState extends State<BottomNavigation> {
//   int selectedindex=0;
//   @override
//   void _itemTaped(int index){
//     setState(() {
//       selectedindex=index;
//     });
//   }
//   Widget build(BuildContext context) {
//     var pages=[
//        userTypes(catid:widget.catid),
//       BookingDetails(),
//       notification(),
//       profile(),
//
//     ];
//
//     Mainprovider provider=Provider.of<Mainprovider>(context,listen: true);
//     return Scaffold(
//       body: pages[selectedindex],
//       extendBody: true,
//       bottomNavigationBar: DotNavigationBar(
//           margin: EdgeInsets.zero,marginR: EdgeInsets.zero,paddingR: EdgeInsets.zero,
//           // enableFloatingNavBar: true,
//           selectedItemColor: Colors.white,
//           unselectedItemColor: Colors.grey,
//           backgroundColor: Colors.indigo.withOpacity(0.90),
//           currentIndex: selectedindex,
//
//           onTap: _itemTaped,
//
//           items: [
//             DotNavigationBarItem(
//
//               icon: Icon(Icons.home_filled),
//
//             ),
//             DotNavigationBarItem(
//               icon: Icon(Icons.library_books_sharp),
//
//             ),
//
//            IconButton(
//                onPressed:)
//
//            //  DotNavigationBarItem(
//            //
//            //    icon: Icon(Icons.notifications),
//            // ),
//
//             DotNavigationBarItem(
//               icon: Icon(Icons.person_2_outlined),
//
//
//             ),
//
//           ],
//       ),
//     );
//   }
// }
class BottomNavigation extends StatelessWidget {
  String userid;
  String catid;
  String name;
  String phone;
  String houseid;
  String convid;
  String from;
  BottomNavigation({Key? key,required this.userid,required this.catid,required this.name,required this.phone,required this.houseid,required this.convid,required this.from}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = [  userTypes(catid:catid,userid:userid,name:name,phone:phone,from:from,),
      BookinggDetailss(),
      notification(),
      profile(userid:userid,name:name,phone:phone,)];
    Mainprovider provider = Provider.of<Mainprovider>(context, listen: true);
    return Scaffold(
        bottomNavigationBar: Container(
          height: 50,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                // enableFeedback: false,
                  onPressed: () {
                    provider.onItemTapped(0);
                  },
                  icon: provider.selectedIndex==0?Icon(Icons.home,color: Colors.black,size:27):Icon(Icons.home_outlined,size:27,color: Colors.grey.withOpacity(1),)),
              IconButton(
                // enableFeedback: false,
                  onPressed: () {
                    provider.get_DETAIL(houseid,convid);
                    provider.onItemTapped(1);
                  },
                  icon: provider.selectedIndex==1?Icon(Icons.event_note_rounded,color: Colors.black,size:27):Icon(Icons.event_note_rounded,size:27,color: Colors.grey.withOpacity(1))),
              IconButton(
                // enableFeedback: false,
                  onPressed: () {
                    provider.onItemTapped(2);
                  },
                  icon:provider.selectedIndex==2?Icon(Icons.favorite,color:Colors.red ,size:27):Icon(Icons.favorite_border,color: Colors.grey.withOpacity(1),size:27)),
              IconButton(
                  onPressed: () {
                    print("1111111111111111111");
                    print(userid);
                    // provider.getUser(userid);
                    provider.onItemTapped(3);
                  },
                  icon:provider.selectedIndex==3?Icon(Icons.person,color:Colors.black ,size:27):Icon(Icons.person_outline_rounded,size:27,color: Colors.grey.withOpacity(1))),
            ],
          ),
        ),
        body: pages[provider.selectedIndex],
        );
    }
}