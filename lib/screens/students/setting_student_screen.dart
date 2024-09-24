import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sar_project/controller/dropdown_controller.dart';
import 'package:sar_project/screens/students/student_changepassword.dart';
import 'package:sizer/sizer.dart';
import '../login_screen.dart';

class SettingStudentScreen extends StatefulWidget {
  const SettingStudentScreen({super.key});

  @override
  State<SettingStudentScreen> createState() => _SettingStudentScreenState();
}

class _SettingStudentScreenState extends State<SettingStudentScreen> {

//  final DropdownController dcontroller = Get.put(DropdownController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
      ),
      //body: SingleChildScrollView(
      //  child: Column(
      //    children: [
          //  _buildRow(
          //      "Notification Settings", Icons.keyboard_arrow_down_outlined),
          //  _buildRow("Password Manager", Icons.keyboard_arrow_down_outlined),
          //   Row(
          //    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Icon( Icons.logout),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: TextButton(
          //             onPressed: (){
          //               Get.dialog(barrierDismissible: true,
          //               Dialog(
          //                   child: Container(
          //                     width: 32.w,
          //                     height: 28.h,
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.all(
          //                         Radius.circular(20),
          //                       ),
          //                       gradient: LinearGradient(
          //                         colors: [Color(0xFFDFEDFD), Color(0xFF1A8CFF)],
          //                         end: Alignment.topCenter,
          //                         begin: Alignment.bottomCenter,
          //                       ),
          //                     ),
          //                     child: Padding(
          //                       padding: const EdgeInsets.all(8.0),
          //                       child: Column(
          //                         children: [
          //                           Text("Log Out ?",style: TextStyle(color: Colors.white,fontSize: 14.sp,fontWeight: FontWeight.bold),),
          //                           SizedBox(height: 2.h,),
          //                           Text("Are you sure you want \n   to Log out ?",style: TextStyle(color: Colors.black),),
          //                           SizedBox(height: 2.h,),
          //                           ElevatedButton(onPressed: (){
          //                             Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
          //                           },
          //                               style: ElevatedButton.styleFrom(
          //                                   backgroundColor: Colors.blue
          //                               ),
          //                               child: Text("Log out",style: TextStyle(color: Colors.white),)
          //                           ),
          //                           SizedBox(height: 1.h,),
          //                           ElevatedButton(
          //                               onPressed: (){
          //                                 Get.back();
          //                               },
          //                               style: ElevatedButton.styleFrom(
          //                                 // foregroundColor: Colors.white,
          //                                 backgroundColor: Colors.black26,
          //                               ),
          //                               child: Text("Cancel",style: TextStyle(color: Colors.white))
          //                           )
          //                         ],
          //                       ),
          //                     ),
          //                   )
          //               ));
          //             },
          //             child: Text("Log Out ",style: TextStyle(fontSize: 13.sp,color: Colors.black87),)
          //         ),
          //       )

         //     ],
        //    )
      // ],
      body:
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ExpansionTile(
                title: Text("Notification Setting"),

            ),
            ExpansionTile(
              title: Text("Password Manager"),
              children: [
                ListTile(
                  title: TextButton(onPressed: (){
                    Get.to(StudentChangepassword());
                  },
                      child: Text("Change Password",style: TextStyle(color: Colors.black87,fontSize: 12.sp),)
                  )
                )
              ],
            ),
            // Row(
            //   children: [
            //     _buildRow("Password Manager"),
            //     DropdownButton<String>(
            //       value: dcontroller.selectedValue.value.isNotEmpty &&
            //           <String>['Change password',].contains(dcontroller.selectedValue.value)
            //           ? dcontroller.selectedValue.value
            //           : null, // Use null if the selected value is not in the items
            //       onChanged: (newValue) {
            //         if (newValue != null) {
            //           dcontroller.onSelectedValueChanged(newValue);
            //         }
            //       },
            //       items: <String>['Change Password',]
            //           .map<DropdownMenuItem<String>>((String value) {
            //         return DropdownMenuItem<String>(
            //           value: value,
            //           child: TextButton(onPressed: (){
            //            // Get.toNamed('/student_changepassword');
            //            Get.to(StudentChangepassword());
            //           },
            //               child: Text("Change Password")),
            //         );
            //       }).toList(),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),

    );
  }
  }

