import 'package:daily_ques/data/src/colors.dart';
import 'package:daily_ques/data/src/strings.dart';
import 'package:daily_ques/views/add_lesson/add_lesson_screen.dart';
import 'package:daily_ques/views/add_lesson/lessons.dart';
import 'package:daily_ques/views/home/home_controller.dart';
import 'package:daily_ques/views/home/home_page_design.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import '../saved_question/saved_question.dart';
import '../saved_question/saved_question_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = '/views/home/home_page';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 1;
  bool? dersSorgu = false;
  @override
  Widget build(BuildContext context) {
    if (Dersler.dersler.isEmpty) {
      dersSorgu = true;
    } else
      dersSorgu = false;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
          backgroundColor: Color.fromARGB(77, 165, 88, 88),
          title: const Text(
            homeAppBarText,
            style: TextStyle(fontSize: 32, color: Colors.black),
          )),
      floatingActionButton: _bottomNavIndex < 2
          ? FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                setState(() {
                  _addLessonPage();
                });
              },
              child: const Icon(Icons.add, color: white),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Color.fromARGB(77, 165, 88, 88),
        inactiveColor: Colors.black,
        activeColor: Colors.white,
        icons: [Icons.save, Icons.home, Icons.settings],
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.end,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
      body: Center(
          child: SingleChildScrollView(
              child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (_bottomNavIndex == 0) const SavedQuestions(),
          if (_bottomNavIndex == 1)
            dersSorgu!
                ? TextButton(
                    onPressed: () {
                      _addLessonPage();
                    },
                    child: const Text("Lütfen Ders Ekleyiniz."))
                : const HomePageDesing(),
          if (_bottomNavIndex == 2) const Text("Ayarlar"),
        ],
      ))),
    );
  }

  void _addLessonPage() {
    Get.offAndToNamed(AddLessonPage.routeName);
  }
}
