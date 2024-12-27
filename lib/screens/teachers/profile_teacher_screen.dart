import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../controller/teacher_controller/teacher_profile_controller.dart';

class ProfileTeacherScreen extends StatelessWidget {
  ProfileTeacherScreen({super.key});

  final TeacherProfileController _controller =
      Get.put(TeacherProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (_controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        final profile = _controller.teacherProfile.value;
        return SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 2.h),
              // Center(
              //   child: Stack(
              //     children: [
              //       CircleAvatar(
              //         radius: 50.0,
              //         backgroundImage: profile != null &&
              //                 profile.userPhoto != null
              //             ? NetworkImage(
              //                 'http://20.235.242.228:5006/${profile.userPhoto!}')
              //             : null,
              //         // backgroundColor: Colors.blue,
              //
              //       ),
              //       Positioned(
              //         bottom: 0,
              //         right: 0,
              //         child: GestureDetector(
              //           onTap: () {
              //             _controller.uploadProfileTeacher();
              //           },
              //           child: CircleAvatar(
              //             radius: 15.0,
              //             backgroundColor: Colors.blue,
              //             child: const
              //             Icon(
              //               Icons.add, // Use Icons.add if you want a plus icon instead
              //               color: Colors.white,
              //               size: 20,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 2.h),
              // Other profile details and widgets here

              const Text("    Username"),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: _controller.userName.value,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              const Text("    Name"),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: profile!.name,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              const Text("    Email ID"),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: profile.userEmail,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              const Text("    Contact Number"),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: profile.userNumber,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        );
      }
    }));
  }
}
