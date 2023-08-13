import 'package:flutter/material.dart';
import 'package:woo_commerce/common/index.dart';
import 'package:get/get.dart';

class Global {
  static Future<void> init() async {
    // flutter 跟原生端的接口进行初始化
    WidgetsFlutterBinding.ensureInitialized();

// storage 工具类
    // 持久化存储
    await Storage().init();

    // 注入全局config service
    await Future.wait([
      Get.putAsync<ConfigService>(() async => await ConfigService().init()),
    ]).whenComplete(() {});

    // dio service
    Get.put<WPHttpService>(WPHttpService());
  }
}
