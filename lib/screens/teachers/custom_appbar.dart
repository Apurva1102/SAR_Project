

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatefulWidget {
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned(
          bottom: 3.h,
          left: (MediaQuery.of(context).size.width / 2) - 55,
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 51.0,
                 backgroundImage: AssetImage('assets/images/avtar.png'),
                ),
                SizedBox(height: 1.h,),
                Text("Shivam Dubey",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),

        // Action icons at the top right
        Positioned(
          top: 3.h, // Adjust the top spacing
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 60.w),
              IconButton(
                icon: Icon(Icons.qr_code_scanner_sharp, color: Colors.black),
                onPressed: () {
                  print('QR Code Scanner clicked!');
                },
              ),
              SizedBox(width: 3.w),
              IconButton(
                icon: Icon(Icons.edit, color: Colors.black),
                onPressed: () {
                  print('Edit clicked!');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
