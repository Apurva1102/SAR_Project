import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sar_project/controller/auth_controller.dart';
import 'package:sizer/sizer.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController());
  final AuthController authController = Get.put(AuthController());
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  bool? value = false;

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
          SizedBox(
            height: 3.h,
          ),
          Text(
            "Log In",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
          ),
          SizedBox(
            height: 3.h,
          ),
          Form(
              key: loginKey,
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "    Username",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: authController.usernameController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your username',
                      prefixIcon: Icon(
                        Icons.person_2,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your username";
                      }
                      return null;
                    },
                  ),
                ),
                Text(
                  "   Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => TextFormField(
                      controller: authController.passwordController,
                      obscureText: !authController.isPasswordVisible.value,
                      decoration: InputDecoration(
                        // Removed const keyword
                        prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(
                            authController.isPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            authController.togglePasswordVisibility();
                          },
                        ),
                        hintText: 'Enter password',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed('forgetpass');
                        },
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(color: Colors.lightBlue, fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Obx(
                  () => Center(
                    child: SizedBox(
                      width: 90.w,
                      height: 5.h,
                      child: loginController.isLoading.value
                          ? SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: Container(
                                alignment: Alignment.center,
                                child:
                                    CircularProgressIndicator(strokeWidth: 2.0),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                if (loginKey.currentState!.validate()) {
                                  loginController.loginUser(
                                    authController.usernameController
                                        .text, // Access through authController
                                    authController.passwordController.text,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(22))),
                              child: Text(
                                "Log in",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.sp),
                              )),
                    ),
                  ),
                )
              ]))
        ]),
      )),
    );
  }
}
