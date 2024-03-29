import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/ui/style/color/spark_colors.dart';
import 'package:spark/ui/widgets/spark_app_bar.dart';
import 'package:spark/ui/widgets/spark_button_N.dart';
import 'package:spark/ui/widgets/widgets.dart';

class StudentsFlow extends StatelessWidget {
  const StudentsFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSparkAppBar(context: context),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildImage(imagePath: 'assets/grroup learn.png',height: 290.58  ,width: 290.58  ),
          SparkSizedBox(
            height: 40,
          ),
          buildImage(imagePath: 'assets/Learn with us anywhere with the best experts.png',height:50 ,width:350 ),
          SparkSizedBox(
            height: 80,
          ),
          Flexible(
            child: SparkButtonN(onPressed: (){},
              width: 150,
              height: 40,
              radius: 10,
              backgroundColor: SparkColors.color1,
            ),
          )

        ],
      ) ,
    );
  }
  Widget buildImage({required String imagePath,required double height,required double width})=>Padding(
    padding: EdgeInsets.symmetric(horizontal: 33.4.r),
    child: SizedBox(
      height: height.h,
      width: width.w,
      child: Image(
        image: AssetImage(imagePath),
      ),
    ),
  );
}
