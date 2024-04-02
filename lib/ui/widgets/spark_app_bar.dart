import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

 AppBar buildSparkAppBar({String text="",required BuildContext context,bool hasBackButton=true}){
    return AppBar(
      title:Text(text),
      leading:(hasBackButton)?IconButton(
        padding: EdgeInsets.only(top: 20,left: 10),
        onPressed: () {Navigator.pop(context);},
        icon: SvgPicture.asset("assets/back_icon.svg",
          height: 30.h,
          width: 20.h,
          ),
      ):const SizedBox.shrink(),
      actions: [
        Builder(
          builder: (context) => IconButton(
            padding:EdgeInsets.only(top: 20,right: 10),
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


