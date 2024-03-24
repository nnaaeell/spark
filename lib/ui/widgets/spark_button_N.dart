import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/color/spark_colors.dart';

class SparkButtonN extends StatelessWidget {
  SparkButtonN({
    this.width = double.infinity,
    required this.height ,
    this.radius = 25,
    this.text = "",
    this.backgroundColor = Colors.blue,
    required this.onPressed,
    super.key,
  });

  double width;
  double height;
  double radius;
  String text;
  Color backgroundColor = SparkColors.color4;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),

      child: Container(
        width: width.w,
        height: height.h,
        child: TextButton(onPressed:(){},
            child:Text('GO IT',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp
              ),)),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius.r),
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  spreadRadius: 0.2,
                  blurRadius: 1,
                  offset: Offset(1, 1)
              )
            ]
        ),
      ),
    );
  }
}