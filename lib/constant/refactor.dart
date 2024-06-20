import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mycolors.dart';

Widget box (double height, double width, Color c ){
  return Center(
      child: Container(
          height: height,
          width: width,
          color: c,
      ),
      );
  }
Widget Gap(double width){
    return SizedBox(width: width);
}


Widget txtformfield2(String text ,TextEditingController controller) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          child: TextFormField(
            controller: controller,
            style: TextStyle(color: white),
            decoration: InputDecoration(
              fillColor: Colors.indigo,
              filled: true,
              hintText: text,
              // prefixIcon:Icon(Icons.search_outlined,color: white,),
              hintStyle: TextStyle(color: white, fontSize: 15),

              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 0.4,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 0.4,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 0.4,
                ),
                // borderSide: const BorderSide(
                //   color: Colors.black26,
                //   width:1,
                // ),
              ),
            ),
          ),
          ),
      );
}