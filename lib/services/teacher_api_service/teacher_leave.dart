import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../config/environment.dart';
import '../../model/teacher_model/teacher_leave_model.dart';

class LeaveService {
  final String baseUrl = Environment.baseUrl;

  Future<LeaveTeacherModel?> fetchLeaves() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('userId') ?? 0;

    if (userId == 0) {
      throw Exception('User ID not found in SharedPreferences');
    }

    final response = await http.get(Uri.parse('$baseUrl/showTeacherLeaves/$userId'));

    print("Fetching Leave Status for user ID: $userId");

    if (response.statusCode == 200) {
      return LeaveTeacherModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception('Leave data not found for user ID: $userId');
    } else {
      throw Exception('Failed to load leave data: ${response.statusCode}');
    }
  }
}
