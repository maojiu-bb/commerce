import 'package:get/get.dart';
import 'package:woo_commerce/common/index.dart';
import 'package:woo_commerce/pages/index.dart';

class MyIndexController extends GetxController {
  MyIndexController();

  // 注销
  void onLogout() async {
    await UserService.to.logout();
    Get.find<MainController>().onJumpToPage(0);
  }

  _initData() {
    update(["my_index"]);
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

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
