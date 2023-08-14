import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:woo_commerce/common/index.dart';

class SplashController extends GetxController {
  SplashController();

  _jumpToPage() {
    // 样式配置
    if (ConfigService.to.isAlreadyOpen) {
      Get.offAllNamed(RouteNames.systemWelcome);
    } else {
      Get.offAllNamed(RouteNames.main);
    }
  }

  _initData() {
    // 删除设备启动图
    FlutterNativeSplash.remove();

    update(["splash"]);
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

    _jumpToPage(); // 跳转界面
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
