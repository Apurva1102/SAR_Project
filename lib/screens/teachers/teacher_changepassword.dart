import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../controller/teacher_controller/teacher_changepass_controller.dart';

class TeacherChangepassword extends StatelessWidget {
  final TeacherChangepassController teacherChangepassController = Get.put(TeacherChangepassController());

  void showAlertBox(bool isSuccess) {
    Get.dialog(
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Container(
            height: 40.h,
            width: 75.w,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                colors: isSuccess
                    ? [const Color(0xFFDFEDFD), const Color(0xFF1A8CFF)]
                  : [const Color(0xFFDFEDFD), const Color(0xFF1A8CFF)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DefaultTextStyle(
                      style: TextStyle(
                        color: isSuccess ? Colors.white : Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Text(isSuccess
                          ? " Congratulations  🎉"
                          : "Oops !"),
                    ),
                    SizedBox(height: 2.h),
                    Image(
                      image: AssetImage(isSuccess
                          ? 'assets/images/cong.png'
                          : 'assets/images/error.png'), // Replace with your error image path
                    ),
                    SizedBox(height: 8.h),
                    DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: isSuccess ? Colors.blue[400] : Colors.white,
                      ),
                      textAlign: TextAlign.center,
                      child: Text(isSuccess
                          ? "Your Password Has been \n changed Successfully"
                          : " Your Password Has\n Not Changed"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFDFEDFD), Color(0xFF1A8CFF)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "Change Password",
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
      
        body: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Old Password",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                          () => TextFormField(
                        controller: teacherChangepassController.oldPasswordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              teacherChangepassController.isOldPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              teacherChangepassController.isOldPasswordVisible.toggle();
                            },
                          ),
                          hintText: 'Enter old password',
                          prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                        obscureText: !teacherChangepassController.isOldPasswordVisible.value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your old password";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "New Password",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                          () => TextFormField(
                        controller: teacherChangepassController.newPasswordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              teacherChangepassController.isNewPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              teacherChangepassController.isNewPasswordVisible.toggle();
                            },
                          ),
                          hintText: 'Enter new password',
                          prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                        obscureText: !teacherChangepassController.isNewPasswordVisible.value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your new password";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Center(
                    child: SizedBox(
                      width: 55.w,
                      height: 5.h,
                      child: Obx(() => teacherChangepassController.isLoading.value
                          ? const Center(child: CircularProgressIndicator()) // Show loading indicator
                          : ElevatedButton(
                        onPressed: () {
                          if (teacherChangepassController.oldPasswordController.text.isNotEmpty &&
                              teacherChangepassController.newPasswordController.text.isNotEmpty) {
                            teacherChangepassController.changePasswordTeacher().then((_) {
                             // showAlertBox(true);
                            });
                          } else {
                            Get.snackbar(
                              'Error',
                              'Please fill all fields',
                              snackPosition: SnackPosition.BOTTOM,
                            );
                            // showAlertBox(false);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                        child: const Text("Update Password", style: TextStyle(color: Colors.white)),
                      ),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
