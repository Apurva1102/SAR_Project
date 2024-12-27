import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../controller/teacher_controller/teacher_leave_controller.dart';

class LeaveStatusScreen extends StatelessWidget {
  final TeacherLeaveController leaveController =
      Get.put(TeacherLeaveController());

  LeaveStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    leaveController.fetchLeaveData();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(() {
          if (leaveController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (leaveController.errorMessage.isNotEmpty) {
            return Center(child: Text(leaveController.errorMessage.value));
          } else if (leaveController.leaveData.isEmpty) {
            return const Center(child: Text('No leave data available.'));
          }

          return ListView.builder(
            itemCount: leaveController.leaveData.length,
            itemBuilder: (context, index) {
              var leave = leaveController.leaveData[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('From: ${leave.dateFrom ?? 'N/A'}',
                            style: TextStyle(fontSize: 11.sp)),
                        Text('To: ${leave.dateTo ?? 'N/A'}',
                            style: TextStyle(fontSize: 11.sp)),
                        Text(
                          ' ${leave.leaveType ?? 'N/A'}',
                          style: TextStyle(fontSize: 11.sp),
                        )
                      ],
                    ),
                    Text(
                      leave.leaveStatus == 0
                          ? 'Rejected'
                          : leave.leaveStatus == 1
                              ? 'Pending'
                              : 'Approved',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: leave.leaveStatus == 0
                            ? Colors.red
                            : leave.leaveStatus == 1
                                ? Colors.orange
                                : Colors.green,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
