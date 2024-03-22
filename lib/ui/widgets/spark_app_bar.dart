import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

 AppBar buildSparkAppBar({String text="",required BuildContext context}){
    return AppBar(
      title:Text(text),
      leading: IconButton(
        padding: EdgeInsets.all(14.r),
        onPressed: () {Navigator.pop(context);},
        icon: SvgPicture.asset("assets/back_icon.svg",),
      ));
}


