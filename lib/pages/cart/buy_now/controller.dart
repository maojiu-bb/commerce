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

  // 数量
  int quantity = 1;
  // 运费
  double get shipping => 0;
  // 折扣
  double get discount => 0;
  // 商品合计价格
  double get totalPrice => double.parse(product.price!) * quantity;

  // 修改数量
  void onQuantityChange(int value) {
    if (value <= 0) {
      value = 1;
    }
    quantity = value;
    update(["buy_now"]);
  }

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
