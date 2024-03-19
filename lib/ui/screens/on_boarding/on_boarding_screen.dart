import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:spark/ui/main_screen.dart';
import 'package:spark/ui/navigation/spark_navigator.dart';
import 'package:spark/ui/style/color/spark_colors.dart';
import '../../constants/onboarding_data.dart';
import '../../style/themes/spark_theme.dart';
import '../../widgets/widgets.dart';
import '../categories/categories_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _onBoardingController = PageController();

  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _onBoardingController.addListener(() {
      setState(() {
        _currentPage = _onBoardingController.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SparkSizedBox(height: 91.015),
          buildPageView(),
          SparkSizedBox(height: 118.57),
          buildOnBoardingBottomPart()
        ],
      ),
    );
  }

  buildOnBoardingItem(BuildContext context, int index) {
    return Column(
      children: [
        buildOnBoardingImage(index),
        SparkSizedBox(height: 41.75),
        buildOnBoardingTitle(index),
        SparkSizedBox(height: 7.515),
        buildOnBoardingDescription(index)
      ],
    );
  }

  Widget buildPageView() {
    return SizedBox(
      height: 432.h,
      child: PageView.builder(
        itemBuilder: (BuildContext context, int index) =>
            buildOnBoardingItem(context, index),
        itemCount: pages.length,
        controller: _onBoardingController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (int index) {},
      ),
    );
  }

  Widget buildOnBoardingBottomPart() {
    return Row(
      children: [
        SparkSizedBox(width: 26.72),
        buildSmoothPageIndicator(),
        SparkSizedBox(width: (_currentPage == 2) ? 185 : 213),
        buildOnBoardingButton(),
        SparkSizedBox(width: (_currentPage != 2) ? 26 : 0)
      ],
    );
  }

  Widget buildOnBoardingButton() {

      return (_currentPage == 2)?SparkButton(
        onPressed: () {
          navigateTo(context, const CategoriesScreen());
        },
        text: "Get Started",
        textStyle: SparkTheme.lightTextTheme.bodyLarge?.copyWith(
          color: SparkColors.color2,
        ),
        width: 122.745,
        borderWidth: 0,
        height: 43.42,
        radius: 5,
        backgroundColor: SparkColors.color1,
      ):SparkButton(
        onPressed: () {
          _onBoardingController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut);
        },
        width: 33.4,
        height: 33.4,
        radius: 5,
        backgroundColor: SparkColors.color1,
        borderWidth: 0,
        icon: Icons.arrow_right_alt_outlined,
        iconSize: 35,
      );

  }

  Widget buildSmoothPageIndicator() {
    return (_currentPage != 2)
        ? SmoothPageIndicator(
        controller: _onBoardingController,
        count: 2,
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
            spacing: 10.r))
        : const SizedBox.shrink();
  }

  Widget buildOnBoardingImage(index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 33.4.r),
      child: SizedBox(
        height: 290.58.h,
        width: 290.58.w,
        child: Image(
          image: AssetImage(pages[index].imagePath),
        ),
      ),
    );
  }

  Widget buildOnBoardingTitle(index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.71.r),
      child: Text(
        pages[index].title,
        style: SparkTheme.lightTextTheme.headlineLarge,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildOnBoardingDescription(index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 53.r),
      child: Text(
        pages[index].description,
        style: SparkTheme.lightTextTheme.bodyLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}
