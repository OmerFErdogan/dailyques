
import 'package:daily_ques/data/get_controllers.dart';
import 'package:daily_ques/data/routing/get_pages.dart';
import 'package:daily_ques/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

Future<void> main() async{
  await getControllers();
}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    main();
    return GetMaterialApp(
      theme:ThemeData(appBarTheme: const AppBarTheme(backgroundColor: Colors.red)) ,
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      home:  LoginPage(),
    );
  }
}
