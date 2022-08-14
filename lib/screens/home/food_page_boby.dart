import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rest_api_flutter/utils/app_layout.dart';
import 'package:rest_api_flutter/utils/styles.dart';
import 'package:rest_api_flutter/widgets/big_text.dart';
import 'package:rest_api_flutter/widgets/icon_with_text.dart';
import 'package:rest_api_flutter/widgets/rating_bar.dart';
import 'package:rest_api_flutter/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final _height = AppLayout.getHeight(220);
  Matrix4 matrix = Matrix4.identity();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });

    @override
    void dispose() {
      pageController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider section
        SizedBox(
          height: AppLayout.getHeight(320),
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: ((context, position) {
              return _buildPageItem(position);
            }),
          ),
        ),
        //dots
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        //popular text
        Gap(AppLayout.getHeight(30)),
        Container(
          margin: EdgeInsets.only(left: AppLayout.getHeight(30)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              Gap(AppLayout.getHeight(10)),
              Container(
                margin: EdgeInsets.only(bottom: AppLayout.getHeight(3)),
                child: BigText(
                  text: ".",
                  textColor: Colors.black26,
                ),
              ),
              Gap(AppLayout.getHeight(10)),
              Container(
                margin: EdgeInsets.only(bottom: AppLayout.getHeight(2)),
                child: SmallText(
                  text: "Ready takeaways",
                ),
              ),
              //list of foods
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: ((context, index) {
              return Container(
                margin: EdgeInsets.only(
                    bottom: AppLayout.getHeight(10),
                    right: AppLayout.getHeight(20),
                    left: AppLayout.getHeight(20)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                    height: AppLayout.getHeight(110),
                    width: AppLayout.getWidth(110),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppLayout.getHeight(20)),
                        image: const DecorationImage(
                            image: AssetImage("images/f2.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  Expanded(
                    child: Container(
                      height: AppLayout.getHeight(90),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight:
                                  Radius.circular(AppLayout.getHeight(20)),
                              bottomRight:
                                  Radius.circular(AppLayout.getHeight(20)))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppLayout.getHeight(8)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(
                                text: "Finely fried potetos",
                                textSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                              Gap(
                                AppLayout.getHeight(6),
                              ),
                              SmallText(
                                text: "it is small",
                                size: 14,
                              ),
                              Gap(AppLayout.getHeight(10)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  IconWithText(
                                    icon: Icons.circle_sharp,
                                    iconColor: AppColors.iconColor1,
                                    text: "Normal",
                                    iconSize: 15,
                                  ),
                                  IconWithText(
                                    icon: Icons.location_on,
                                    iconColor: AppColors.mainColor,
                                    text: "2,1 km",
                                    iconSize: 15,
                                  ),
                                  IconWithText(
                                    icon: Icons.access_time_rounded,
                                    iconColor: AppColors.iconColor2,
                                    text: "25 min",
                                    iconSize: 15,
                                  ),
                                ],
                              )
                            ]),
                      ),
                    ),
                  )
                ]),
              );
            })),
      ],
    );
  }

  Widget _buildPageItem(int position) {
/* this is method which causes slides of foods to be animated.
It was relocated out of here to below of codes.*/
    animatedSlide(position);

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: _height,
            margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10)),
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("images/f1.jpg"), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(AppLayout.getHeight(30)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: AppLayout.getHeight(120),
              margin: EdgeInsets.only(
                  right: AppLayout.getWidth(20),
                  left: AppLayout.getWidth(20),
                  bottom: AppLayout.getWidth(40)),
              decoration: BoxDecoration(
                  boxShadow: const [
                    /**
                     * first boxShadow is for the bottom of the item
                     * second one is for eliminating redundent shawod from the left side of the item
                     * third one is for eliminating reduntent shadow from the righth side of the item**/
                    BoxShadow(
                        color: AppColors.shadowColor,
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ],
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                  color: Colors.white),
              child: Container(
                  padding: EdgeInsets.only(
                      top: AppLayout.getHeight(15),
                      left: AppLayout.getHeight(15),
                      right: AppLayout.getHeight(15)),
                  child: const RatingBar(
                    bigText: "Delicious Delicacy",
                    ratingUnit: "5",
                    time: "20min",
                    distance: "1,3km",
                    level: "Normal",
                    commentText: "2009 comments",
                    bigTextSize: 26,
                  )),
            ),
          )
        ],
      ),
    );
  }

  void animatedSlide(int position) {
    if (position == _currentPageValue.floor()) {
      var currentScale =
          1 - (_currentPageValue - position) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (position == _currentPageValue.floor() + 1) {
      var currentScale = _scaleFactor +
          (_currentPageValue - position + 1) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (position == _currentPageValue.floor() - 1) {
      var currentScale =
          1 - (_currentPageValue - position) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = 0.8;
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    }
  }
}
