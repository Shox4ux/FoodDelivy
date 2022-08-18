import 'dart:convert';

import 'package:get/get.dart';
import 'package:rest_api_flutter/data/repository/popular_product_repo.dart';
import 'package:rest_api_flutter/models/popular_products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    var response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      print("popular data");
      final json = jsonDecode(response.body);
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(json)
          .products); // {.products} comes from model get method!
      _isLoaded = true;
      update();
    } else {
      print(response.statusText);
    }
  }
}
