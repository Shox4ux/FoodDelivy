import 'package:get/get.dart';
import 'package:rest_api_flutter/utils/constants.dart';

import '../api/api_client.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({
    required this.apiClient,
  });

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.END_URL);
  }
}
