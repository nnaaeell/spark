import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spark/ui/style/color/spark_colors.dart';

void showToast({
  required String message,

}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor:SparkColors.color3,
      textColor: Colors.white,
      fontSize: 16.0.sp
  );
}