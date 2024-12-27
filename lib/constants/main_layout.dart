import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sar_project/controller/teacher_controller/bottom_navigation_controller.dart';
import 'package:sizer/sizer.dart';
import '../controller/teacher_controller/teacher_profile_controller.dart';
import '../services/api_service.dart';

class MainLayout extends StatelessWidget {
  final List<Widget> pages;
  final List<String> pagesName;

  MainLayout({required this.pages, required this.pagesName, Key? key})
      : super(key: key);

  final BottomNavigationController bcontroller =
      Get.put(BottomNavigationController());

  final TeacherProfileController _controller =
      Get.put(TeacherProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
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
            style: const TextStyle(),
          );
        }),
        actions: [
          InkWell(
            onTap: () {
              Get.toNamed('/teacher_notification_screen');
            },
            child: const Icon(
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
            SizedBox(height: 2.h),
            // // Logo or Image at the top of Drawer
            // Image.asset(
            //   'assets/images/sa_logo.png',
            //   height: 10.h,
            //   width: 10.w,
            //   // alignment: Alignment.topLeft,
            // ),
            // final profile = _controller.teacherProfile.value;

            Obx(() {
              if (_controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                final profile = _controller.teacherProfile.value;

                return Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: profile != null &&
                                profile.userPhoto != null
                            ? NetworkImage(
                                'http://20.235.242.228:5006/${profile.userPhoto!}')
                            : null,
                        // backgroundColor: Colors.blue,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            _controller.uploadProfileTeacher();
                          },
                          child: CircleAvatar(
                            radius: 15.0,
                            backgroundColor: Colors.blue,
                            child: const Icon(
                              Icons
                                  .add, // Use Icons.add if you want a plus icon instead
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
            const Divider(),
            // Home Item
            _buildDrawerItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () {
                bcontroller.changeIndex(0); // Navigate to Home
                Navigator.pop(context);
              },
            ),

            // Settings Item
            _buildDrawerItem(
              icon: Icons.settings,
              text: 'Settings',
              onTap: () {
                bcontroller.changeIndex(3); // Navigate to Settings
                Navigator.pop(context);
              },
            ),

            // Logout Item
            _buildDrawerItem(
              icon: Icons.logout,
              text: 'Log out',
              onTap: () => _showLogoutDialog(context),
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
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Leave'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
          )),
    );
  }
}

// Helper widget to create a Drawer item
Widget _buildDrawerItem({
  required IconData icon,
  required String text,
  required GestureTapCallback onTap,
}) {
  return ListTile(
    leading: Icon(icon, size: 30),
    title: Text(text, style: TextStyle(fontSize: 20)),
    onTap: onTap,
  );
}

// Show logout confirmation dialog
void _showLogoutDialog(BuildContext context) {
  final ApiService apiService = ApiService(); // Initialize the service
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFDFEDFD), Color(0xFF1A8CFF)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.sp),
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
              // Log out button
              ElevatedButton(
                onPressed: () async {
                  await apiService.logout();
                  // Navigator.pop(context); // Close the dialog after logging out
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "Log out",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 1.h),
              ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black26,
                ),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    barrierDismissible: true,
  );
}
