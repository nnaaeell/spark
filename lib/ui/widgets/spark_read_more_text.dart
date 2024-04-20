
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import 'package:spark/ui/style/themes/spark_theme.dart';

import '../style/color/spark_colors.dart';

class SparkReadMoreText extends StatelessWidget {
  SparkReadMoreText({
    this.text = "",
    this.numberOfLines=8,
    this.horizontalPadding=17.5,
    this.verticalPadding=0,
    super.key,
  });
  String text;
  int numberOfLines;
  double verticalPadding;
  double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
       horizontal: horizontalPadding,
       vertical: verticalPadding
      ).w,
      child: ReadMoreText(
        text,
        trimLines: numberOfLines,
        textAlign: TextAlign.left,
        textScaleFactor: 1.r,
        style: SparkTheme.lightTextTheme.bodyLarge?.copyWith(height: 2.0.h,fontSize:14.sp,color: SparkColors.color8),
        colorClickableText: SparkColors.color1,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Show more',
        trimExpandedText: ' Show less',
      ),
    );
  }
}
