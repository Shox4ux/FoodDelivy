import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:rest_api_flutter/utils/constants.dart';

import '../api/api_client.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({
    required this.apiClient,
  });

  Future<dynamic> getRecommededProductList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_END_POINT);
  }
}
