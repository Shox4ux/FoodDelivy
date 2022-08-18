import 'package:get/get.dart';
import 'package:rest_api_flutter/screens/food/popular_food_details.dart';
import 'package:rest_api_flutter/screens/home/home_page.dart';

class RouteHelper {
  static String initial = "/";
  static String popularFoodDetails = "/popular-food-details";

  static String getPopularFood() => popularFoodDetails;

  static List<GetPage>? routes = [
    GetPage(
        name: "/",
        page: (() => const HomePage()),
        transition: Transition.fadeIn),
    GetPage(name: popularFoodDetails, page: () => const PopularFoodDetails())
  ];
}
