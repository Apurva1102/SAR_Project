
import 'package:flutter/material.dart';
import 'package:sar_project/screens/teachers/leave_screen.dart';
import 'package:sar_project/screens/teachers/leave_status_screen.dart';

class Demo1 extends StatelessWidget {
  const Demo1({super.key});

  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            // backgroundColor: Colors.lightBlue,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFDFEDFD), Color(0xFF1A8CFF)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            title: const Text(
              'Leave',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            bottom: const TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(color: Colors.white),
                  borderRadius:BorderRadius.all(Radius.circular(10))
              ),
              indicatorPadding: EdgeInsets.all(3),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(text: 'Apply Leave'),
                Tab(text: 'Leave Status'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // NewOrderForm(),
              // RepeatOrder(),
              LeaveScreen(),
              LeaveStatusScreen()
            ],
          ),
        ),
      );
  }
}
