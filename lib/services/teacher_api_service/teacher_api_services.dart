import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../model/teacher_model/teacher_timetable_model.dart';

class TeacherApiService {
  final String baseUrl = 'http://20.235.242.228:5006/fetchTeacherTimetable';

  // Fetch timetable data based on the user ID
  Future<TeacherTimetableModel?> fetchTeacherTimetable(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('userId') ?? 0; // Get user ID from shared preferences
    print("Fetching timetable for teacher: $userId");

    try {
      final response = await http.get(Uri.parse('$baseUrl/$userId'));

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}'); // Log the response body

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return TeacherTimetableModel.fromJson(jsonResponse);
      } else {
        print('Error: Failed to load timetable data. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  // Logout function to clear userId from SharedPreferences
  // Future<void> logout() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('userId'); // Clear the stored user ID
  //   print("UserId cleared on logout");
  //
  //   // Navigate back to login or another appropriate screen after logout
  //   Get.offAllNamed('/login'); // Replace '/login' with your login route
  // }

}
