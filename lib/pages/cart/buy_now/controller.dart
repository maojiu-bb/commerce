import 'package:get/get.dart';
import 'package:woo_commerce/common/index.dart';

class BuyNowController extends GetxController {
  BuyNowController(this.product);

  // 商品详情
  final ProductModel product;

  // 支付方式图标
  List<String> paymentList = [
    AssetsImages.pVisaPng,
    AssetsImages.pCashPng,
    AssetsImages.pMastercardPng,
    AssetsImages.pPaypalPng,
  ];

  // 送货地址
  String shippingAddress = "";

  // 下单 checkout
  void onCheckout() async {}

  _initData() {
    // 获取送货地址
    shippingAddress = UserService.to.shipping;

    update(["buy_now"]);
  }

  // goto 送货地址修改
  Future<void> onShippingTap() async {
    var result = await Get.toNamed(RouteNames.myMyAddress,
        arguments: {"type": "Shipping"});
    if (result != null && result == true) {
      shippingAddress = UserService.to.shipping;
      update(["buy_now"]);
    }
  }

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
