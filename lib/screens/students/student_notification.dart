import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../controller/student_controller/student_notification_controller.dart';

class StudentNotification extends StatelessWidget {
  final NotificationController _notificationController =
      Get.put(NotificationController());

  StudentNotification({super.key});

  @override
  Widget build(BuildContext context) {
    _notificationController.fetchNotifications();

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
                "Notification",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        body: Obx(() {
          if (_notificationController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (_notificationController.notificationData.value.messages ==
              null) {
            return const Center(child: Text("No notifications available"));
          } else {
            var messages =
                _notificationController.notificationData.value.messages!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (messages.classMessage != null)
                      _buildLectureInfo(
                        "",
                        messages.classMessage!,
                      ),
                    if (messages.sectionMessage != null)
                      _buildLectureInfo(
                        "",
                        messages.sectionMessage!,
                      ),
                    if (messages.reassignMessage != null)
                      _buildLectureInfo(
                        "",
                        messages.reassignMessage!,
                      ),
                    // if (messages.teacherMessage != null)
                    //   _buildLectureInfo(
                    //       "", messages.teacherMessage!, ),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }

  Widget _buildLectureInfo(
    String title,
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
                    const SizedBox(height: 5),
                    Text(message,
                        style: TextStyle(color: Colors.grey, fontSize: 11.sp)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
