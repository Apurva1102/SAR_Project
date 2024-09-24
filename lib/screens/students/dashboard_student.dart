import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sar_project/screens/students/profile_student_screen.dart';
import 'package:sar_project/screens/students/setting_student_screen.dart';
import 'package:sar_project/screens/students/student_notification.dart';
import 'package:sizer/sizer.dart';
import '../../controller/bottom_nav_student_controller.dart';
import '../../controller/daysofweek_controller.dart';

class DashboardStudent extends StatefulWidget {
  const DashboardStudent({super.key});

  @override
  State<DashboardStudent> createState() => _DashboardStudentState();
}

class _DashboardStudentState extends State<DashboardStudent> {

  final BottomNavStudentController scontroller =  Get.put(BottomNavStudentController());


  // final List<String> pagesName = [
  //   "Timetable",
  //   "Notification",
  //   "",
  //   "Setting",
  // ];

  final List<Widget> pages = [
    DashboardStudentContent(),
    StudentNotification(),
    ProfileStudentScreen(),
    SettingStudentScreen(),
  ];

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         colors: [Color(0xFFDFEDFD), Color(0xFF1A8CFF)],
      //         begin: Alignment.bottomCenter,
      //         end: Alignment.topCenter,
      //       ),
      //     ),
      //   ),
      //  centerTitle: true,
        // title: Obx(() {
        //   return Text(
        //     pagesName[scontroller.currentIndex.value],
        //     style: TextStyle(),
        //   );
        // }),
        // actions: [
        //   InkWell(
        //     onTap: () {
        //       // print("object");
        //       Get.toNamed('/student_notification');
        //     //  Get.toNamed('/teacher_notification_screen');
        //     },
        //     child: Icon(
        //       Icons.notifications_none_rounded,
        //       color: Colors.black,
        //       size: 30,
        //     ),
        //   )
        // ],
    //  ),
      body: Obx(() => pages[scontroller.currentIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: scontroller.currentIndex.value,
        onTap: scontroller.changeIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_rounded),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      )),
    );
  }
}

class DashboardStudentContent extends StatelessWidget {

  final DaysOfWeekController controller = Get.put(DaysOfWeekController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFDFEDFD), Color(0xFF1A8CFF)],
              end: Alignment.topCenter,
              begin: Alignment.bottomCenter,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu, size: 30),
                Text(
                  "Timetable",
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                ),
               // Icon(Icons.notifications_none_rounded, size: 30),
                 IconButton(onPressed: (){
                   Get.toNamed( '/student_notification');
                 },
                     icon: Icon(Icons.notifications_none_rounded,size: 30,)
                 )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
       // scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 2.h,),
            Container(
              height: 6.h,
              width: 80.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildDayButton('Mon', controller),
                  _buildDayButton('Tue', controller),
                  _buildDayButton('Wed', controller),
                  _buildDayButton('Thu', controller),
                  _buildDayButton('Fri', controller),
                  _buildDayButton('Sat', controller),
                  _buildDayButton('Sun', controller),
                ],
              ),
            ),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // Prevents scrolling conflicts
              itemBuilder: (context, index) {
                List<MaterialColor> color = [
                  Colors.red,
                  Colors.blue,
                  Colors.amber,
                  Colors.green,
                  Colors.blueGrey,
                  Colors.red,
                ];
                return Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Container(
                    width: 10.w,
                    height: 10.h,
                    margin: EdgeInsets.symmetric(vertical: 8), // Add some spacing
                    decoration: BoxDecoration(
                      color: color[index] ,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    alignment: Alignment.center, // Centering the text
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("1", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: Colors.white)),
                        Padding(
                          padding: EdgeInsets.all(22.0),
                          child: Column(
                            children: [
                              Text("9 : 30 AM", style: TextStyle(color: Colors.white)),
                              Text( "10 : 15 AM", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(22.0),
                          child: Column(
                            children: [
                              Text("English",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                              Text("Smita Patel", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        Text("Lecture 1", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
Widget _buildDayButton(String day, DaysOfWeekController controller) {
  return Obx(() {
    bool isSelected = controller.selectedDay.value == day;

    return GestureDetector(
      onTap: () {
        controller.selectDay(day);
      },
      child: Container(
        constraints: BoxConstraints(maxHeight: 30),
        decoration: BoxDecoration(
          gradient: isSelected ? LinearGradient(colors: [Color(0xFFDFEDFD), Color(0xFF1A8CFF)], begin: Alignment.bottomCenter, end: Alignment.topCenter) : null,
          color: !isSelected ? Colors.transparent : null,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Center(
          child: Text(
            day,
            style: TextStyle(fontSize: 12.sp, color: isSelected ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  });
}