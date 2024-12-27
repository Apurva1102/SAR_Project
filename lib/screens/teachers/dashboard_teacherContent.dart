import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../controller/teacher_controller/daysofweek_controller.dart';

class DashboardContent extends StatelessWidget {
  DashboardContent({super.key});

  final DaysOfWeekController controller = Get.put(DaysOfWeekController());

  final Map<String, String> dayAbbreviations = {
    'Monday': 'Mon',
    'Tuesday': 'Tue',
    'Wednesday': 'Wed',
    'Thursday': 'Thu',
    'Friday': 'Fri',
    'Saturday': 'Sat',
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 2.h),
                Container(
                  height: 5.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Row(
                    children: dayAbbreviations.keys
                        .map((day) => Expanded(
                              child: _buildDayButton(day),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(height: 2.h),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final selectedDayData = controller.getSelectedDayData();
      
                  if (selectedDayData.isEmpty) {
                    return const Center(
                        child: Text(
                            "No timetable data available for the selected day."));
                  }
                  return ListView.builder(
                    itemCount: selectedDayData.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final data = selectedDayData[index];
                      final colors = [Colors.blueAccent, Colors.deepOrangeAccent];
                      final color = colors[index % colors.length];
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("${index + 1}",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(" ${data.ttStartTime ?? 'N/A'}",
                                          style: const TextStyle(
                                              color: Colors.white)),
                                      Text(" ${data.ttEndTime ?? 'N/A'}",
                                          style: const TextStyle(
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(data.ttClassSection ?? 'N/A',
                                          style: const TextStyle(
                                              color: Colors.white)),
                                      Text(data.ttSubject ?? 'N/A',
                                          style: const TextStyle(
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                                Text(data.ttLecture ?? 'N/A',
                                    style: const TextStyle(color: Colors.white)),
                              ],
                            ),
                          ));
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDayButton(String day) {
    final dayAbbreviation = dayAbbreviations[day] ?? day;

    return Obx(() {
      bool isSelected = controller.selectedDay.value == day;

      return GestureDetector(
        onTap: () {
          controller.selectDay(day);
        },
        child: Container(
          constraints: const BoxConstraints(maxHeight: 30),
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
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
              dayAbbreviation,
              style: TextStyle(
                  fontSize: 12.sp,
                  color: isSelected ? Colors.white : Colors.black),
            ),
          ),
        ),
      );
    });
  }
}
