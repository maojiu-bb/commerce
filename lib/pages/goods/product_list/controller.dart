import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:woo_commerce/common/index.dart';

class ProductListController extends GetxController {
  ProductListController();

  // 是否为推荐商品
  final bool featured = Get.arguments['featured'] ?? false;

  // 刷新控制器
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  // 列表
  List<ProductModel> items = [];

  // 页码
  int _page = 1;

  // 页尺寸
  final int _pageSize = 20;

  // 拉取数据
  // isRefresh 是否刷新
  Future<bool> _loadData(bool isRefresh) async {
    // 拉取数据
    var result = await ProductApi.products(ProductsReq(
      // 页码
      page: isRefresh ? 1 : _page,
      // 每页条数
      prePage: _pageSize,
    ));

    // 下拉刷新
    if (isRefresh) {
      _page = 1; // 重置页码
      items.clear(); // 清空数据
    }

    // 有数据
    if (result.isNotEmpty) {
      // 页码加一
      _page++;
      // 追加数据
      items.addAll(result);
    }

    // 是否为空
    return result.isEmpty;
  }

  // 上拉载入商品
  void onLoading() async {
    if (items.isNotEmpty) {
      try {
        // 拉取数据是否为空
        var isEmpty = await _loadData(false);
        if (isEmpty) {
          // 设置无数据
          refreshController.loadNoData();
        } else {
          // 加载完成
          refreshController.loadComplete();
        }
      } catch (e) {
        // 加载失败
        refreshController.loadFailed();
      }
    } else {
      // 设置无数据
      refreshController.loadNoData();
    }
    // 更新 UI
    update(['product_list']);
  }

  // 下拉刷新
  void onRefresh() async {
    try {
      // 加载数据
      await _loadData(true);
      // 刷新完成
      refreshController.refreshCompleted();
    } catch (e) {
      // 刷新失败
      refreshController.refreshFailed();
    }
    // 更新 UI
    update(['product_list']);
  }

  _initData() {
    update(["product_list"]);
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
    // 刷新控制器释放
    refreshController.dispose();
  }
}
