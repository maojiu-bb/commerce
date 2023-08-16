import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:woo_commerce/common/components/appbar.dart';
import 'package:woo_commerce/common/components/product_item.dart';
import 'package:woo_commerce/common/index.dart';

import 'index.dart';

class ProductListPage extends GetView<ProductListController> {
  const ProductListPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 每行三个
        mainAxisSpacing: AppSpace.listRow, // 主轴间距
        crossAxisSpacing: AppSpace.listItem, // 交叉轴间距
        childAspectRatio: 0.7, // 宽高比
      ),
      itemCount: controller.items.length, // 数据长度
      itemBuilder: (context, index) {
        var product = controller.items[index];
        return ProductItemWidget(
          product, // 商品
          imgHeight: 117.w, // 图片高度
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(
      init: ProductListController(),
      id: "product_list",
      builder: (_) {
        return Scaffold(
          appBar: mainAppBarWidget(
            titleString: controller.featured == true
                ? LocaleKeys.gFlashSellTitle.tr
                : LocaleKeys.gNewsTitle.tr,
          ),
          body: SmartRefresher(
            controller: controller.refreshController, // 刷新控制器，
            enablePullDown: true, // 启用上拉加载
            onLoading: controller.onLoading, // 下拉刷新回调
            onRefresh: controller.onRefresh, // 上拉加载回调
            footer: const SmartRefresherFooterWidget(), // 底部加载更多组件
            child: _buildView(),
          ).paddingHorizontal(AppSpace.page),
        );
      },
    );
  }
}
