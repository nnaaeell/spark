import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/ui/cubit1/cubit.dart';
import 'package:spark/ui/screens/screens.dart';
import 'package:spark/ui/screens/service_students/service_students_screen.dart';
import 'package:spark/ui/style/color/spark_colors.dart';
import 'package:spark/ui/widgets/drawer.dart';
import 'package:spark/ui/widgets/spark_app_bar.dart';
import 'package:spark/ui/widgets/spark_button_N.dart';
import 'package:spark/ui/widgets/widgets.dart';

import '../../Cubit1/states.dart';
import '../../navigation/spark_navigator.dart';

class StudentsFlow extends StatelessWidget {
  const StudentsFlow({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return BlocConsumer<Cubit1,Cubit1States>(
      listener: (context,state){

      },
      builder: (context,state)=>Scaffold(
        appBar: buildSparkAppBar(context: context),
        endDrawer:SparkDrawer(width: width,height: height,),
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildImage(imagePath: 'assets/grroup learn.png',height: 290.58  ,width: 290.58  ),
            SparkSizedBox(
              height: 60,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 60.w,right: 40.w),
              child: buildText(context),
            ),
            SparkSizedBox(
              height: 60,
            ),
            Flexible(
              child: SparkButtonN(onPressed: (){
                navigateTo(context,  StudentService());
              },
                width: 150,
                height: 40,
                radius: 10,
                backgroundColor: SparkColors.color1,
              ),
            )

          ],
        ) ,
      ),
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

  Widget buildText(context)=>RichText(
      text:TextSpan(
          children: [
            TextSpan(
              text: 'Learn with us anywhere with the best',

              style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,

              ),
            ),
            TextSpan(
                text: ' experts',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,

                ),
                recognizer: TapGestureRecognizer()..onTap=(){

                }
            ),

          ]
      )
  );
}
