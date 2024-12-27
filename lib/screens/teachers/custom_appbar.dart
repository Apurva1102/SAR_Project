import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/student_controller/studentprofile_controller.dart';

class CustomAppBar extends StatelessWidget {
  final StudentProfileController controller = Get.put(StudentProfileController());

  CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final studentProfile = controller.studentProfile.value;
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            // bottom: 0.h,
            left: (MediaQuery.of(context).size.width / 2) - 55, // Center the avatar
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 51.0,
                    backgroundImage: studentProfile != null && studentProfile.userPhoto != null
                        ? NetworkImage('http://20.235.242.228:5006/${studentProfile.userPhoto!}')
                        : null,
                    // backgroundColor: Colors.lightBlue,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: controller.uploadProfilePhoto,
                      child: CircleAvatar(
                        radius: 15.0,
                        backgroundColor: Colors.blue,
                        child: const Icon(
                          Icons.add, // Use Icons.add for a plus icon if desired
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
