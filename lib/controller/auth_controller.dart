import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/password_screen.dart';
import '../screens/verification_code_screen.dart';

class AuthController extends GetxController {
  var isPasswordVisible = false.obs;
  var isLoading = false.obs;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController newpasswordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  // Send OTP to user's email or contact number
  Future<void> sendOtp() async {
    if (emailController.text.isEmpty) {
      Get.snackbar("Error", "Please enter your email or contact number",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
      return;
    }

    isLoading.value = true;
    final url = Uri.parse('http://192.168.200.30:3005/sendCode');
    final body = jsonEncode({'email_phone': emailController.text});
    print("Sending OTP to email/contact: ${emailController.text}"); // Debugging line

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200) {
        await saveEmailToPreferences(emailController.text);
        Get.snackbar("Success", "OTP sent successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.7),
            colorText: Colors.white);
        Get.to(() => VerificationCodeScreen());
      } else {
        print("Failed to send OTP: ${response.body}");
        Get.snackbar("Error", "Failed to send OTP. Please try again.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.withOpacity(0.7),
            colorText: Colors.white);
      }
    } catch (e) {
      print("Exception occurred while sending OTP: $e");
      Get.snackbar("Error", "Failed to connect to the server.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  // Verify OTP entered by the user
  Future<void> verifyOtp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final emailPhone = prefs.getString('email') ?? '';

    if (otpController.text.isEmpty) {
      Get.snackbar("Error", "Please enter the verification code",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
      return;
    }

    isLoading.value = true;
    final url = Uri.parse('http://192.168.200.30:3005/verifyCode');
    final body = jsonEncode({'email_phone': emailPhone, 'enteredCode': otpController.text});

    print("Verifying OTP for email/contact: $emailPhone with code: ${otpController.text}");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200) {
        Get.snackbar("Success", "OTP verified successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.7),
            colorText: Colors.white);
        Get.to(() => PasswordScreen()); // Navigate to password creation screen
      } else {
        print("OTP verification failed: ${response.body}");
        Get.snackbar("Error", "Invalid verification code. Please try again.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.withOpacity(0.7),
            colorText: Colors.white);
      }
    } catch (e) {
      print("Exception occurred while verifying OTP: $e");
      Get.snackbar("Error", "Failed to connect to the server.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updatePassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final emailPhone = prefs.getString('email') ?? '';

    // Validation for empty fields
    if (newpasswordController.text.isEmpty || confirmpasswordController.text.isEmpty) {
      print("Validation failed: One or both password fields are empty");
      Get.snackbar("Error", "Please fill in all fields",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
      return;
    }

    // Validation for mismatched passwords
    if (newpasswordController.text != confirmpasswordController.text) {
      print("Validation failed: Passwords do not match");
      Get.snackbar("Error", "Passwords do not match",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
      return;
    }

    isLoading.value = true;
    final url = Uri.parse('http://192.168.200.30:3005/updatePassword');
    final body = jsonEncode({
      'email_phone': emailPhone,
      'newPassword': newpasswordController.text
    });
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Password updated successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.7),
            colorText: Colors.white);
        print("success: ${response.body}");
        // Get.back();
      } else {
        print("Failed to update password: ${response.body}");
        Get.snackbar("Error", "Failed to update password. Please try again.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.withOpacity(0.7),
            colorText: Colors.white);
      }
    } catch (e) {
      print("Exception occurred while updating password: $e");
      Get.snackbar("Error", "Failed to connect to the server.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveEmailToPreferences(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
