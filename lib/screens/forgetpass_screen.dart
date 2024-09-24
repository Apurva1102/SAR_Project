import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sar_project/screens/verification_code_screen.dart';
import 'package:sizer/sizer.dart';

import '../controller/login_controller.dart';

class ForgetpassScreen extends StatefulWidget {
  const ForgetpassScreen({super.key});

  @override
  State<ForgetpassScreen> createState() => _ForgetpassScreenState();
}

class _ForgetpassScreenState extends State<ForgetpassScreen> {

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
          // fit: BoxFit.fitWidth,
          // height: 20.h,
          // width: 100.w,
        ),
        ],
      ),
      SizedBox(
        height: 3.h,
      ),
      Text(
        "Forget Password",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
      ),
      SizedBox(
        height: 5.h,
      ),
          Form(
            key: loginKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "    Conatct No / Email ID",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: loginController.emailController,
                        decoration: const InputDecoration(
                          //  labelText: 'Username',
                          hintText: 'Enter conatct No / Email ID',
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
                      )
              ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                        //    Get.to(ForgetpassScreen());
                          },
                          child: Text(
                            "Resend Again",
                            style:
                            TextStyle(color: Colors.lightBlue, fontSize: 17),
                          ),
                        ),
                      ),
                    ],
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
                            Get.to(VerificationCodeScreen());
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22))),
                          child: Text(
                            "Send",
                            style:
                            TextStyle(color: Colors.white, fontSize: 14.sp),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
    ]),
    )
    ])));
  }
}
