import 'package:get/get.dart';
import 'package:sar_project/binding/binding.dart';
import 'package:sar_project/screens/students/profile_student_screen.dart';
import 'package:sar_project/screens/students/setting_student_screen.dart';
import 'package:sar_project/screens/students/student_changepassword.dart';
import 'package:sar_project/screens/students/student_notification.dart';
import 'package:sar_project/screens/teachers/dashboard_teacher.dart';
import 'package:sar_project/screens/teachers/leave_screen.dart';
import 'package:sar_project/screens/teachers/profile_teacher_screen.dart';
import 'package:sar_project/screens/teachers/setting_teacher_screen.dart';
import 'package:sar_project/screens/teachers/teacher_changepassword.dart';
import 'package:sar_project/screens/teachers/teacher_notification_screen.dart';
import 'package:sar_project/screens/verification_code_screen.dart';

import '../screens/forgetpass_screen.dart';
import '../screens/login_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/students/dashboard_student.dart';

class AppPages {
  static const INITIAL_ROUTE = '/splash';

  static final routes = [
    GetPage(
      name: '/splash',
      page: () => const SplashScreen(),
      binding: splash_screen(),
    ),
    GetPage(
      name: '/login',
      page: () => const LoginScreen(),
      binding: login_screen(),
    ),
    GetPage(
      name: '/forgetpass',
      page: () => const ForgetpassScreen(),
      binding: forget_pass(),
    ),
    GetPage(
      name: '/verificationcode',
      page: () => const VerificationCodeScreen(),
      binding: verificationcode_screen(),
    ),
    GetPage(
      name: '/dashboard_teacher',
      page: () => const DashboardTeacher(),
      binding: dashboard_teacher(),
    ),
    GetPage(
      name: '/leave_screen',
      page: () => const LeaveScreen(),
      binding: leave_screen(),
    ),
    GetPage(
      name: '/profile_teacher_screen',
      page: () => const ProfileTeacherScreen(),
      binding: profile_teacher_screen(),
    ),
    GetPage(
      name: '/setting_teacher',
      page: () => const SettingTeacherScreen(),
      binding: setting_teacher(),
    ),
    GetPage(
        name: '/teacher_changepassword',
        page: ()=> TeacherChangepassword(),
      binding: student_changepassword(),
    ),
    GetPage(
        name: '/teacher_notification_screen',
        page: ()=> TeacherNotificationScreen(),

    ),
    GetPage(
      name: '/dashboard_student',
      page: () => const DashboardStudent(),
      binding: dashboard_student(),
    ),
    GetPage(
        name: '/profile_student_screen',
        page: () => const ProfileStudentScreen(),
        binding: profile_student_screen()),
    GetPage(
        name: '/setting_student_screen',
        page: () => const SettingStudentScreen(),
        binding: setting_student_screen()),
    GetPage(
        name: '/student_notification',
        page: () => const StudentNotification(),
        binding: student_notification()),
    GetPage(
        name: '/student_changepassword',
        page: () => StudentChangepassword(),
        binding: student_changepassword()),
  ];
}
