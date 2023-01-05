import 'package:daily_ques/views/add_lesson/lessons.dart';
import 'package:flutter/material.dart';

class HomePageDesing extends StatefulWidget {
  const HomePageDesing({super.key});

  @override
  State<HomePageDesing> createState() => _HomePageDesingState();
}

class _HomePageDesingState extends State<HomePageDesing> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _derslerinizText(),
            _ContainerLessonWidget(),
            _minimumSpaceBox(),
            //_seciliAnlikDersText(),
            _minimumSpaceBox(),
            //_TextLessonWidget(),
            _mediumSpaceBox(),
            _rowButtons(),
            
          ],
        ),
      ),
    );
  }

 


  Widget _mediumSpaceBox() {
    return SizedBox(
      height: 90,
    );
  }

  Widget _minimumSpaceBox() {
    return SizedBox(
      height: 30,
    );
  }

  Widget _seciliAnlikDersText() {
    return Text(
      "Gösterilen Ders:",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _rowButtons() {
    return Row(
      children: [
        Expanded(child: _istatistikButton()),
        Expanded(child: _goToSoruButton()),
      ],
    );
  }

  Widget _goToSoruButton() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          height: 120,
          width: 160,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2,style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(24)),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.black,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:12.0),
                  child: Text(Dersler.isSelectLessons.isEmpty
              ? Dersler.dersler.first.toString()
              : Dersler.isSelectLessons.last.toString(),
          style: TextStyle(fontSize: 22, color: Color.fromARGB(255, 67, 119, 162))),
                ),
                _minimumSpaceBox(),
                Text(
                  "Soru Çöz",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _istatistikButton() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          height: 120,
          width: 160,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(24)),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent, elevation: 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:12.0),
                  child: Text(Dersler.isSelectLessons.isEmpty
              ? Dersler.dersler.first.toString()
              : Dersler.isSelectLessons.last.toString(),
          style: TextStyle(fontSize: 22, color: Color.fromARGB(255, 67, 119, 162))),
                ),
          _minimumSpaceBox(),
                Text(
                  "Soru İstatiskleri",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _derslerinizText() {
    return Text(
      "Seçtiğiniz Dersler:",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _TextLessonWidget() {
    return Container(
      height: 50,
      width: 250,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 106, 151, 188),
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(24)),
      child: Center(
        child: Text(
          Dersler.isSelectLessons.isEmpty
              ? Dersler.dersler.first.toString()
              : Dersler.isSelectLessons.last.toString(),
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }

  Widget _ContainerLessonWidget() {
    return SizedBox(
      width: 500,
      height: 75,
      child: ListView.builder(
        //shrinkWrap: true,
        //itemExtent: 3,
        scrollDirection: Axis.horizontal,
        itemCount: Dersler.dersler.length,
        itemBuilder: (BuildContext context, int index) {
        
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onLongPress: () {
                    setState(() {
                      Dersler.dersler.removeAt(index);
                    });
                  },
                  onPressed: () {
                    setState(() {
                      Dersler.isSelectLessons.add(Dersler.dersler[index]);
                      print(Dersler.isSelectLessons.last);
                     
                      for (int i = 0; i < Dersler.isSelectLessons.length; i++) {
                         isSelected = !isSelected;
                        //print(Dersler.isSelect.toString());
                        //print(Dersler.isSelect[index].toString());
                      }
                    });
                  },
                  child: Container(
                    width: 80,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(color: Colors.black, width: 2)),
                    child: Center(
                      child: Text(
                        Dersler.dersler[index].toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
