import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../model/student_model/student_model.dart';

class StudentApiService {
  final String baseUrl = 'http://192.168.200.30:3005/fetchStudentTimetable';

  Future<StudentModel?> fetchStudentTimetable() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('userId') ?? 0;

    if (userId == 0) {
      print('Error: User ID not found');
      return null;
    }

    final url = Uri.parse('$baseUrl/$userId');
    print("Fetching timetable for student ID: $userId");

    try {
      final response = await http.get(url, headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        return StudentModel.fromJson(json.decode(response.body));
      } else {
        print('Error: ${response.statusCode} - ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('Exception caught: $e');
      return null;
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
    print("User ID cleared on logout");

    Get.offAllNamed('/login');
  }
}
