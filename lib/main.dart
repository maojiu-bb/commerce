import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_commerce/common/index.dart';

import 'global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',

      // 不展示debug banner
      debugShowCheckedModeBanner: false,

      // 路由配置
      initialRoute: RouteNames.stylesStylesIndex,
      getPages: RoutePages.list,
      navigatorObservers: [RoutePages.observer],

      // 多语言
      translations: Translation(), // 词典
      localizationsDelegates: Translation.localizationsDelegates, // 代理
      supportedLocales: Translation.supportedLocales, // 支持的语言种类
      locale: ConfigService.to.locale, // 当前语言种类
      fallbackLocale: Translation.fallbackLocale, // 默认语言种类

      // 样式
      theme: ConfigService.to.isDarkModel ? AppTheme.dark : AppTheme.light,
    );
  }
}
