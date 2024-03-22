
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import 'package:spark/ui/style/themes/spark_theme.dart';

import '../style/color/spark_colors.dart';

class SparkReadMoreText extends StatelessWidget {
  SparkReadMoreText({
    this.text = "",
    super.key,
  });
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 17.5,
        right: 17.5,
      ).r,
      child: ReadMoreText(
        text,
        trimLines: 8,
        textAlign: TextAlign.left,
        textScaleFactor: 1.r,
        style: SparkTheme.lightTextTheme.bodyLarge?.copyWith(height: 2.0.h,fontSize:14.sp,color: SparkColors.color8),
        colorClickableText: SparkColors.color3,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Show more',
        trimExpandedText: ' Show less',
      ),
    );
  }
}
