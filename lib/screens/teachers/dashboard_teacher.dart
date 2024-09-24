import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sar_project/controller/bottom_navigation_controller.dart';
import 'package:sar_project/screens/teachers/leave_screen.dart';
import 'package:sar_project/screens/teachers/profile_teacher_screen.dart';
import 'package:sar_project/screens/teachers/setting_teacher_screen.dart';
import 'package:sizer/sizer.dart';
import '../login_screen.dart';
import '../students/student_notification.dart';
import 'dashboard_teacherContent.dart';

class DashboardTeacher extends StatefulWidget {
  const DashboardTeacher({super.key});

  @override
  State<DashboardTeacher> createState() => _DashboardTeacherState();
}

class _DashboardTeacherState extends State<DashboardTeacher> {
  final BottomNavigationController bcontroller =
      Get.put(BottomNavigationController());

  final List<String> pagesName = [
    "Welcome",
    "Leave Section",
    "",
    "Setting",
  ];

  final List<Widget> pages = [
    DashboardContent(),
    LeaveScreen(),
    ProfileTeacherScreen(),
    SettingTeacherScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFDFEDFD), Color(0xFF1A8CFF)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        centerTitle: true,
        title: Obx(() {
          return Text(
            pagesName[bcontroller.currentIndex.value],
            style: TextStyle(),
          );
        }),
        actions: [
          InkWell(
            onTap: () {
             // print("object");
             // Get.toNamed('/student_notification');
              Get.toNamed('/teacher_notification_screen');
            },
            child: Icon(
              Icons.notifications_none_rounded,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log out'),
              onTap: () {
                Get.dialog(
                  barrierDismissible: true,
                  Dialog(
                    child: Container(
                      width: 35.w,
                      height: 28.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          colors: [Color(0xFFDFEDFD), Color(0xFF1A8CFF)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize
                              .min, // Ensure the dialog wraps its content
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
                            Text(
                              "Are you sure you want \n to Log out?",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 2.h),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                              child: Text("Log out",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            SizedBox(height: 1.h),
                            ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black26,
                              ),
                              child: Text("Cancel",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Obx(() => pages[bcontroller.currentIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: bcontroller.currentIndex.value,
            onTap: bcontroller.changeIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.logout),
                label: 'Leave',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          )),
    );
  }
}
