import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController extends GetxController {
  var isNotificationOn = false.obs; // Observable boolean

  @override
  void onInit() {
    super.onInit();
    loadNotificationSetting(); // Load the setting on initialization
  }

  // Method to load notification setting
  void loadNotificationSetting() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isNotificationOn.value = prefs.getBool('notification_on') ?? true; // Default is true
  }

  // Method to toggle the setting
  void toggleNotification() async {
    isNotificationOn.value = !isNotificationOn.value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notification_on', isNotificationOn.value);
  }
}
