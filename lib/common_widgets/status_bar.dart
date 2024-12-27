import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sar_project/controller/teacher_controller/notification_controller.dart';

class StatusBar extends StatelessWidget {
  final SettingController settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
      
        body: Obx(
          () => ListTile(
            title: Text(" Allow Notifications"),
            trailing: Switch(
              value: settingController.isNotificationOn.value,
              onChanged: (value) {
                settingController.toggleNotification();
              },
            ),
          ),
        ),
      ),
    );
  }
}
