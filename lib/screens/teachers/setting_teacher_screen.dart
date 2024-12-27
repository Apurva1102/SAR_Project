import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SettingTeacherScreen extends StatelessWidget {
  const SettingTeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ExpansionTile(
                title: Text("Notification Setting"),
                children: [
                  ListTile(
                    title: TextButton(
                      onPressed: () {
                        Get.toNamed('/status_bar');
                      },
                      child: Text(" Notification",style: TextStyle(fontSize: 12.sp,color: Colors.black),),
                    ),
                  )
                ],
              ),
              ExpansionTile(
                title: const Text("Password Manager"),
                children: [
                  ListTile(
                      title: TextButton(
                          onPressed: () {
                            Get.toNamed('/teacher_changepassword');
                          },
                          child: Text(
                            "Change Password",
                            style: TextStyle(
                                color: Colors.black87, fontSize: 12.sp),
                          )))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
