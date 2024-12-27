import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../controller/auth_controller.dart';

class ForgetpassScreen extends StatelessWidget {
  ForgetpassScreen({super.key});

  final AuthController authController = Get.put(AuthController());
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Column(children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/top_gradient.png',
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                Text(
                  "Forget Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
                ),
                SizedBox(height: 5.h),
                Form(
                  key: loginKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "    Contact No / Email ID",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: authController.emailController,
                              decoration: const InputDecoration(
                                hintText: 'Enter contact No / Email ID',
                                prefixIcon: Icon(
                                  Icons.person_2,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your email id or contact no";
                                }
                                return null;
                              },
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  authController.sendOtp();
                                },
                                child: Text(
                                  "Resend Again",
                                  style: TextStyle(color: Colors.lightBlue, fontSize: 17),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Obx(() => Center(
                          child: SizedBox(
                            width: 90.w,
                            height: 5.h,
                            child: ElevatedButton(
                              onPressed: () {
                                if (loginKey.currentState!.validate()) {
                                  authController.sendOtp();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(22))),
                              child: authController.isLoading.value
                                  ? CircularProgressIndicator(color: Colors.white)
                                  : Text(
                                "Send",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.sp),
                              ),
                            ),
                          ),
                        )),
                        SizedBox(height: 5.h),
                      ]),
                )
              ]))),
    );
  }
}
