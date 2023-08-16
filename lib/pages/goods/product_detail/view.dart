import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_commerce/common/index.dart';

import 'index.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  // 5 定义 tag 值，唯一即可
  final String tag = '${Get.arguments['id'] ?? ''}${UniqueKey()}';

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // 6 实例传入 tag
    return _ProductDetailViewGetX(tag);
  }
}

class _ProductDetailViewGetX extends GetView<ProductDetailController> {
// 1 定义唯一 tag 变量
  final String uniqueTag;

// 2 接收传入 tag 值
  const _ProductDetailViewGetX(this.uniqueTag, {Key? key}) : super(key: key);

// 3 重写 GetView 属性 tag
  @override
  String? get tag => uniqueTag;

// 滚动图
  Widget _buildBanner() {
    return const Text("滚动图");
  }

  // 商品标题
  Widget _buildTitle() {
    return const Text("滚动图");
  }

  // Tab 栏位
  Widget _buildTabBar() {
    return const Text("Tab 栏位");
  }

  // TabView 视图
  Widget _buildTabView() {
    return const Text("TabView 视图");
  }

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // 滚动图
      _buildBanner(),

      // 商品标题
      _buildTitle(),

      // Tab 栏位
      _buildTabBar(),

      // TabView 视图
      _buildTabView(),
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
      init: ProductDetailController(),
      id: "product_detail",
      // 4 GetBuilder 属性 tag 设置
      tag: tag,
      builder: (_) {
        return Scaffold(
          // 导航
          appBar: mainAppBarWidget(titleString: LocaleKeys.gDetailTitle.tr),
          // 内容
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
