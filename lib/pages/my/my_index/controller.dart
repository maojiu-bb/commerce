import 'package:get/get.dart';
import 'package:woo_commerce/common/index.dart';
import 'package:woo_commerce/pages/index.dart';

class MyIndexController extends GetxController {
  MyIndexController();

  // 注销
  void onLogout() async {
    await UserService.to.logout();
    Loading.success();
    Get.find<MainController>().onJumpToPage(0);
  }

  // 地址编辑页 type 1 billing 2 shipping
  void onToAddress(String type) {
    Get.toNamed(RouteNames.myMyAddress, arguments: {"type": type});
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
