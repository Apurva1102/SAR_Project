import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sizer/sizer.dart';
import '../../controller/daysofweek_controller.dart';
import '../login_screen.dart';

class DashboardContent extends StatelessWidget {
  final DaysOfWeekController controller = Get.put(DaysOfWeekController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Text("Timetable",
                    style: TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 14.sp)),
              ),
              SizedBox(height: 2.h),
              Container(
                height: 6.h,
                width: 80.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildDayButton('Mon', controller),
                    _buildDayButton('Tue', controller),
                    _buildDayButton('Wed', controller),
                    _buildDayButton('Thu', controller),
                    _buildDayButton('Fri', controller),
                    _buildDayButton('Sat', controller),
                    _buildDayButton('Sun', controller),
                  ],
                ),
              ),
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics:
                NeverScrollableScrollPhysics(), // Prevents scrolling conflicts
                itemBuilder: (context, index) {
                  List<MaterialColor> colors = [
                    Colors.red,
                    Colors.blue,
                    Colors.amber,
                    Colors.green,
                    Colors.blueGrey,
                  ];
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      height: 10.h,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: colors[index % colors.length],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("1",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Padding(
                            padding: EdgeInsets.all(22.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("9:30 AM",
                                    style: TextStyle(color: Colors.white)),
                                Text("10:15 AM",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(22.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("English",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Text("Smita Patel",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          Text("Lecture 1",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildDayButton(String day, DaysOfWeekController controller) {
  return Obx(() {
    bool isSelected = controller.selectedDay.value == day;

    return GestureDetector(
      onTap: () {
        controller.selectDay(day);
      },
      child: Container(
        constraints: BoxConstraints(maxHeight: 30),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
              colors: [Color(0xFFDFEDFD), Color(0xFF1A8CFF)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter)
              : null,
          color: !isSelected ? Colors.transparent : null,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
                fontSize: 12.sp,
                color: isSelected ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  });
}