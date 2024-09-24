import 'package:get/get.dart';

class DropdownController extends GetxController {
  // Observable string for the leave type dropdown
  var dropdownValue = "Paid Leave".obs;

  // Observable string for the half dropdown
  var dropdownValue2 = "First Half".obs;

  // Observable DateTime for start and end dates
  var startDate = DateTime.now().obs;
  var endDate = DateTime.now().obs;

  // List of options for the leave type dropdown
  List<String> list = <String>["Paid Leave", "Unpaid Leave"];

  // List of options for the half dropdown
  List<String> list1 = <String>["First Half", "Second Half"];

  // Method to update the leave type dropdown value
  void updateValue(String? newValue) {
    if (newValue != null) {
      dropdownValue.value = newValue;
    }
  }

  // Method to update the half dropdown value
  void updateValue2(String? newValue) {
    if (newValue != null) {
      dropdownValue2.value = newValue;
    }
  }

  // Method to update the start date
  void updateStartDate(DateTime date) {
    startDate.value = date;
  }

  // Method to update the end date
  void updateEndDate(DateTime date) {
    endDate.value = date;
  }
}
