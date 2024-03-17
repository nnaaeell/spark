import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:spark/ui/style/color/spark_colors.dart';
import 'package:spark/ui/widgets/spark_sizedbox.dart';
import '../../constants/onboarding_data.dart';
import '../../style/themes/spark_theme.dart';
import '../../widgets/widgets.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  PageController onBoardingController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.r,
      ),
      body: ListView(
        children: [
          SparkSizedBox(
            height: 91.015,
          ),
          SizedBox(
            height: 432.h,
            child: PageView.builder(
              itemBuilder: (BuildContext context, int index) =>
                  buildBoardingItem(context, index),
              itemCount: pages.length,
              controller: onBoardingController,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (int index) {},
            ),
          ),
          SparkSizedBox(
            height: 118.57,
          ),
          Row(
            children: [
              SparkSizedBox(
                width: 26.72,
              ),
              SmoothPageIndicator(
                  controller: onBoardingController,
                  count: 3,
                  effect: CustomizableEffect(
                      activeDotDecoration: DotDecoration(
                          width: 27.28.w,
                          height: 5.01.h,
                          color: SparkColors.color1,
                          borderRadius: BorderRadius.circular(8.r)),
                      dotDecoration: DotDecoration(
                          color: SparkColors.color5,
                          borderRadius: BorderRadius.circular(8.r),
                          width: 6.68.w,
                          height: 5.01.h),
                      spacing: 10.r)),
              SparkSizedBox(
                width: 198,
              ),
              SparkButton(
                onPressed: () {},
                width: 33.4,
                height: 33.4,
                radius: 5,
                backgroundColor: SparkColors.color1,
                borderWidth: 0,
                icon: Icons.arrow_right_alt_outlined,
                iconSize: 35,
              ),
              SparkSizedBox(
                width: 30.895,
              )
            ],
          ),
        ],
      ),
    );
  }

  buildBoardingItem(BuildContext context, int index) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 33.4.r),
          child: SizedBox(
            height: 290.58.h,
            width: 290.58.w,
            child: Image(
              image: AssetImage(pages[index].imagePath),
            ),
          ),
        ),
        SparkSizedBox(
          height: 41.75,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.71.r),
          child: Text(
            pages[index].title,
            style: SparkTheme.lightTextTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
        ),
        SparkSizedBox(
          height: 7.515,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 53.r),
          child: Text(
            pages[index].description,
            style: SparkTheme.lightTextTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
