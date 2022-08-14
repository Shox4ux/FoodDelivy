import 'package:flutter/material.dart';
import 'package:rest_api_flutter/utils/app_layout.dart';

class CircleIcon extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  double size;
  double iconSize;

  CircleIcon(
      {super.key,
      required this.icon,
      this.bgColor = const Color(0xfffcf4e4),
      this.iconColor = const Color(0xff756d54),
      this.size = 45,
      this.iconSize = 16});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppLayout.getWidth(size),
      height: AppLayout.getHeight(size),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(AppLayout.getHeight(size) / 2)),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
