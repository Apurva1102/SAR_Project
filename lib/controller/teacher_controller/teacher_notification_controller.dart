import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sar_project/model/teacher_model/teacher_notification_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../config/environment.dart';

class TeacherNotificationController extends GetxController {
  var notificationData = TeacherNotificationModel().obs;
  var isLoading = true.obs;

  final String baseUrl = Environment.baseUrl;

  Future<void> fetchTeacherNotifications() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int teacherId = prefs.getInt('teacher_id') ?? 0;

    if (teacherId == 0) {
      throw Exception('Teacher ID not found in SharedPreferences');
    }

    try {
      isLoading.value = true;
      final response =
          await http.get(Uri.parse('$baseUrl/teacherNotification/$teacherId'));

      print("Fetching Notification data for teacher ID: $teacherId");

      if (response.statusCode == 200) {
        notificationData.value =
            TeacherNotificationModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 404) {
        throw Exception(
            'Notification data not found for teacher ID: $teacherId');
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
