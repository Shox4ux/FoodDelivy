import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:rest_api_flutter/utils/app_layout.dart';
import 'package:rest_api_flutter/utils/styles.dart';
import 'package:rest_api_flutter/widgets/big_text.dart';
import 'package:rest_api_flutter/widgets/small_text.dart';

import 'food_page_boby.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // this container for header of the homePage
          Container(
            margin: EdgeInsets.only(
                top: AppLayout.getHeight(45), bottom: AppLayout.getHeight(15)),
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      text: "Samarkand",
                      textColor: AppColors.mainColor,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: "BagiBaland",
                          color: Colors.black54,
                        ),
                        const Icon(Icons.arrow_drop_down_rounded)
                      ],
                    )
                  ],
                ),
                Container(
                  width: AppLayout.getWidth(45),
                  height: AppLayout.getHeight(45),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(
                      AppLayout.getHeight(15),
                    ),
                  ),
                  child: const Icon(
                    FluentSystemIcons.ic_fluent_search_regular,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          //this is for the body of the homePage

          const Expanded(child: SingleChildScrollView(child: FoodPageBody()))
        ],
      ),
    );
  }
}
