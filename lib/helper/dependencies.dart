import 'package:get/get.dart';
import 'package:rest_api_flutter/controllers/popular_product_controller.dart';
import 'package:rest_api_flutter/data/api/api_client.dart';
import 'package:rest_api_flutter/data/repository/popular_product_repo.dart';
import 'package:rest_api_flutter/utils/constants.dart';

Future<void> init() async {
  //apiClient
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL), fenix: true);
  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()), fenix: true);
  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()),
      fenix: true);
}
