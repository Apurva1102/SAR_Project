import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DatePickerController extends GetxController {
  var startDate = DateTime.now().obs;
  var endDate = DateTime.now().obs;

  // Separate controllers for start and end dates
  var startDateController = TextEditingController();
  var endDateController = TextEditingController();

  @override
  void onInit() {
    // Initialize text fields with current dates
    startDateController.text = DateFormat('MM/dd/yyyy').format(startDate.value);
    endDateController.text = DateFormat('MM/dd/yyyy').format(endDate.value);
    super.onInit();
  }

  // Function to select start date
  void selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != startDate.value) {
      startDate.value = picked;
      startDateController.text = DateFormat('MM/dd/yyyy').format(picked);
    }
  }

  // Function to select end date
  void selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != endDate.value) {
      endDate.value = picked;
      endDateController.text = DateFormat('MM/dd/yyyy').format(picked);
    }
  }
}
