import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class StudentNotificationStatus extends StatelessWidget {
  const StudentNotificationStatus({super.key});

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
            "Notifications Student",
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Notification on/ off",style: TextStyle(fontSize: 14.sp),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
