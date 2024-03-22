import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/ui/style/color/spark_colors.dart';
import 'package:spark/ui/widgets/widgets.dart';

import '../style/themes/spark_theme.dart';

class SparkDropDownButtonFormField extends StatelessWidget {
  SparkDropDownButtonFormField(
      {super.key,
        this.onChanged,
        this.onTap,
        this.validate,
        this.label = "",
        this.prefix,
        this.suffix,
        this.isClickable,
        this.style,
        this.hintText,
        this.readonly,
        this.value,
        this.title="",
        required this.items});

  void Function(String?)? onChanged;
  void Function()? onTap;
  String? Function(String? value)? validate;
  String label;
  Widget? prefix;
  Widget? suffix;
  bool? isClickable = true;
  TextStyle? style;
  String title;
  String? hintText;
  bool? readonly;
  List<String> items;
  String? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style:SparkTheme.lightTextTheme.headlineMedium?.copyWith(fontSize: 15.sp),),
        SparkSizedBox(height: 10,),
        DropdownButtonFormField<String>(
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
          validator: validate,
          value: value,
          onTap: onTap,
          style: SparkTheme.lightTextTheme.bodyLarge!.copyWith(color: SparkColors.color4),
          decoration: InputDecoration(
            hintText: hintText,
            label: Text(label),
            prefixIcon: prefix,
            suffixIcon: suffix,
          ),
        ),
      ],
    );
  }
}
