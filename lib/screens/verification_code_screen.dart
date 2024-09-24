import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sar_project/screens/password_screen.dart';
import 'package:sizer/sizer.dart';
import '../controller/login_controller.dart';


class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {

  final LoginController loginController = Get.put(LoginController());
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

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
        "Verification Code",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
      ),
      SizedBox(
        height: 3.h,
      ),
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
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: loginController.otpController,
                        decoration: const InputDecoration(
                          //  labelText: 'Username',
                          suffixIcon: Icon(Icons.remove_red_eye,color: Colors.grey,),
                          hintText: 'Enter verification code',
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
                            return "Please enter your verification code";
                          }
                          return null;
                        },
                      )
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: SizedBox(
                      width: 90.w,
                      height: 5.h,
                      child: ElevatedButton(
                          onPressed: () {
                          Get.to(PasswordScreen());
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
                  SizedBox(
                    height: 5.h,
                  ),
    ])
    )
    ])),
    );
  }
}
