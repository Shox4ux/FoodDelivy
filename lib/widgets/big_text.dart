import 'package:flutter/material.dart';
import 'package:rest_api_flutter/utils/app_layout.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? textSize;
  final FontWeight? fontWeight;
  TextOverflow textOverflow;

  BigText(
      {Key? key,
      required this.text,
      this.textColor = const Color(0xff332d2b),
      this.textSize = 20,
      this.textOverflow = TextOverflow.ellipsis,
      this.fontWeight = FontWeight.w400})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: textOverflow,
      style: TextStyle(
          color: textColor,
          fontSize: textSize,
          fontWeight: fontWeight,
          fontFamily: "Roboto"),
    );
  }
}
