import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sar_project/services/student_api_service/student_api_service.dart';
import 'package:sizer/sizer.dart';

class SettingStudentScreen extends StatelessWidget {
  SettingStudentScreen({super.key});

  final StudentApiService apiService = StudentApiService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFDFEDFD), Color(0xFF1A8CFF)],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
              ),
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text(
                "Setting",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ExpansionTile(
                title: Text("Notification Setting"),
                children: [
                  ListTile(
                      title: TextButton(
                          onPressed: () {
                            Get.toNamed('/student_notification_status');
                          },
                          child: Text(
                            "Notification",
                            style:
                                TextStyle(color: Colors.black, fontSize: 12.sp),
                          )))
                ],
              ),
              ExpansionTile(
                title: const Text("Password Manager"),
                children: [
                  ListTile(
                      title: TextButton(
                          onPressed: () {
                            Get.toNamed('/student_changepassword');
                          },
                          child: Text(
                            "Change Password",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 12.sp),
                          )))
                ],
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: 45.w,
                child: ElevatedButton(
                  onPressed: () async {
                    Get.dialog(
                        barrierDismissible: true,
                        Dialog(
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFDFEDFD),
                                      Color(0xFF1A8CFF)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Log Out?",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 2.h),
                                      const Text(
                                        "Are you sure you want \n to Log out?",
                                        style: TextStyle(color: Colors.black),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 2.h),
                                      ElevatedButton(
                                        onPressed: () async {
                                          await apiService.logout();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                        ),
                                        child: const Text("Log out",
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                      SizedBox(height: 1.h),
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black26,
                                        ),
                                        child: const Text("Cancel",
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                ))));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.logout, color: Colors.white),
                      SizedBox(width: 8),
                      Text("Log out", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
