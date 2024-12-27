import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../config/environment.dart';
import '../../model/student_model/student_notification_model.dart';

class NotificationController extends GetxController {
  var notificationData = StudentNotificationModel().obs;
  var isLoading = true.obs;

  final String baseUrl = Environment.baseUrl;

  Future<void> fetchNotifications() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int studentId = prefs.getInt('student_id') ?? 0;

    if (studentId == 0) {
      throw Exception('User ID not found in SharedPreferences');
    }

    try {
      isLoading.value = true;
      final response =
          await http.get(Uri.parse('$baseUrl/studentNotification/$studentId'));

      print("Fetching Notification data for student ID: $studentId");

      if (response.statusCode == 200) {
        notificationData.value =
            StudentNotificationModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 404) {
        throw Exception(
            'Notification data not found for student ID: $studentId');
      } else {
        throw Exception(
            'Failed to load notification data: ${response.statusCode}');
      }
    } catch (e) {
      print("Error: $e");
      throw Exception('Failed to load notification data');
    } finally {
      isLoading.value = false;
    }
  }
}
