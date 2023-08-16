import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_commerce/common/index.dart';

class ProductDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ProductDetailController();

  // 商品 id , 获取路由传递参数
  int? productId = Get.arguments['id'] ?? 0;
  // 商品详情
  ProductModel? product;
  // Banner 数据
  List<KeyValueModel> bannerItems = [];
  // Banner 当前位置
  int bannerCurrentIndex = 0;

  // tab 控制器
  late TabController tabController;
  // tab 控制器
  int tabIndex = 0;

  // 颜色列表
  List<KeyValueModel<AttributeModel>> colors = [];
  // 选中颜色列表
  List<String> colorKeys = [];

  // 读取缓存
  _loadCache() async {
    // 颜色列表
    var stringColors =
        Storage().getString(Constants.storageProductsAttributesColors);

    colors = stringColors != ""
        ? jsonDecode(stringColors).map<KeyValueModel<AttributeModel>>((item) {
            var arrt = AttributeModel.fromJson(item);
            return KeyValueModel(key: "${arrt.name}", value: arrt);
          }).toList()
        : [];
  }

  // 拉取商品详情
  _loadProduct() async {
    // 商品详情
    product = await ProductApi.productDetail(productId);

    // Banner 数据
    if (product?.images != null) {
      bannerItems = product!.images!
          .map<KeyValueModel>((e) => KeyValueModel(
                key: "${e.id}",
                value: e.src ?? "",
              ))
          .toList();
    }
  }

  // Banner 切换事件
  void onChangeBanner(int index, reason) {
    bannerCurrentIndex = index;
    update(["product_banner"]); // 手动刷新 Banner
  }

  // 图片浏览
  void onGalleryTap(int index, KeyValueModel item) {
    Get.to(GalleryWidget(
      initialIndex: index,
      items: bannerItems.map<String>((e) => e.value!).toList(),
    ));
  }

  // 切换 tab
  void onTapBarTap(int index) {
    tabIndex = index;
    tabController.animateTo(index);
    update(["product_tab"]);
  }

  // 颜色选中
  void onColorTap(List<String> keys) {
    colorKeys = keys;
    update(["product_colors"]);
  }

  _initData() async {
    await _loadProduct();

    await _loadCache();

    // 初始化 tab 控制器
    tabController = TabController(length: 3, vsync: this);

    update(["product_detail"]);
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

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }
}
