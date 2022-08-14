import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rest_api_flutter/utils/app_layout.dart';
import 'package:rest_api_flutter/utils/styles.dart';
import 'package:rest_api_flutter/widgets/big_text.dart';
import 'package:rest_api_flutter/widgets/circle_icon.dart';
import 'package:rest_api_flutter/widgets/expandable_text.dart';

class RecommendedFoodDetails extends StatelessWidget {
  const RecommendedFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          toolbarHeight: AppLayout.getHeight(70),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleIcon(
                icon: Icons.clear,
                size: AppLayout.getHeight(40),
              ),
              CircleIcon(
                icon: Icons.shopping_cart,
                size: AppLayout.getHeight(40),
              )
            ],
          ),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(AppLayout.getHeight(50)),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppLayout.getHeight(20)),
                        topRight: Radius.circular(AppLayout.getHeight(20)))),
                padding: EdgeInsets.only(
                    top: AppLayout.getHeight(5),
                    bottom: AppLayout.getHeight(5)),
                width: double.maxFinite,
                child: Center(
                  child: BigText(
                    text: "Sliver Text",
                    textSize: 24,
                  ),
                ),
              )),
          pinned: true,
          backgroundColor: AppColors.yellowColor,
          expandedHeight: AppLayout.getHeight(300),
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              "images/f6.jpg",
              fit: BoxFit.cover,
              width: double.maxFinite,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(20)),
              child: Column(
                children: const [
                  ExpandableText(
                    expandableText: SimpleText.simpleText,
                  ),
                ],
              )),
        )
      ]),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: AppLayout.getHeight(10),
                horizontal: AppLayout.getWidth(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleIcon(
                  icon: Icons.remove,
                  iconColor: Colors.white,
                  bgColor: AppColors.mainColor,
                  size: AppLayout.getHeight(40),
                  iconSize: AppLayout.getHeight(30),
                ),
                BigText(
                  text: "\$" + "14,53 " + "X " + "0",
                  textColor: AppColors.mainBlackColor,
                  textSize: AppLayout.getHeight(21),
                ),
                CircleIcon(
                  icon: Icons.add,
                  bgColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  size: AppLayout.getHeight(40),
                  iconSize: AppLayout.getHeight(30),
                )
              ],
            ),
          ),
          Container(
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
                        borderRadius:
                            BorderRadius.circular(AppLayout.getHeight(20)),
                        color: Colors.white),
                    child: const Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    )),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: AppLayout.getHeight(15),
                      horizontal: AppLayout.getWidth(15)),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppLayout.getHeight(20)),
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
        ],
      ),
    );
  }
}
