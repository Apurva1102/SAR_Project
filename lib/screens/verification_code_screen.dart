import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../controller/auth_controller.dart';

class VerificationCodeScreen extends StatelessWidget {
  VerificationCodeScreen({super.key});

  final AuthController authController = Get.put(AuthController());
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
              () => SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset('assets/images/top_gradient.png'),
                  ],
                ),
                SizedBox(height: 3.h),
                Text(
                  "Verification Code",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                ),
                SizedBox(height: 3.h),
                Form(
                  key: loginKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "    Verification Code",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: authController.otpController,
                          decoration: const InputDecoration(
                            hintText: 'Enter verification code',
                            prefixIcon: Icon(Icons.lock, color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your verification code";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Center(
                        child: SizedBox(
                          width: 90.w,
                          height: 5.h,
                          child: ElevatedButton(
                            onPressed: () {
                              if (loginKey.currentState!.validate()) {
                                authController.verifyOtp();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22),
                              ),
                            ),
                            child: authController.isLoading.value
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text(
                              "Verify",
                              style: TextStyle(color: Colors.white, fontSize: 14.sp),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
