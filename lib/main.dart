import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';
// ignore: unused_import
import 'modules/auth/views/login_view.dart';
// ignore: unused_import
import 'modules/home/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mobile Inventory",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
    );
  }
}
