import 'package:flutter/material.dart';
import 'package:rest_api_flutter/utils/app_layout.dart';
import 'package:rest_api_flutter/utils/styles.dart';
import 'package:rest_api_flutter/widgets/small_text.dart';

class ExpandableText extends StatefulWidget {
  final String expandableText;
  const ExpandableText({
    Key? key,
    required this.expandableText,
  }) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  bool isHidden = true;
  double textHeight = AppLayout.getHeight(100);
  double textSize = AppLayout.getHeight(16);

  @override
  void initState() {
    super.initState();

    /**
     * this condition checks the length of will be given text 
     * if that length is more than we assumed in [textHeight] we just devide it to two 
     * from 0 till the assumed length , then the second half will start from just below the place ,where we got fisrt half, till the end  
     */

    if (widget.expandableText.length > textHeight) {
      firstHalf = widget.expandableText.substring(0, textHeight.toInt());
      secondHalf = widget.expandableText
          .substring(textHeight.toInt() + 1, widget.expandableText.length);
    } else {
      firstHalf = widget.expandableText;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              height: 1.4,
              color: AppColors.paraColor,
              text: firstHalf,
              size: textSize,
            )
          : Column(
              children: [
                SmallText(
                  height: 1.4,
                  color: AppColors.paraColor,
                  size: textSize,
                  text: isHidden ? ("$firstHalf...") : (firstHalf + secondHalf),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        size: textSize,
                        text: "Show more",
                        color: AppColors.mainColor,
                      ),
                      Icon(
                        isHidden ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
