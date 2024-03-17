
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SparkSizedBox extends StatelessWidget {
  SparkSizedBox({super.key,this.width,this.height});
  double? width;
  double? height;
  @override
  Widget build(BuildContext context) {
    if(width!=null&&height!=null){
      return SizedBox(width: width!.w,height: height!.h,);
    }
    else if(width!=null){
      return SizedBox(width: width!.w);
    }
    else {
      return  SizedBox(height: height!.h,);
    }
  }
}



