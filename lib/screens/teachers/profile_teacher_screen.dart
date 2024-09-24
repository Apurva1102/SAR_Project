import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_appbar.dart';

class ProfileTeacherScreen extends StatefulWidget {
  const ProfileTeacherScreen({super.key});

  @override
  State<ProfileTeacherScreen> createState() => _ProfileTeacherScreenState();
}

class _ProfileTeacherScreenState extends State<ProfileTeacherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(20.h), // Adjust the height as needed
      //   child: Container(color: Colors.transparent,
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     colors:
          //     [Color(0xFFDFEDFD), Color(0xFF1A8CFF)],
          //     end: Alignment.topCenter,
          //     begin: Alignment.bottomCenter,
          //   ),
          // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          //  mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 1.h,),
              Text("      User ID: ",style: TextStyle(fontSize: 13.sp),),
              infoTeacher(),
              SizedBox(height: 1.h,),
              Text("      Full Name: ",style: TextStyle(fontSize: 13.sp),),
              infoTeacher(),
              SizedBox(height: 1.h,),
              Text("      Class: ",style: TextStyle(fontSize: 13.sp),),
              infoTeacher(),
              SizedBox(height: 1.h,),
              Text("      Section: ",style: TextStyle(fontSize: 13.sp),),
              infoTeacher(),
              SizedBox(height: 1.h,),
              Text("      Conact No: ",style: TextStyle(fontSize: 13.sp),),
              infoTeacher(),
              SizedBox(height: 1.h,),
              Text("      Password: ",style: TextStyle(fontSize: 13.sp),),
              infoTeacher(),
            ],
          ),
        ),
      ),
      );
  }
}

Widget infoTeacher() {
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[200], // Set the desired grey background color
        borderRadius: BorderRadius.circular(30), // Match the border radius
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none, // Remove the border side
          ),
          filled: true, // Allows the background color to be visible
          fillColor: Colors.transparent, // Make the fill color transparent
        ),
      ),
    ),
  );
}
