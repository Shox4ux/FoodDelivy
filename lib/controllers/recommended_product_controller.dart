import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:rest_api_flutter/models/popular_products_model.dart';

import '../data/repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    var response = await recommendedProductRepo.getRecommededProductList();

    if (response.statusCode == 200) {
      print("recommended data");
      final json = jsonDecode(response.body);
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(json)
          .products); // {.products} comes from model get method!
      _isLoaded = true;
      update();
    } else {
      print(response.statusText);
    }
  }
}
