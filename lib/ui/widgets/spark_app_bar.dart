import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

 AppBar buildSparkAppBar({String text="", required BuildContext context,bool hasBackButton=true,bool hasDrawer=true}){
    return AppBar(
      title:Text(text),
      leading:(hasBackButton)?IconButton(
        padding:  EdgeInsets.only(top: 5.h,left: 10.w),
        onPressed: () {Navigator.pop(context);},
        icon: SvgPicture.asset("assets/back_icon.svg",
          height: 30.h,
          width: 20.h,
          ),
      ):const SizedBox.shrink(),
      actions: [
        if(hasDrawer)Builder(
          builder: (context) => IconButton(
            padding: EdgeInsets.only(top: 5.h,right: 10.w),
            icon: SvgPicture.asset('assets/Sorting_Right.svg',
            height: 30.h,
            width: 20.h,

            ), // يمكنك تغيير الأيقونة هنا
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
      ],
    );

}


