import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DropdownController extends GetxController {
  var leaveType = 'Sick Leave'.obs;
  var startDayType = 'Full Day'.obs;
  var endDayType = 'Full Day'.obs;
  var startDate = DateTime.now().obs;
  var endDate = DateTime.now().obs;

  final leaveTypes = ['Sick Leave', 'Casual Leave', 'Annual Leave'];
  final dayTypes = ['Full Day', 'Half Day'];

  String get formattedStartDate => getFormattedDate(startDate.value);
  String get formattedEndDate => getFormattedDate(endDate.value);

  void updateLeaveType(String? newValue) => leaveType.value = newValue!;

  void updateStartDayType(String? newValue) => startDayType.value = newValue!;
  void updateEndDayType(String? newValue) => endDayType.value = newValue!;

  void updateStartDate(DateTime newStartDate) => startDate.value = newStartDate;
  void updateEndDate(DateTime newEndDate) => endDate.value = newEndDate;

  String getFormattedDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  void startDayTypeChange(String? newValue) {
    if (newValue != null) {
      updateStartDayType(newValue);
      // Logic to synchronize day types
      if (newValue == 'Half Day' && startDate.value == endDate.value) {
        updateEndDayType('Half Day');
      } else if (newValue == 'Full Day' && startDate.value == endDate.value) {
        updateEndDayType('Full Day');
      }
    }
  }

  void endDayTypeChange(String? newValue) {
    if (newValue != null) {
      updateEndDayType(newValue);
      // Logic to synchronize day types
      if (newValue == 'Half Day' && startDate.value == endDate.value) {
        updateStartDayType('Half Day');
      } else if (newValue == 'Full Day' && startDate.value == endDate.value) {
        updateStartDayType('Full Day');
      }
    }
  }
}
