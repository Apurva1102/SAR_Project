import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sar_project/controller/student_controller/student_changepass_controller.dart';
import 'package:sizer/sizer.dart';

class StudentChangepassword extends StatelessWidget {
   StudentChangepassword({super.key});

  final StudentChangepassController studentChangepassController =
      Get.put(StudentChangepassController());

  final _formKey = GlobalKey<FormState>();

  void showAlertBox() {
    Get.dialog(
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                colors: [Color(0xFFDFEDFD), Color(0xFF1A8CFF)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize:
                    MainAxisSize.min,
                children: [
                  DefaultTextStyle(
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                    child: const Text("Congratulations 🎉"),
                  ),
                  SizedBox(height: 2.h),
                  const Image(image: AssetImage('assets/images/cong.png')),
                  SizedBox(height: 8.h),
                  DefaultTextStyle(
                    style: TextStyle(fontSize: 13.sp, color: Colors.blue[400]),
                    textAlign: TextAlign.center,
                    child: const Text(
                        "Your Password Has been \nchanged Successfully"),
                  ),
                ],
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFDFEDFD), Color(0xFF1A8CFF)],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
              ),
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text(
                "Change Password Student",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Form(
              key: _formKey,
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
                        controller:
                            studentChangepassController.oldPasswordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              studentChangepassController
                                      .isOldPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              studentChangepassController.isOldPasswordVisible
                                  .toggle();
                            },
                          ),
                          hintText: 'Enter old password',
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                        obscureText: !studentChangepassController
                            .isOldPasswordVisible.value,
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
                        controller:
                            studentChangepassController.newPasswordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              studentChangepassController
                                      .isNewPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              studentChangepassController.isNewPasswordVisible
                                  .toggle();
                            },
                          ),
                          hintText: 'Enter new password',
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                        obscureText: !studentChangepassController
                            .isNewPasswordVisible.value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your new password";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Center(
                    child: Obx(() {
                      return studentChangepassController.isLoading.value
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              width: 50.w,
                              height: 5.h,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    studentChangepassController
                                        .changePassword()
                                        .then((_) {});
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                ),
                                child: const Text(
                                  'Update Password',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                    }),
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
