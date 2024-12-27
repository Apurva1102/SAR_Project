// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sar_project/controller/teacher_controller/bottom_navigation_controller.dart';
// import 'package:sar_project/screens/teachers/leave_screen.dart';
// import 'package:sar_project/screens/teachers/profile_teacher_screen.dart';
// import 'package:sar_project/screens/teachers/setting_teacher_screen.dart';
// import 'package:sizer/sizer.dart';
// import '../../services/teacher_api_service/teacher_api_services.dart';
// import 'dashboard_teacherContent.dart';
//
// class DashboardTeacher extends StatefulWidget {
//   const DashboardTeacher({super.key});
//
//   @override
//   State<DashboardTeacher> createState() => _DashboardTeacherState();
// }
//
// class _DashboardTeacherState extends State<DashboardTeacher> {
//   final TeacherApiService apiService = TeacherApiService();
//
//   final BottomNavigationController bcontroller =
//       Get.put(BottomNavigationController());
//
//   final List<String> pagesName = [
//     "Welcome",
//     "Leave Section",
//     "Profile",
//     "Setting",
//   ];
//
//   final List<Widget> pages = [
//     DashboardContent(),
//     LeaveScreen(),
//     ProfileTeacherScreen(),
//     const SettingTeacherScreen(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFFDFEDFD), Color(0xFF1A8CFF)],
//               begin: Alignment.bottomCenter,
//               end: Alignment.topCenter,
//             ),
//           ),
//         ),
//         centerTitle: true,
//         title: Obx(() {
//           return Text(
//             pagesName[bcontroller.currentIndex.value],
//             style: const TextStyle(),
//           );
//         }),
//         actions: [
//           InkWell(
//             onTap: () {
//               Get.toNamed('/teacher_notification_screen');
//             },
//             child: const Icon(
//               Icons.notifications_none_rounded,
//               color: Colors.black,
//               size: 30,
//             ),
//           )
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             SizedBox(
//               height: 9.h,
//             ),
//             ListTile(
//               leading: const Icon(
//                 Icons.home,
//                 size: 30,
//               ),
//               title: const Text(
//                 'Home',
//                 style: TextStyle(fontSize: 20),
//               ),
//               onTap: () {
//                 Get.toNamed('/dashboard_teacherContent');
//               },
//             ),
//             ListTile(
//               leading: const Icon(
//                 Icons.settings,
//                 size: 30,
//               ),
//               title: const Text(
//                 'Settings',
//                 style: TextStyle(fontSize: 20),
//               ),
//               onTap: () {
//                 Get.toNamed('/setting_teacher');
//               },
//             ),
//             ListTile(
//               leading: const Icon(
//                 Icons.logout,
//                 size: 30,
//               ),
//               title: const Text(
//                 'Log out',
//                 style: TextStyle(fontSize: 20),
//               ),
//               onTap: () {
//                 Get.dialog(
//                   barrierDismissible: true,
//                   Dialog(
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                         gradient: LinearGradient(
//                           colors: [Color(0xFFDFEDFD), Color(0xFF1A8CFF)],
//                           begin: Alignment.bottomCenter,
//                           end: Alignment.topCenter,
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               "Log Out?",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 14.sp,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 2.h),
//                             const Text(
//                               "Are you sure you want \n to Log out?",
//                               style: TextStyle(color: Colors.black),
//                               textAlign: TextAlign.center,
//                             ),
//                             SizedBox(height: 2.h),
//                             ElevatedButton(
//                               onPressed: () async {
//                                 await apiService.logout();
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue,
//                               ),
//                               child: const Text("Log out",
//                                   style: TextStyle(color: Colors.white)),
//                             ),
//                             SizedBox(height: 1.h),
//                             ElevatedButton(
//                               onPressed: () {
//                                 Get.back();
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.black26,
//                               ),
//                               child: const Text("Cancel",
//                                   style: TextStyle(color: Colors.white)),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Obx(() => pages[bcontroller.currentIndex.value]),
//       bottomNavigationBar: Obx(() => BottomNavigationBar(
//             currentIndex: bcontroller.currentIndex.value,
//             onTap: bcontroller.changeIndex,
//             selectedItemColor: Colors.blue,
//             unselectedItemColor: Colors.black,
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.logout),
//                 label: 'Leave',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: 'Profile',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.settings),
//                 label: 'Settings',
//               ),
//             ],
//           )),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:sar_project/screens/teachers/profile_teacher_screen.dart';
import 'package:sar_project/screens/teachers/setting_teacher_screen.dart';

import '../../constants/main_layout.dart';
import 'dashboard_teacherContent.dart';
import 'leave_screen.dart';

class DashboardTeacher extends StatelessWidget {
  const DashboardTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MainLayout(
        pages: [
          DashboardContent(),
          LeaveScreen(),
          ProfileTeacherScreen(),
          const SettingTeacherScreen(),
        ],
        pagesName: [
          "Welcome",
          "Leave Section",
          "Profile",
          "Setting",
        ],
      ),
    );
  }
}
