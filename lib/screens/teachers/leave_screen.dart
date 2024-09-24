import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../controller/dropdown_controller.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({super.key});

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  final DropdownController dropdownController = Get.put(DropdownController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Leave Type', // Title for the dropdown
                  style: TextStyle(
                    fontSize: 14.sp,
                  ), // Customize style
                ),
                SizedBox(height: 1.h),
                Obx(
                  () => Container(
                    width: 90.w, // Set the desired width
                    height: 5.h,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black)),
                    ),
                    child: DropdownButton<String>(
                      underline: SizedBox(), // Remove default underline
                      isExpanded: true, // Expand to fill the container
                      value: dropdownController.dropdownValue.value,
                      items: dropdownController.list
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        dropdownController.updateValue(newValue);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 4.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Start Date",style: TextStyle(fontSize: 14.sp),),
                    Row(
                      children: [
                        Expanded( // Add Expanded here
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.black)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    final DateTime? picked = await showDatePicker(
                                      context: Get.context!,
                                      initialDate: dropdownController.startDate.value,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101),
                                    );
                                    if (picked != null && picked != dropdownController.startDate.value) {
                                      dropdownController.updateStartDate(picked);
                                    }
                                  },
                                  icon: Icon(Icons.calendar_month_outlined),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w,height: 3.h,),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.black)),
                            ),
                            child: Obx(() => DropdownButton<String>(
                              value: dropdownController.dropdownValue2.value,
                              items: dropdownController.list1.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                dropdownController.updateValue2(newValue);
                              },
                              isExpanded: true, // Make dropdown fill the width
                              underline: SizedBox.shrink(), // Remove default underline
                            )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("End Date",style: TextStyle(fontSize: 14.sp),),
                        Row(
                          children: [
                            Expanded( // Add Expanded here
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.black)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () async {
                                        final DateTime? picked = await showDatePicker(
                                          context: Get.context!,
                                          initialDate: dropdownController.endDate.value,
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2101),
                                        );
                                        if (picked != null && picked != dropdownController.endDate.value) {
                                          dropdownController.updateStartDate(picked);
                                        }
                                      },
                                      icon: Icon(Icons.calendar_month_outlined),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w,height: 3.h,),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.black)),
                                ),
                                child: Obx(() => DropdownButton<String>(
                                  value: dropdownController.dropdownValue2.value,
                                  items: dropdownController.list1.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    dropdownController.updateValue2(newValue);
                                  },
                                  isExpanded: true, // Make dropdown fill the width
                                  underline: SizedBox.shrink(), // Remove default underline
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 3.h,),
                        TextFormField(
                          decoration:InputDecoration(
                            hintText: "Type a note",
                            hintStyle: TextStyle(fontSize: 12.sp),
                            labelText: "Reason for Leave",
                            labelStyle: TextStyle(fontSize: 14.sp),
                          )
                        )
                      ],
                    )
                  ],
                ),
                 ],
               )
          )],
            ),
          )
    );
  }
}
