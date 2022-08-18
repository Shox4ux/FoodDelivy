import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_flutter/utils/constants.dart';

class ApiClient {
  Future<dynamic> getData(String endPoint) async {
    try {
      final response = (await http.get(
          Uri.parse(AppConstants.BASE_URL + endPoint),
          headers: AppConstants.mainHeaders));
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
