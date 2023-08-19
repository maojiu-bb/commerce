import 'package:get/get.dart';
import 'package:woo_commerce/common/index.dart';

class OrderDetailController extends GetxController {
  OrderDetailController();

  // 订单详情
  final OrderModel order = Get.arguments as OrderModel;

  _initData() {
    update(["order_detail"]);
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
