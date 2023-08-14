import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RegisterController();

  // 用户名
  TextEditingController userNameController =
      TextEditingController(text: "maojiu");
  // 邮件
  TextEditingController emailController =
      TextEditingController(text: "maojiu@gmail.com");
  // 姓
  TextEditingController firstNameController =
      TextEditingController(text: "mao");
  // 名
  TextEditingController lastNameController = TextEditingController(text: "jiu");
  // 密码
  TextEditingController passwordController =
      TextEditingController(text: "12345678");

  // 注册
  void onSignUp() {}

  // 登录
  void onSignIn() {}

  _initData() {
    update(["register"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // 释放
  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
  }
}
