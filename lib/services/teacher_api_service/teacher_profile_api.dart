import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../model/teacher_model/teacher_profile_model.dart';

Future<TeacherProfileModel?> fetchProfileTeacherData(int userId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  userId = prefs.getInt('userId') ?? 0; // Get user ID from shared preferences
  final response = await http.get(Uri.parse('http://20.235.242.228:5006/getProfileDetails/userId'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    final results = jsonData['results'] as List;
    if (results.isNotEmpty) {
      return TeacherProfileModel.fromJson(results[0]);
    }
  } else {
    throw Exception('Failed to load teacher profile');
  }
  return null;
}
