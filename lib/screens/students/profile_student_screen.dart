import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../teachers/custom_appbar.dart';

class ProfileStudentScreen extends StatefulWidget {
  const ProfileStudentScreen({super.key});

  @override
  State<ProfileStudentScreen> createState() => _ProfileStudentScreenState();
}

class _ProfileStudentScreenState extends State<ProfileStudentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(20.h), // Adjust the height as needed
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFDFEDFD), Color(0xFF1A8CFF)],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
              ),
            ),
            child: CustomAppBar(),
          )
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //  mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 1.h,),
              Text("      User ID: ",style: TextStyle(fontSize: 13.sp),),
              infoStudent(),
              SizedBox(height: 1.h,),
              Text("      Full Name: ",style: TextStyle(fontSize: 13.sp),),
              infoStudent(),
              SizedBox(height: 1.h,),
              Text("      Class: ",style: TextStyle(fontSize: 13.sp),),
              infoStudent(),
              SizedBox(height: 1.h,),
              Text("      Section: ",style: TextStyle(fontSize: 13.sp),),
              infoStudent(),
              SizedBox(height: 1.h,),
              Text("      Conact No: ",style: TextStyle(fontSize: 13.sp),),
            infoStudent(),
              SizedBox(height: 1.h,),
              Text("      Password: ",style: TextStyle(fontSize: 13.sp),),
              infoStudent(),
            ],
          ),
        ),
      ),
    );
  }
}


Widget infoStudent() {
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