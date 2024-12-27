import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sar_project/screens/teachers/leave_status_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../controller/dropdown_controller.dart';
import '../../controller/teacher_controller/date_controller.dart';
import '../../services/api_service.dart';

class LeaveScreen extends StatelessWidget {
  LeaveScreen({super.key});

  final DropdownController dropdownController = Get.put(DropdownController());
  final TextEditingController reasonController = TextEditingController();
  final datePickerController = Get.put(DatePickerController());
  final ApiService apiService = ApiService();

  int teachSchoolId = 0;
  int userId = 0;

  Future<void> submitLeaveRequest() async {
    // Validate that start date is not after end date
    if (dropdownController.startDate.value.isAfter(dropdownController.endDate.value)) {
      Get.snackbar('Error', 'End date cannot be before start date',
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }

    // Validate that reason for leave is not empty
    if (reasonController.text.isEmpty) {
      Get.snackbar('Error', 'Fill all details',
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('userId') ?? 0;
    teachSchoolId = prefs.getInt('teacher_school_id') ?? 0;

    final leaveData = {
      'leaveType': dropdownController.leaveType.value,
      'dateFrom': dropdownController.formattedStartDate,
      'fromDayType': dropdownController.startDayType.value,
      'dateTo': dropdownController.formattedEndDate,
      'toDayType': dropdownController.endDayType.value,
      'reason': reasonController.text,
    };

    final endpoint = '/storeLeave/$userId/$teachSchoolId';
    final response = await apiService.postRequest(endpoint, leaveData);

    if (response.statusCode == 200) {
      Get.snackbar('Success', 'Leave request submitted successfully',
          backgroundColor: Colors.green);
    } else {
      Get.snackbar('Error', response.statusText ?? 'An error occurred',
          backgroundColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Two tabs
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 2.h,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
                   gradient: const LinearGradient(
                  colors: [Color(0xFFDFEDFD), Color(0xFF1A8CFF)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
                   ),
              borderRadius: BorderRadius.circular(10),
            ),
            indicatorPadding: const EdgeInsets.all(3),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black,
            tabs: const [
              Tab(text: 'Apply Leave'),
              Tab(text: 'Leave Status'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Leave Type',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.bold)),
                      SizedBox(height: 1.h),
                      Obx(() => Container(
                        width: 90.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: DropdownButton<String>(
                          underline: const SizedBox(),
                          isExpanded: true,
                          value: dropdownController.leaveType.value,
                          items: dropdownController.leaveTypes
                              .map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                          onChanged: dropdownController.updateLeaveType,
                        ),
                      )),
                      SizedBox(height: 1.h),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 2.h),
                            _buildDateSection(
                              context: context,
                              label: 'Start Date',
                              date: dropdownController.startDate,
                              dayType: dropdownController.startDayType,
                              onDateChanged:
                              dropdownController.updateStartDate,
                              onDayTypeChanged: (newValue) =>
                                  dropdownController
                                      .startDayTypeChange(newValue),
                              dateController:
                              datePickerController.startDateController,
                            ),
                            SizedBox(height: 2.h),
                            _buildDateSection(
                              context: context,
                              label: 'End Date',
                              date: dropdownController.endDate,
                              dayType: dropdownController.endDayType,
                              onDateChanged: dropdownController.updateEndDate,
                              onDayTypeChanged: (newValue) =>
                                  dropdownController.endDayTypeChange(newValue),
                              dateController:
                              datePickerController.endDateController,
                            ),
                            SizedBox(height: 5.h),
                            Text('Reason for Leave',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 1.h),
                            TextFormField(
                              controller: reasonController,
                              decoration: InputDecoration(
                                  hintText: "Type a note",
                                  hintStyle: TextStyle(fontSize: 12.sp),
                                  labelStyle: TextStyle(fontSize: 14.sp),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(2)))),
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 12.h,
                                  child: ElevatedButton(
                                    onPressed: submitLeaveRequest,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.elliptical(5, 5))),
                                    ),
                                    child: const Text(
                                      'Apply',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ]),
              ),
            ),
            LeaveStatusScreen(),
          ],
        ),
      ),
    );
  }
}

Widget _buildDateSection({
  required BuildContext context,
  required String label,
  required Rx<DateTime> date,
  required Rx<String> dayType,
  required void Function(DateTime) onDateChanged,
  required void Function(String?) onDayTypeChanged,
  required TextEditingController dateController,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: TextStyle(fontSize: 14.sp)),
      Row(
        children: [
          SizedBox(
            width: 40.w,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black)),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: DateFormat('MM/dd/yyyy').format(date.value),
                    suffixIcon: const Icon(Icons.calendar_month),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2)))),
                controller: dateController,
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: date.value,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null && pickedDate != date.value) {
                    date.value = pickedDate;
                    onDateChanged(pickedDate);
                    dateController.text =
                        DateFormat('MM/dd/yyyy').format(pickedDate);
                  }
                },
              ),
            ),
          ),
          SizedBox(width: 10.w, height: 3.h),
          Expanded(
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: Obx(() => DropdownButton<String>(
                value: dayType.value,
                items: ['Full Day', 'Half Day']
                    .map((value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
                    .toList(),
                onChanged: onDayTypeChanged,
                isExpanded: true,
                underline: const SizedBox.shrink(),
              )),
            ),
          ),
        ],
      ),
    ],
  );
}
