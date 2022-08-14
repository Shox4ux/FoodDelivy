import 'package:flutter/material.dart';
import 'package:rest_api_flutter/utils/app_layout.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;

  SmallText(
      {Key? key,
      required this.text,
      this.size = 12,
      this.height = 1.2,
      this.color = const Color(0xffccc7c5)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        height: height,
        color: color,
        fontSize: AppLayout.getHeight(size),
        fontFamily: "Roboto",
        // height: AppLayout.getHeight(height)
      ),
    );
  }
}
