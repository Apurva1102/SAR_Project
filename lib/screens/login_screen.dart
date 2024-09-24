import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sar_project/screens/forgetpass_screen.dart';
import 'package:sizer/sizer.dart';

import '../controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          "Log In",
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
                    "    Username",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: loginController.usernameController,
                      decoration: const InputDecoration(
                        //  labelText: 'Username',
                        hintText: 'Enter your username',
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
                    child: TextFormField(
                      controller: loginController.passwordController,
                      decoration: const InputDecoration(
                          // labelText: 'Password',
                        prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                            color: Colors.grey,
                          ),
                          hintText: 'Enter password',
                          // suffixIcon: Icon(FontAwesomeIcons.eye),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                          Get.to(ForgetpassScreen());
                          },
                          child: Text(
                            "Forgot password?",
                            style:
                                TextStyle(color: Colors.lightBlue, fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Center(
                    child: SizedBox(
                      width: 90.w,
                      height: 5.h,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed('/dashboard_teacher');
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22))),
                          child: Text(
                            "Log in",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.sp),
                          )),
                    ),
                  ),
                ]
            )
        )
      ]),
    ));
  }
}
