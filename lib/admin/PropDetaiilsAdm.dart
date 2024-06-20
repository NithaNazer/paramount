import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Propdetailss extends StatelessWidget {
  const Propdetailss({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            Container(
              height: 357,
              width: 500,
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.black54),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Stack(children: [
                Image.asset(
                  "assets/img_13.png",
                  fit: BoxFit.cover,
                  scale: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:30, right: 5),
                  child: Image.asset(
                    "assets/img_14.png",
                    scale: 2,
                  ),
                ),
                Positioned(top: 290,left:8,
                  child: Text("Signature Homes",style:GoogleFonts.inter(fontSize:18,color:Colors.white,fontWeight:FontWeight.w700),),
                ),

                Positioned(top:320,left:8,
                  child: Icon(Icons.location_on,color:Colors.white,size:20,),),
                Positioned(top:320,left:30,
                    child: Text("West Garden",style:GoogleFonts.inter(fontSize:15,color:Colors.white,fontWeight:FontWeight.w700),)),


              ]
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 230),
              child: Text(
                "RS.75,00,000",
                style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "This lovely 3+ BHK for sale is only 75 lakh rupees without any extra brokerage and could be your new home \n "
                    "This home is over 1900 sqft and even comes with ample parking space for bike\n"
                    "This home faces the west direction,for those always on the move busstop as well as petrol pump are convenently located close to this home\n"
                    "This home has easy access to ATM,supermarket and more other amenities because of the convenient location.",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:12),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.bed_rounded,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height:5,),
                      Text("3 Bed",style:GoogleFonts.inter(color:Colors.black,fontSize:10,fontWeight:FontWeight.w400),),
                    ],
                  ),

                ),

                SizedBox(width:70,),


                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.bathroom,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height:5,),
                    Text("3 Bath",style:GoogleFonts.inter(color:Colors.black,fontSize:10,fontWeight:FontWeight.w400),),
                  ],
                ),

                SizedBox(width:70,),


                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.local_parking,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height:5,),
                    Text("Parking",style:GoogleFonts.inter(color:Colors.black,fontSize:10,fontWeight:FontWeight.w400),),
                  ],
                ),

              ],
            ),

            SizedBox(height:20,),

            Padding(
              padding: const EdgeInsets.only(right:150),
              child: Column(
                children: [
                  Text("For More Details,Contact",style:GoogleFonts.alatsi(color:Colors.black87,fontSize:20,fontWeight:FontWeight.w700),),
                  SizedBox(height:5,),
                  Text("+91 9999999999",style:GoogleFonts.alatsi(color:Colors.black87,fontSize:20,fontWeight:FontWeight.w700),),
                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
}
