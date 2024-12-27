import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../controller/student_controller/student_daysofweek_controller.dart';

class DashboardStudentContent extends StatelessWidget {
  DashboardStudentContent({super.key});
  final StudentDaysOfWeekController studentController =
      Get.put(StudentDaysOfWeekController());

  // Mapping of full day names to abbreviations
  final Map<String, String> daysAbbreviations = {
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
                "Timetable",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Get.toNamed('/student_notification');
                  },
                  icon: const Icon(Icons.notifications_none_rounded, size: 30),
                )
              ],
            ),
          ),
        ),
        body: Obx(() {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
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
                      children: daysAbbreviations.keys
                          .map((day) => Expanded(
                                child: _buildDayButton(
                                    day, studentController, daysAbbreviations),
                              ))
                          .toList(),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  ListView.builder(
                    itemCount: studentController.getSelectedDayData().length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final entry = studentController.getSelectedDayData()[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                Colors.primaries[index % Colors.primaries.length],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
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
                                padding: const EdgeInsets.all(14.0),
                                child: Column(
                                  children: [
                                    Text(" ${entry.ttStartTime ?? 'N/A'}",
                                        style:
                                            const TextStyle(color: Colors.white)),
                                    Text(" ${entry.ttEndTime ?? 'N/A'}",
                                        style:
                                            const TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Column(
                                  children: [
                                    Text(entry.ttSubject ?? "",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    Text(entry.ttTeacher ?? "",
                                        style:
                                            const TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                              Text(" ${entry.ttLecture ?? "N/A"}",
                                  style: const TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

Widget _buildDayButton(
  String day,
  StudentDaysOfWeekController controller,
  dynamic daysAbbreviations,
) {
  final daysAbbreviation = daysAbbreviations[day] ?? day;

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
            daysAbbreviation,
            style: TextStyle(
                fontSize: 12.sp,
                color: isSelected ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  });
}
