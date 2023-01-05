import 'package:daily_ques/data/src/colors.dart';
import 'package:daily_ques/views/login/login_page.dart';
import 'package:daily_ques/views/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/src/strings.dart';

class RegisterPage extends GetWidget<RegisterController> {
  static const String routeName = '/views/register/register_page';

  const RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {

    controller.isRegister.listen((isRegister){

      if(isRegister) 
      {
        _goToLogin();
      }
    });

    controller.error.listen((error)=>_errorDialog());

    return Scaffold(
      appBar: AppBar(
        title: const Text('DAILY QUES'),
        backgroundColor: mainColor,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildUsernameTextField(),
          _buildEmailTextField(),
          _buildFavoriteBookTextField(),
          _buildPasswordTextField(),
          _buildPasswordVerifyTextfield(),
          _buildSpace(),
          _buildRegisterButton(),
        ],
      ),
    );
  }

  Widget _buildUsernameTextField() {
    return  Material(
        color: white,
        elevation: 10,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            textInputAction: TextInputAction.next,
            
             controller: controller.usernameController,
            decoration: const InputDecoration(
                border: InputBorder.none, hintText: usernameText),
          ),
        ));
  }

  Widget _buildEmailTextField() {
    return  Material(
        color: white,
        elevation: 10,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            textInputAction: TextInputAction.next,
            
             controller: controller.emailController,
            decoration:
                const InputDecoration(border: InputBorder.none, hintText: emailText),
          ),
        ));
  }

  Widget _buildFavoriteBookTextField() {
    return Material(
        color: white,
        elevation: 10,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            textInputAction: TextInputAction.next,
            
            controller: controller.boonameController,
            decoration:
                const InputDecoration(border: InputBorder.none, hintText: bookText),
          ),
        ));
  }

  Widget _buildPasswordTextField() {
    return  Material(
        color: white,
        elevation: 10,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            textInputAction: TextInputAction.next,
            obscureText: true,
            controller: controller.passwordController,
            decoration:
                const InputDecoration(border: InputBorder.none, hintText: passwordText),
          ),
        ));
  }

  Widget _buildPasswordVerifyTextfield() {
    return Material(
        color: white,
        elevation: 10,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            textInputAction: TextInputAction.next,
            obscureText: true,
            controller: controller.passwordVerifyController,
            decoration:
                const InputDecoration(border: InputBorder.none, hintText: passwordVerifyText),
          ),
        ));
  }

  Widget _buildRegisterButton() {
    return SizedBox(
      height: 45,
      width: 120,
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        child: const Text(registerText),
        style: ElevatedButton.styleFrom(backgroundColor: mainColor),
      ),
    );
  }
  void onTap(){
    controller.callingRegisterService(controller.usernameController.text, controller.emailController.text, controller.boonameController.text, controller.passwordController.text);
  }

  Widget _buildSpace() {
    return const SizedBox(
      height: 60,
    );
  }

  void _goToLogin(){
    Get.toNamed(LoginPage.routeName);
  }

  void _errorDialog(){
    Get.snackbar(errorTitle, errorDescription,colorText: white,backgroundColor: Colors.red);
  }

}
