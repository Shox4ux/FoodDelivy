import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_flutter/controllers/popular_product_controller.dart';
import 'package:rest_api_flutter/controllers/recommended_product_controller.dart';
import 'package:rest_api_flutter/routes/route_helper.dart';
import 'package:rest_api_flutter/screens/food/popular_food_details.dart';
import 'package:rest_api_flutter/screens/home/home_page.dart';

import 'helper/dependencies.dart' as dep;

@override
void initState() {}

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const HomePage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
      // initialRoute: RouteHelper.initial,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}
