import 'package:daily_ques/data/services/register/model/register_request_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

import '../../data/services/register_service.dart';

class RegisterController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController boonameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordVerifyController =
      TextEditingController();

  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();
  final RxBool isRegister = RxBool(false);

  final Rxn<RegisterRequestModel> user = Rxn();

  final RegisterService _registerService;
  RegisterController(this._registerService);

  void callingRegisterService(
      String username, String email, String book, String password) {
    final RegisterRequestModel _userRequest = RegisterRequestModel(
      username: username,
      email: email,
      book: book,
      password: password,
    );

    _registerService.register(_userRequest).then((user) {
      isRegister.call(true);
    }).catchError((dynamic error) {
      this.error.trigger(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }
}
