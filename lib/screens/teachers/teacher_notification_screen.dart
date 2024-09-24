import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TeacherNotificationScreen extends StatefulWidget {
  const TeacherNotificationScreen({super.key});

  @override
  State<TeacherNotificationScreen> createState() => _TeacherNotificationScreenState();
}

class _TeacherNotificationScreenState extends State<TeacherNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       centerTitle: true,
        title: Text(" Notification",style: TextStyle(fontSize: 18.sp,),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildLectureInfo("First Lecture / Class" , "6A at 8:30 ","View"),
              _buildLectureInfo("New Task added", "7D  at 10:30", "View")
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildLectureInfo(String title, String time, String subtitle) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Container(
      width: 90.w,
      height: 10.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 12.sp)),
                Text(time, style: TextStyle(color: Colors.grey,fontSize: 11.sp)),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              subtitle,
              style: TextStyle(color: Colors.blue,fontSize: 13.sp),
            ),
          ),
        ],
      ),
    ),
  );
}
