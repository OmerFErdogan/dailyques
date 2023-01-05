import 'package:daily_ques/views/add_lesson/lessons.dart';
import 'package:daily_ques/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddLessonPage extends StatefulWidget {
  static const String routeName = '/views/add_lesson/add_lesson_screen';

  const AddLessonPage({super.key});

  @override
  State<AddLessonPage> createState() => _AddLessonPageState();
}

class _AddLessonPageState extends State<AddLessonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            _goToHomePage();
          },
        ),
        title: const Text("Ders Ekle", style: TextStyle(fontSize: 32,  ),),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          _buildLessonContainer("Matematik"),
          _buildDivider(),
          _buildLessonContainer("Türkçe"),
          _buildDivider(),
          _buildLessonContainer("Kimya"),
          _buildDivider(),
          _buildLessonContainer("Fizik"),
          _buildDivider(),
          _buildLessonContainer("Tarih"),
         _buildDivider(),
          _buildLessonContainer("Coğrafya"),
          _buildDivider(),
          _buildLessonContainer("Felsefe"),
          _buildDivider(),
          _buildLessonContainer("Biyoloji"),
          _buildDivider(),
          _buildLessonContainer("Geometri"),
        ],
      )),
    );
  }

  Widget _buildLessonContainer(String dersAd) {
    return SizedBox(
      height: 85,
      child: ListTile(
        tileColor: Colors.white30,
        style: ListTileStyle.drawer,
        title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              dersAd,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 32),
            )),
        trailing: IconButton(
          onPressed: () {
            Dersler.dersler.add(dersAd);
            //print(Dersler.dersler[0].toString());
            print(Dersler.dersler.last);
          },
          icon: Container(
            width: 360, 
            height:360, 
            decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(42)),
            child: Center(
              child: Icon(
                Icons.add,
                size: 30,
                color: Colors.black,
                
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      thickness: 1,
      color: Colors.black,
    );
  }

  Widget _buildSpace() {
    return const SizedBox(
      height: 4,
    );
  }

  void _goToHomePage() {
    Get.offAndToNamed(HomePage.routeName);
  }
}
