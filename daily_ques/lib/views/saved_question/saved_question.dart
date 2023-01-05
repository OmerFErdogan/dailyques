import 'package:daily_ques/data/src/strings.dart';
import 'package:flutter/material.dart';

class SavedQuestions extends StatefulWidget {
  const SavedQuestions({super.key});

  @override
  State<SavedQuestions> createState() => _SavedQuestionsState();
}

class _SavedQuestionsState extends State<SavedQuestions> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Kayıtlı Sorular"));
  }
}
