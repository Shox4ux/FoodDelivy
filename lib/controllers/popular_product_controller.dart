import 'package:get/get.dart';
import 'package:rest_api_flutter/data/repository/popular_product_repo.dart';
import 'package:rest_api_flutter/models/popular_products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      print(" got data");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body)
          .products); // {.products} comes from model get method!
      update();
    } else {
      print(response.body.toString());
    }
  }
}
