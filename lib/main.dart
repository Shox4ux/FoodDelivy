import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_flutter/controllers/popular_product_controller.dart';
import 'helper/dependencies.dart' as dep;

import 'nav_bar/bottom_bar.dart';

Future<void> main() async {
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

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: BottomBar(),
    );
  }
}
