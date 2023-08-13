import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_commerce/common/index.dart';

import 'index.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const ImageWidget.asset(
      AssetsImages.splashPng,
      fit: BoxFit.fill,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      id: "splash",
      builder: (_) {
        return Scaffold(
          // appBar: AppBar(title: const Text("splash")),
          body: _buildView(),
        );
      },
    );
  }
}
