// lib/controllers/login_controller.dart
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  final ApiService apiService = Get.put(ApiService());

  Future<void> loginUser(String email, String password) async {
    final body = {
      "userNameOrEmail": email,
      "userPassword": password,
    };

    isLoading.value = true;

    try {
      final response = await apiService.postRequest('/login', body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        final responseBody = response.body;
        if (responseBody['status'] == true) {
          // Extract data from the response
          final data = responseBody['data'] ?? {};
          String? token = data['token'];
          String? userRole = data['userRole'];
          int? userId = data['userId'];
          String? userName = data['userName'];
          String? userNumber = data['userNumber'];
          String? name = data['name'];
          String? className = data['class_name'];
          String? sectionName = data['section_name'];
          int? teachSchoolId = data['teacher_school_id'];
          int? student_id = data['student_id'];
          int? techer_id = data['teacher_id'];

          if (token != null) {
            await processToken(token);
            await storeUserInfo(userId, userName, userNumber, name, className,
                sectionName, teachSchoolId, student_id, techer_id);
            routeBasedOnRole(userRole);
          } else {
            showError('Token not found. Please contact support.');
          }
        } else {
          showError(responseBody['message'] ?? 'Unknown error occurred.');
        }
      } else {
        showError('Invalid login. Please try again.');
      }
    } catch (e) {
      showError('An error occurred during login: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> processToken(String token) async {
    // You can store the token here if needed
    print('Token processed: $token');
  }

  Future<void> storeUserInfo(
      int? userId,
      String? userName,
      dynamic userNumber,
      String? name,
      String? className,
      String? sectionName,
      int? teachSchoolId,
      int? student_id,
      int? teacher_id) async {
    if (userId != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      int parsedUserNumber = 0;
      if (userNumber is int) {
        parsedUserNumber = userNumber;
      } else if (userNumber is String) {
        parsedUserNumber = int.tryParse(userNumber) ?? 0;
      }

      await prefs.setInt('userId', userId);
      await prefs.setString('userName', userName ?? '');
      await prefs.setInt('userNumber', parsedUserNumber);
      await prefs.setString('name', name ?? '');
      await prefs.setString('class_name', className ?? '');
      await prefs.setString('section_name', sectionName ?? '');
      await prefs.setInt('teacher_school_id', teachSchoolId ?? 0);
      await prefs.setInt('student_id', student_id ?? 0);
      await prefs.setInt('teacher_id', teacher_id ?? 0);
      print('Teacher School Id $teachSchoolId');
      print(' UserID $userId');
      print('student_id $student_id');
      print("teacher_id $teacher_id");
      print('User info stored successfully');
    } else {
      print('User ID not found.');
    }
  }

  void routeBasedOnRole(String? userRole) {
    if (userRole == 'teacher' || userRole == 'classTeacher') {
      Get.toNamed('/dashboard_teacher');
    } else if (userRole == 'student') {
      Get.toNamed('/dashboard_student');
    } else {
      showError('User role not recognized. Please contact support.');
    }
  }

  void showError(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
