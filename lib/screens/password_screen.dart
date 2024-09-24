import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/login_controller.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {

  final LoginController loginController = Get.put(LoginController());
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  void showAlertBox() {
    Get.dialog(
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Container(
            height: 40.h,
            width: 75.w,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                colors: [Color(0xFFDFEDFD), Color(0xFF1A8CFF)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Ensure the dialog fits content
                  children: [
                    DefaultTextStyle(
                      style: TextStyle(color: Colors.white, fontSize: 16.sp,fontWeight: FontWeight.bold),
                      child: const Text(" Congratulations  🎉"),
                    ),
                    SizedBox(height: 2.h),
                    const Image(image: AssetImage('assets/images/cong.png')),
                    SizedBox(height: 8.h),
                    DefaultTextStyle(
                      style: TextStyle(fontSize: 13.sp, color: Colors.blue[400]),
                      textAlign: TextAlign.center,
                      child: const Text( "Your Password Has been \n changed Successfully",), // Center align the text
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
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Stack(
        children: [
          Image.asset(
            'assets/images/top_gradient.png',
            // fit: BoxFit.cover,
            // height: 27.h,
            // width: 100.w,
          ),
        ],
      ),
      SizedBox(
        height: 3.h,
      ),
      Text(
        "Password",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
      ),
      SizedBox(
        height: 3.h,
      ),
      Form(
          key: loginKey,
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "    Create Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      // controller: loginController.otpController,
                      decoration: const InputDecoration(
                        //  labelText: 'Username',
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                        ),
                        hintText: 'Enter password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      },
                    )),
                SizedBox(height: 2.h,),
                Text(
                  "    Confirm Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                     // controller: loginController.otpController,
                      decoration: const InputDecoration(
                        //  labelText: 'Username',
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                        ),
                        hintText: 'Enter password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(30))),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      },
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: SizedBox(
                    width: 90.w,
                    height: 5.h,
                    child: ElevatedButton(
                        onPressed: () {
                          showAlertBox();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22))),
                        child: Text(
                          "Verify",
                          style:
                              TextStyle(color: Colors.white, fontSize: 14.sp),
                        )),
                  ),
                ),
              ])),
    ])));
  }
}

