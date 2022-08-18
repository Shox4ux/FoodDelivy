class AppConstants {
  static const String BASE_URL = "https://mvs.bslmeiyu.com";

  static const String UPLOAD_URL = "$BASE_URL/uploads/";

  static const String POPULAR_END_POIND = "/api/v1/products/popular";

  static const String RECOMMENDED_END_POINT = "/api/v1/products/recommended";

  static const String TOKEN = "DBFood";

  static const Map<String, String> mainHeaders = {
    'Content-type': 'application/json;',
    'Authorization': 'Bearer $TOKEN ',
  };
}
