import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_commerce/common/index.dart';
import 'package:woo_commerce/pages/index.dart';

class FilterView extends GetView<SearchFilterController> {
  const FilterView({Key? key}) : super(key: key);

  // 顶部 关闭
  Widget _buildTopBar() {
    return <Widget>[
      // 文字
      TextWidget.title3(LocaleKeys.searchFilter.tr),

      // 关闭按钮
      ButtonWidget.icon(
        IconWidget.icon(
          Icons.close,
          size: 15,
          color: AppColors.secondary,
        ),
        onTap: controller.onFilterCloseTap,
      )
    ]
        .toRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        )
        .paddingBottom(AppSpace.listRow);
  }

  // 标题栏
  Widget _buildTitle(String title) {
    return TextWidget.body2(title).paddingBottom(AppSpace.listRow);
  }

  // 价格选择区间
  Widget _buildPriceRange() {
    return GetBuilder<SearchFilterController>(
      id: "filter_price_range",
      builder: (_) {
        return PriceRangeWidget(
          max: 5000,
          min: 0,
          values: controller.priceRange,
          onDragging: controller.onPriceRangeDragging,
        ).paddingBottom(AppSpace.listRow * 2);
      },
    );
  }

  Widget _buildView() {
    return <Widget>[
      // 顶部
      _buildTopBar(),

      // 价格
      _buildTitle(LocaleKeys.searchFilterPrice.tr),
      _buildPriceRange(),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .paddingHorizontal(AppSpace.page);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchFilterController>(
      id: "filter_view",
      builder: (_) {
        return _buildView();
      },
    );
  }
}