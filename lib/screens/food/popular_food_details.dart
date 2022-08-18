import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:rest_api_flutter/screens/home/home_page.dart';
import 'package:rest_api_flutter/screens/home/home_page_body.dart';
import 'package:rest_api_flutter/utils/app_layout.dart';
import 'package:rest_api_flutter/widgets/circle_icon.dart';
import 'package:rest_api_flutter/widgets/expandable_text.dart';

import '../../utils/styles.dart';
import '../../widgets/big_text.dart';
import '../../widgets/rating_bar.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: AppLayout.getWidth(0),
            right: AppLayout.getWidth(0),
            child: Container(
              height: AppLayout.getHeight(350),
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/f8.jpeg"), fit: BoxFit.cover)),
            ),
          ),
          //cirlce icons
          Positioned(
            top: AppLayout.getHeight(45),
            left: AppLayout.getWidth(20),
            right: AppLayout.getWidth(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.to(() => const HomePage());
                    },
                    child: CircleIcon(icon: Icons.arrow_back_ios)),
                CircleIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
          ),
          //introduction of food
          Positioned(
            left: AppLayout.getHeight(0),
            right: AppLayout.getHeight(0),
            bottom: AppLayout.getHeight(0),
            top: AppLayout.getHeight(320),
            child: Container(
              padding: EdgeInsets.only(
                  top: AppLayout.getHeight(20),
                  left: AppLayout.getHeight(20),
                  right: AppLayout.getHeight(20)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(AppLayout.getHeight(20)),
                      topLeft: Radius.circular(AppLayout.getHeight(20))),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const RatingBar(
                    bigText: "Delicious Dessert",
                    ratingUnit: 5,
                    time: "25min",
                    distance: "1,6km",
                    level: "Normal",
                    commentText: "2005 comments",
                    bigTextSize: 20,
                  ),
                  Gap(AppLayout.getHeight(20)),
                  BigText(
                    text: "Introduction",
                  ),
                  Gap(AppLayout.getHeight(10)),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(
                          expandableText:
                              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy."),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: AppLayout.getHeight(100),
        padding: EdgeInsets.symmetric(
            vertical: AppLayout.getHeight(20),
            horizontal: AppLayout.getWidth(20)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppLayout.getHeight(40)),
                topLeft: Radius.circular(AppLayout.getHeight(40))),
            color: AppColors.buttonBackGraoundColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: AppLayout.getHeight(15),
                  horizontal: AppLayout.getWidth(15)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                  color: Colors.white),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(
                  Icons.remove,
                  color: AppColors.signColor,
                ),
                Gap(AppLayout.getHeight(3)),
                BigText(text: "0"),
                Gap(AppLayout.getHeight(3)),
                const Icon(
                  Icons.add,
                  color: AppColors.signColor,
                ),
              ]),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: AppLayout.getHeight(15),
                  horizontal: AppLayout.getWidth(15)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                  color: AppColors.mainColor),
              child: Row(children: [
                BigText(
                  text: "\$9.99 | Add to cart",
                  textColor: Colors.white,
                  textSize: 16,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
