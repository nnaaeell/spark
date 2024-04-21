import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/ui/style/color/spark_colors.dart';

class SparkButtonForStudentsSrevices extends StatelessWidget {
  SparkButtonForStudentsSrevices({
    required this.width,
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
        width: width*0.4,
        height: height*0.06,
        child: TextButton(onPressed:onPressed,
            child:Text('Get Started',
              style: TextStyle(
                  color:Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp
              ),)),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius.r),
            boxShadow: [
              BoxShadow(
                  color: Colors.white,
                  spreadRadius: 0.2,
                  blurRadius: 1,
                  offset: Offset(0.3, 0.2)
              )
            ]
        ),
      ),
    );
  }
}