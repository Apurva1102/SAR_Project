import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Widget MyAppBar() {
  return Scaffold(
    appBar:  AppBar(
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
          'title',
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
  );
}
