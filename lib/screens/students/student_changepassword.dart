import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

class StudentChangepassword extends StatelessWidget {
  const StudentChangepassword({super.key});

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
      appBar: AppBar(
        title: Text("Change Password  Student"),
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
               //   mainAxisSize: MainAxisSize.min, // Makes sure the Column takes only the needed height
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
              child: TextFormField(
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                  hintText: 'Enter old password',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
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
            SizedBox(height: 2.h,),
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
              child: TextFormField(
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                  hintText: 'Enter new password',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
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
            SizedBox(height: 4.h),
            Center(
              child: SizedBox(
                width: 50.w,
                height: 5.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: TextButton(
                    onPressed: (){
                      showAlertBox();
                    },
                      child:Text('Update Password',style: TextStyle(color: Colors.white),)

                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
