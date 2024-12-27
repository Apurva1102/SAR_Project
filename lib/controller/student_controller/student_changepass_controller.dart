import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentChangepassController extends GetxController {
  var isLoading = false.obs;
  var isOldPasswordVisible = false.obs;
  var isNewPasswordVisible = false.obs;

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();

  Future<void> changePassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId'); // Get userId from stored preferences

    if (userId == null) {
      Get.snackbar('Error', 'User ID not found. Please log in again.');
      return;
    }

    final url = 'http://20.235.242.228:5006/changePassword/$userId';
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      "currentPassword": oldPasswordController.text,
      "newPassword": newPasswordController.text,
    });

    isLoading.value = true;

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);

        if (responseBody['status'] == true) {
          Get.snackbar(
            'Success',
            'Password changed successfully!',
            snackPosition: SnackPosition.BOTTOM,
          );
          // Clear text fields after success
          oldPasswordController.clear();
          newPasswordController.clear();
        } else {
          Get.snackbar(
            'Error',
            responseBody['message'] ?? 'Failed to change password.',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } else {
        Get.snackbar(
          'Error',
          'Failed to change password. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred during password change: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
