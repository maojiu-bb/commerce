import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class OrderDetailPage extends GetView<OrderDetailController> {
  const OrderDetailPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("OrderDetailPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailController>(
      init: OrderDetailController(),
      id: "order_detail",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("order_detail")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
