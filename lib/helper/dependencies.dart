import 'package:get/get.dart';
import 'package:rest_api_flutter/controllers/popular_product_controller.dart';
import 'package:rest_api_flutter/controllers/recommended_product_controller.dart';
import 'package:rest_api_flutter/data/api/api_client.dart';
import 'package:rest_api_flutter/data/repository/popular_product_repo.dart';
import 'package:rest_api_flutter/data/repository/recommended_product_repo.dart';

Future<void> init() async {
  //apiClient
  Get.lazyPut(() => ApiClient());
  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
}
