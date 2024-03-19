import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../style/color/spark_colors.dart';

class SparkButton extends StatelessWidget {
  SparkButton({
    this.width = double.infinity,
    this.height = 52,
    this.radius = 25,
    this.text = "",
    this.backgroundColor = Colors.blue,
    this.borderColor = Colors.blue,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
    this.borderWidth = 2,
    this.textStyle,
    required this.onPressed,
    this.iconSize,
    this.icon,
    super.key,
  });

  double width;
  double height;
  double radius;
  String text;
  Color backgroundColor = SparkColors.color4;
  Color borderColor;
  Color iconColor;
  double borderWidth;
  Color textColor;
  TextStyle? textStyle;
  IconData? icon;
  double? iconSize;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width.w,
        height: height.h,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius.r),
          border: Border.all(width: borderWidth.w, color: borderColor),
        ),
        child: MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          child: Row(
            children: [
              if(text.isNotEmpty)
              Expanded(
                child: Text(
                  textAlign: TextAlign.center,
                  text,
                  style: textStyle ??
                      TextStyle(
                        color: textColor,
                      ),
                ),
              ),
              if (icon != null)
                Expanded(
                  child: Icon(
                    icon,
                    size: iconSize?.r,
                    color: iconColor,
                  ),
                ),
            ],
          ),
        ));
  }
}
