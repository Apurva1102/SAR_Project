
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DaysOfWeekController extends GetxController {
  // Observable variable to store the selected day
  var selectedDay = ''.obs;

  // Method to update the selected day
  void selectDay(String day) {
    selectedDay.value = day;
  }
}