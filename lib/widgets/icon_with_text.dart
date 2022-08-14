import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rest_api_flutter/utils/app_layout.dart';
import 'package:rest_api_flutter/widgets/small_text.dart';

class IconWithText extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  final double iconSize;
  const IconWithText(
      {Key? key,
      required this.icon,
      required this.iconColor,
      required this.text,
      this.iconSize = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: AppLayout.getHeight(iconSize),
        ),
        Gap(AppLayout.getHeight(3)),
        SmallText(text: text)
      ],
    );
  }
}
