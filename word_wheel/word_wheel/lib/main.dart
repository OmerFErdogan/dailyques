import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:word_wheel/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     
      theme: ThemeData(
       appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 32)
       )
      ),
      home: HomePage(),
    );
  }
}

