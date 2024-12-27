import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sar_project/screens/students/profile_student_screen.dart';
import 'package:sar_project/screens/students/setting_student_screen.dart';
import 'package:sar_project/screens/students/student_notification.dart';
import '../../controller/student_controller/bottom_nav_student_controller.dart';
import 'dashboardStudentContent.dart';

class DashboardStudent extends StatelessWidget {
   DashboardStudent({super.key});

  final BottomNavStudentController scontroller =
      Get.put(BottomNavStudentController());

  final List<Widget> pages = [
    DashboardStudentContent(),
    StudentNotification(),
    ProfileStudentScreen(),
    SettingStudentScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => pages[scontroller.currentIndex.value]),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              currentIndex: scontroller.currentIndex.value,
              onTap: scontroller.changeIndex,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.black,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_none_rounded),
                  label: 'Notification',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Setting',
                ),
              ],
            )),
      ),
    );
  }
}
