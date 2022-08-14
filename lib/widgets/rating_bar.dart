import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rest_api_flutter/widgets/small_text.dart';

import '../utils/app_layout.dart';
import '../utils/styles.dart';
import 'big_text.dart';
import 'icon_with_text.dart';

class RatingBar extends StatelessWidget {
  final String bigText;
  final String ratingUnit;
  final String commentText;
  final String distance;
  final String time;
  final String level;
  final double bigTextSize;
  const RatingBar(
      {Key? key,
      required this.bigText,
      required this.ratingUnit,
      required this.commentText,
      required this.distance,
      required this.time,
      required this.level,
      required this.bigTextSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: bigText,
          textSize: bigTextSize,
        ),
        Gap(AppLayout.getHeight(3)),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => const Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 15,
                ),
              ),
            ),
            Gap(AppLayout.getHeight(5)),
            SmallText(
              text: ratingUnit,
            ),
            Gap(AppLayout.getHeight(20)),
            SmallText(text: commentText),
          ],
        ),
        Gap(AppLayout.getHeight(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconWithText(
                icon: Icons.circle_sharp,
                iconColor: AppColors.iconColor1,
                text: level),
            IconWithText(
                icon: Icons.location_on,
                iconColor: AppColors.mainColor,
                text: distance),
            IconWithText(
                icon: Icons.access_time_rounded,
                iconColor: AppColors.iconColor2,
                text: time),
          ],
        )
      ],
    );
  }
}
