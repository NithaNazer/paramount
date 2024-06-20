import 'package:flutter/material.dart';
import 'package:project/Provider/Mainprovider.dart';
import 'package:project/constant/mycolors.dart';
import 'package:provider/provider.dart';

import '../constant/refactor.dart';

class editprofile extends StatelessWidget {
  const editprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:otpclr,
      body: Consumer<Mainprovider>(
        builder: (context,value,child) {
          return Column(
            children: [
             SizedBox(height:100,),
              txtformfield2(
                "Name",value.RegisterNamecontroller
              )
            ],
          );
        }
      ),
    );
  }
}
