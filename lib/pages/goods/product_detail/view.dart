import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return GetBuilder<ProductDetailController>(
        id: "product_banner",
        tag: tag,
        builder: (_) {
          return CarouselWidget(
            // 打开大图预览
            onTap: controller.onGalleryTap,
            // 图片列表
            items: controller.bannerItems,
            // 当前索引
            currentIndex: controller.bannerCurrentIndex,
            // 切换回调
            onPageChanged: controller.onChangeBanner,
            // 高度
            height: 190.w,
            // 指示器圆点
            indicatorCircle: false,
            // 指示器位置
            indicatorAlignment: MainAxisAlignment.start,
            // 指示器颜色
            indicatorColor: AppColors.highlight,
          );
        }).backgroundColor(AppColors.surfaceVariant);
  }

  // 商品标题
  Widget _buildTitle() {
    return <Widget>[
      // 金额、打分、喜欢
      <Widget>[
        // 金额
        TextWidget.title1(
          "\$${controller.product?.price ?? 0}",
        ).expanded(),
        // 打分
        const IconTextWidget(
          iconData: Icons.star,
          text: "4.5",
        ).paddingRight(AppSpace.iconTextMedium),
        // 喜欢
        const IconTextWidget(
          iconData: Icons.favorite,
          text: "100+",
        ),
      ].toRow(),

      // 次标题
      TextWidget.body1(
        controller.product?.shortDescription?.clearHtml ?? "-",
      ),
    ]
        .toColumn(
          // 左对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          // 垂直间距
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        )
        .paddingAll(AppSpace.page);
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
    return controller.product == null
        ? const PlaceholdWidget() // 占位图
        : <Widget>[
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
          appBar: mainAppBarWidget(
            titleString: controller.product?.name ?? LocaleKeys.gDetailTitle.tr,
          ),
          // 内容
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
