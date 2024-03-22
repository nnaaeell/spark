

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/ui/constants/categories_data.dart';
import 'package:spark/ui/screens/category_details/category_details_screen.dart';
import 'package:spark/ui/style/color/spark_colors.dart';
import 'package:spark/ui/style/themes/spark_theme.dart';
import 'package:spark/ui/widgets/spark_sizedbox.dart';

import '../../navigation/spark_navigator.dart';
import '../../widgets/spark_app_bar.dart';
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSparkAppBar(
        text: "Our Services",
        context: context,
      ),
      body: ListView(
        primary: true,
        shrinkWrap: true,
        children: [
          SparkSizedBox(height: 3),
          buildOurServicesImage(),
          SparkSizedBox(height: 5),
          buildOurServicesGridView(),
          SparkSizedBox(height: 35),
        ],
      ),
    );
  }

  Widget buildOurServicesImage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 51.w),
      child: SizedBox(
          height: 254.h,
          width: 254.w,
          child: Image.asset('assets/categories_picture.png')),
    );
  }

  Widget buildOurServicesGridView() {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.3,
            crossAxisSpacing: 24.w,
            mainAxisSpacing: 18.h,
            mainAxisExtent: 135.h),
        itemCount: categories.length,
        itemBuilder: (context, index) => buildServiceCard(index, context));
  }

  Widget buildServiceCard(int index, BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(
            context,
            CategoryDetailsScreen(
              title: categories[index].title,
              imagePath: categories[index].imagePath,
            ));
      },
      child: Card(
        color: SparkColors.color2,
        shadowColor: SparkColors.color7,
        elevation: 11.r,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCardImage(index),
            buildCardTitle(index),
          ],
        ),
      ),
    );
  }

  Widget buildCardImage(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 15.h),
      child: Container(
        width: 46.w,
        height: 46.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(96.r))),
        child: Image.asset(categories[index].imagePath),
      ),
    );
  }

  Widget buildCardTitle(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Text(
        categories[index].title,
        style: SparkTheme.lightTextTheme.headlineSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}