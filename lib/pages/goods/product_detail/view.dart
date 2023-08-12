import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("ProductDetailPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
      init: ProductDetailController(),
      id: "product_detail",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("product_detail")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
