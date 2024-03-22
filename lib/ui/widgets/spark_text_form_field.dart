import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/ui/style/themes/spark_theme.dart';
import 'package:spark/ui/widgets/spark_sizedbox.dart';

import '../style/color/spark_colors.dart';


class SparkTextFormField extends StatelessWidget {
  SparkTextFormField({
    this.controller,
    this.type,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.isPassword = false,
    this.validate,
    this.label = "",
    this.title ="",
    this.prefix,
    this.suffix,
    this.isClickable,
    this.style,
    this.hintText,
    this.readonly,
    this.prefixText,
    this.errorText,
    this.onSaved,
    this.maxLines,
  });

  TextEditingController? controller;
  TextInputType? type;
  Function(String value)? onSubmit;
  void Function(String? value)? onSaved;
  void Function(String? value)? onChange;
  void Function()? onTap;
  bool isPassword;
  String? Function(String? value)? validate;
  String label;
  String title;
  Widget? prefix;
  Widget? suffix;
  bool? isClickable = true;
  TextStyle? style;
  String? hintText;
  bool? readonly;
  String? prefixText;
  String? errorText;
  int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style:SparkTheme.lightTextTheme.headlineMedium?.copyWith(fontSize: 15.sp),),
        SparkSizedBox(height: 10,),
        TextFormField(
          controller: controller,
          keyboardType: type,
          obscureText: isPassword,
          validator: validate,
          onChanged: onChange,
          onTap: onTap,
          onSaved: onSaved,
          onFieldSubmitted: onSubmit,
          readOnly: readonly??false,
          maxLines: maxLines?? 1,
          style: SparkTheme.lightTextTheme.bodyLarge!.copyWith(color: SparkColors.color4),
          decoration: InputDecoration(
            prefixText: prefixText,
            hintText: hintText,
            label: Text(label,),
            alignLabelWithHint: true,
            errorText: errorText,
            prefixIcon: prefix,
            suffixIcon: suffix,

          ),
        ),
      ],
    );
  }
}
