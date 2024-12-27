// lib/services/api_service.dart

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/environment.dart';

class ApiService extends GetConnect {
  final String baseUrl = Environment.baseUrl;

  // Common POST request method
  Future<Response> postRequest(String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await post(endpoint, body);
      return response;
    } catch (e) {
      return Response(statusCode: 500, statusText: 'An error occurred: $e');
    }
  }

  // Logout method to clear userId from SharedPreferences and navigate to login screen
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId'); // Clear the stored user ID
    print("UserId cleared on logout");

    // Navigate back to login screen
    Get.offAllNamed('/login'); // Replace '/login' with your login route
  }
}
