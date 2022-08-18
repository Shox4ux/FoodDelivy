import 'package:get/get.dart';
import 'package:rest_api_flutter/utils/constants.dart';

import '../api/api_client.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({
    required this.apiClient,
  });

  Future<dynamic> getPopularProductList() async {
    return await apiClient.getData(AppConstants.POPULAR_END_POIND);
  }
}
