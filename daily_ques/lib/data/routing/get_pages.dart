

import 'package:daily_ques/views/add_lesson/add_lesson_screen.dart';
import 'package:daily_ques/views/home/home_page.dart';
import 'package:daily_ques/views/questions/questions_page.dart';
import 'package:daily_ques/views/register/register_page.dart';
import 'package:get/get.dart';

import '../../views/login/login_page.dart';

List<GetPage> getPages = [

GetPage(name: LoginPage.routeName, page: () =>  LoginPage()),
GetPage(name: RegisterPage.routeName, page: () => const RegisterPage()),
GetPage(name: HomePage.routeName, page: () =>  const HomePage()),
GetPage(name: QuestionPage.routeName, page: () => const QuestionPage()),
GetPage(name: AddLessonPage.routeName, page: (() => const AddLessonPage()))
];