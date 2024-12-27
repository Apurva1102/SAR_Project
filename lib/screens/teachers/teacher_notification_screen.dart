import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../controller/teacher_controller/teacher_notification_controller.dart';

class TeacherNotificationScreen extends StatelessWidget {
  final TeacherNotificationController notificationController = Get.put(
    TeacherNotificationController(),
  );

  TeacherNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    notificationController.fetchTeacherNotifications();

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
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Notification",
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
      body: Obx(() {
        if (notificationController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (notificationController.notificationData.value.message ==
            null) {
          return const Center(child: Text("No notifications available"));
        } else {
          String message =
              notificationController.notificationData.value.message!;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildLectureInfo(message),
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  Widget _buildLectureInfo(
    String message,
  ) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(title, style: TextStyle(fontSize: 12.sp)),
                    const SizedBox(height: 5),
                    Text(
                      message,
                      style: TextStyle(color: Colors.grey, fontSize: 11.sp),
                    ),
                  ],
                ),
              ),
            ),
            // TextButton(
            //   onPressed: () {},
            //   child: Text(
            //     subtitle,
            //     style: TextStyle(color: Colors.blue, fontSize: 13.sp),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
