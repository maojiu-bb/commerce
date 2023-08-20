import 'package:get/get.dart';
import 'package:woo_commerce/common/index.dart';
import 'package:woo_commerce/pages/index.dart';

class CartIndexController extends GetxController {
  CartIndexController();

  // 优惠券代码
  String couponCode = '';

  // 商品是否选中
  List<int> selectedIds = [];

  // 商品详情
  List<ProductModel> products = [];

  // 是否全选
  bool get isSelectedAll => CartService.to.lineItems.isEmpty
      ? false
      : CartService.to.lineItems.length == selectedIds.length;

  // 是否选中
  bool isSelected(int productId) {
    return selectedIds.any((val) => val == productId);
  }

  // 全选
  Future<void> onSelectAll(bool isSelected) async {
    if (isSelected) {
      // 全选
      selectedIds =
          CartService.to.lineItems.map((item) => item.productId!).toList();
      for (var element in selectedIds) {
        var product = await ProductApi.productDetail(element);
        products.add(product);
      }
    } else {
      // 全不选
      selectedIds.clear();
      products.clear();
    }
    update(["cart_index"]);
  }

  // 选中
  Future<void> onSelect(int productId, bool isSelected) async {
    if (isSelected) {
      //
      selectedIds.add(productId);
      var product = await ProductApi.productDetail(productId);
      products.add(product);
    } else {
      //
      selectedIds.remove(productId);
      products.removeWhere((product) => product.id == productId);
    }
    update(["cart_index"]);
  }

  // 删除购物车订单
  Future<void> onOrderCancel() async {
    for (var i = 0; i < selectedIds.length; i++) {
      int productId = selectedIds[i];
      CartService.to.cancelOrder(productId);
    }
    selectedIds.clear();
    products.clear();
    update(["cart_index"]);
  }

  // 应用优惠券, 568935ab
  Future<void> onApplyCoupon() async {
    if (couponCode.isEmpty) {
      Loading.error("Voucher code empty.");
      return;
    }
    CouponsModel? coupon = await CouponApi.couponDetail(couponCode);
    if (coupon != null) {
      couponCode = "";
      bool isSuccess = CartService.to.applyCoupon(coupon);
      if (isSuccess) {
        Loading.success("Coupon applied.");
      } else {
        Loading.error("Coupon is already applied.");
      }
      update(["cart_index"]);
    } else {
      Loading.error("Coupon code is not valid.");
    }
  }

  // 修改订单数量
  Future<void> onChangeQuantity(LineItem item, int quantity) async {
    CartService.to.changeQuantity(item.productId!, quantity);
    update(["cart_index"]);
  }

  // checkout
  Future<void> onCheckout() async {
    if (CartService.to.lineItems.isEmpty) {
      return Loading.error("Cart is empty.");
    }
    if (selectedIds.isEmpty) {
      return Loading.error("Please select at least one product.");
    }

    ActionBottomSheet.barModel(
      BuyNowPage(product: products[0]),
    ).whenComplete(() {
      selectedIds.remove(selectedIds[0]);
      products.remove(products[0]);
      update(["cart_index"]);
    });
  }

  _initData() {
    update(["cart_index"]);
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
