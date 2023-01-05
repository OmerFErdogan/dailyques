import 'package:daily_ques/data/services/dio_manager.dart';
import 'package:daily_ques/data/services/login/login_service.dart';
import 'package:daily_ques/data/services/register_service.dart';
import 'package:daily_ques/views/home/home_controller.dart';
import 'package:daily_ques/views/login/login_controller.dart';
import 'package:daily_ques/views/questions/questions_controller.dart';
import 'package:daily_ques/views/questions/questions_page.dart';
import 'package:daily_ques/views/register/register_controller.dart';
import 'package:get/instance_manager.dart';
//pages
Future getControllers() async {
  Get.create(() => LoginController(Get.find()), permanent: false);
  Get.create(() => RegisterController(Get.find()), permanent: false);
  Get.create(() => HomeController(), permanent: false);
  Get.create(() => QuestionsController(), permanent: false);



Get.lazyPut<RegisterService>(() => RegisterServiceImp(),fenix: false);
   Get.lazyPut<LoginService>(() => LoginServiceImp(),fenix: false);

//Get.lazyPut<RegisterService>(()=>RegisterServiceImp(Get.find()));

}
