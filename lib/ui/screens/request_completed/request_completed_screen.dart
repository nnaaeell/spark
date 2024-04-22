import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/ui/navigation/spark_navigator.dart';
import 'package:spark/ui/screens/on_boarding/on_boarding_screen.dart';
import 'package:spark/ui/style/color/spark_colors.dart';
import 'package:spark/ui/style/themes/spark_theme.dart';
import 'package:spark/ui/widgets/spark_sizedbox.dart';

import '../../widgets/spark_button.dart';
import '../screens.dart';

class RequestCompletedScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SparkSizedBox(height: 250),
          buildRequestCompletedImage(),
          SparkSizedBox(height: 7.5),
          buildRequestCompletedText(),
          SparkSizedBox(height: 42),
          buildRequestCompletedButton(context)
        ],
      ),
    );
  }

  Widget buildRequestCompletedImage() {
    return Center(
      child: SizedBox(
        width: 125.w,
        height: 125.h,
        child: Image.asset("assets/request_completed.png"),
      ),
    );
  }

  Widget buildRequestCompletedText() {
    return Text("Request Completed",
        style: SparkTheme.lightTextTheme.bodyLarge
            ?.copyWith(color: SparkColors.color9));
  }

  Widget buildRequestCompletedButton(BuildContext context) {
    return SparkButton(
      width: 191,
      height: 41,
      radius: 7,
      backgroundColor: SparkColors.color1,
      text: "Back to home",
      textStyle: SparkTheme.lightTextTheme.bodyLarge
          ?.copyWith(color: SparkColors.color2),
      onPressed: () {
        navigateReplace(context, HomeScreen());
      },
    );
  }
}
