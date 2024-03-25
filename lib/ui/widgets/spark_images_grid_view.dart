
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/ui/navigation/spark_navigator.dart';
import 'package:spark/ui/screens/our_projects/project_expanded_screen.dart';

import '../style/color/spark_colors.dart';
import '../style/themes/spark_theme.dart';

class SparkImagesGridView extends StatelessWidget {
  const SparkImagesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){navigateTo(context, const ProjectExpandedScreen());},
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          width: 360.w,
          height: 300.h,
          child:
              buildMediaGridView(List.generate(6, (index) => buildGridImage()))),
    );
  }

  Widget buildMediaGridView(List<Widget> items) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    final int itemCount = items.length;
    final int remainingCount = itemCount - 4;

    switch (itemCount) {
      case 1:
        return buildGridForOneItem(items);
      case 2:
        return buildGridForTwoItems(items);
      case 3:
        return buildGridForThreeItems(items);
      case 4:
        return buildGridForFourItems(items);
      case 5:
        return buildGridForFiveItems(items);
      default:
        return buildGridForMoreThanFiveItems(items, remainingCount);
    }
  }

  Widget buildGridForOneItem(List<Widget> items) {
    return SizedBox(
      height: 300.h,
      width: 360.w,
      child: items[0],
    );
  }

  Widget buildGridForTwoItems(List<Widget> items) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.only(bottom: 2.5).h,
        height: 145.h,
        width: 360.w,
        child: items[0],
      ),
      Container(
        padding: const EdgeInsets.only(top: 2.5).h,
        height: 145.h,
        width: 360.w,
        child: items[1],
      ),
    ]);
  }

  Widget buildGridForThreeItems(List<Widget> items) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.only(bottom: 5).w,
        height: 150.h,
        width: 360.w,
        child: items[0],
      ),
      Row(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 2.5).w,
            height: 150.h,
            width: 175.w,
            child: items[1],
          ),
          Container(
            padding: const EdgeInsets.only(left: 2.5).w,
            height: 150.h,
            width: 175.w,
            child: items[2],
          ),
        ],
      ),
    ]);
  }

  Widget buildGridForFourItems(List<Widget> items) {
    return Column(children: [
      Row(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 2.5, bottom: 2.5).r,
            height: 150.h,
            width: 175.w,
            child: items[0],
          ),
          Container(
            padding: const EdgeInsets.only(left: 2.5, bottom: 2.5).r,
            height: 150.h,
            width: 175.w,
            child: items[1],
          ),
        ],
      ),
      Row(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 2.5, top: 2.5).r,
            height: 150.h,
            width: 175.w,
            child: items[2],
          ),
          Container(
            padding: const EdgeInsets.only(left: 2.5, top: 2.5).r,
            height: 150.h,
            width: 175.w,
            child: items[3],
          ),
        ],
      ),
    ]);
  }

  Widget buildGridForFiveItems(List<Widget> items) {
    return Column(children: [
      Row(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 2.5, bottom: 2.5).r,
            height: 150.h,
            width: 175.w,
            child: items[0],
          ),
          Container(
            padding: const EdgeInsets.only(left: 2.5, bottom: 2.5).r,
            height: 150.h,
            width: 175.w,
            child: items[1],
          ),
        ],
      ),
      Row(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 2.5, top: 2.5).r,
            height: 150.h,
            width: 116.6.w,
            child: items[2],
          ),
          Container(
            padding: const EdgeInsets.only(left: 2.5, top: 2.5, right: 2.5).r,
            height: 150.h,
            width: 116.6.w,
            child: items[3],
          ),
          Container(
            padding: const EdgeInsets.only(left: 2.5, top: 2.5).r,
            height: 150.h,
            width: 116.6.w,
            child: items[4],
          ),
        ],
      ),
    ]);
  }

  Widget buildGridForMoreThanFiveItems(List<Widget> items, int remainingCount) {
    return Column(children: [
      Row(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 2.5, bottom: 2.5).r,
            height: 150.h,
            width: 175.w,
            child: items[0],
          ),
          Container(
            padding: const EdgeInsets.only(left: 2.5, bottom: 2.5).r,
            height: 150.h,
            width: 175.w,
            child: items[1],
          ),
        ],
      ),
      Row(children: [
        Container(
          padding: const EdgeInsets.only(right: 2.5, top: 2.5).r,
          height: 150.h,
          width: 116.6.w,
          child: items[2],
        ),
        Container(
          padding: const EdgeInsets.only(left: 2.5, top: 2.5, right: 2.5).r,
          height: 150.h,
          width: 116.6.w,
          child: items[3],
        ),
        Container(
            padding: const EdgeInsets.only(left: 2.5, top: 2.5).r,
            height: 150.h,
            width: 116.6.w,
            child: Stack(
              children: [
                items[4],
                Container(
                  decoration: BoxDecoration(
                    color: SparkColors.color2.withOpacity(0.4),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '+$remainingCount',
                    style: SparkTheme.lightTextTheme.headlineLarge
                        ?.copyWith(color: SparkColors.color2),
                  ),
                ),
              ],
            ))
      ])
    ]);
  }

  Widget buildGridImage() {
    return Container(
      width: 360.w,
      height: 360.w,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/memory_app/17.png",
              ),
              fit: BoxFit.cover)),
    );
  }
}
