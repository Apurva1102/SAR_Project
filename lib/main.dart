import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sar_project/routes/app_pages.dart';
import 'package:sizer/sizer.dart';
import 'controller/auth_controller.dart';

void main() {
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return GetMaterialApp(
          title: 'SA APP',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          getPages: AppPages.routes,
          initialRoute: AppPages.INITIAL_ROUTE,
          // home: Demo1(),
        );
      },
    );
  }
}
