
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:spark/ui/navigation/spark_navigator.dart';
import 'package:spark/ui/screens/screens.dart';
import 'package:spark/ui/screens/service_students/service_students_screen.dart';
import 'package:spark/ui/screens/students_flow/students_flow_screen.dart';
import 'package:spark/ui/style/color/spark_colors.dart';
import 'package:spark/ui/style/themes/spark_theme.dart';
import 'package:spark/ui/widgets/drawer.dart';
import 'package:spark/ui/widgets/spark_app_bar.dart';
import 'package:spark/ui/widgets/spark_sizedbox.dart';

import '../../Cubit1/states.dart';
import '../../cubit1/cubit.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final double height =MediaQuery.of(context).size.height;
    final double width =MediaQuery.of(context).size.width;

    return BlocConsumer<Cubit1,Cubit1States>(
      builder: (BuildContext context, Cubit1States state)=>Scaffold(

        endDrawer: SparkDrawer(),
        body:Stack(
          children: [
            buildBackground(height),
            Column(
              children: [
                buildLogo(width,height),

              ],
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                 SizedBox(
                   height: height*0.26,
                 ),
                  buildTextSpark(width,height)
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: height*0.49,
                ),
                Text('Please choose the Service you Need',
                style:SparkTheme.lightTextTheme.headlineMedium ,
                ),
                SizedBox(
                  height: height*0.03,
                ),
                buildCard(context, 'assets/company_services.png', 'Company services', CompanyServicesScreen()),
                buildCard(context, 'assets/student_services.png', 'Students services', StudentsFlow())
              ],
            )


          ],
        )
      ),
      listener: (BuildContext context, Cubit1States state) {  },

    );
  }

  Widget buildBackground(height)=>Container(
    height:height*0.4 ,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [SparkColors.color1,SparkColors.color12]
        ),
        borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(2000, 700)
        )

    ),
  );

  Widget buildLogo(width,height)=>Container(
    width: width*0.7,
    height: height*0.66,
    child: Image(
      image:AssetImage('assets/spark_logo_home.png',
        ),
    ),
  );

  Widget buildTextSpark(width,height)=>Padding(
    padding:  EdgeInsets.only(right: width*0.15),
    child: Image(
        image:AssetImage('assets/spark_text.png'),
        width: width*0.35,
        height: height*0.15,
    ),
  );

  Widget buildCard(BuildContext context, String image,String title,Widget w) {
    return Padding(
      padding:  EdgeInsets.all(10.0.r),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  spreadRadius: 0.2,
                  blurRadius: 1,
                  offset: Offset(1, 1)
              )
            ],
            borderRadius: BorderRadius.circular(10.r)
        ),
        child: Card(
          color: SparkColors.color1,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          child: Row(

            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardTitle(title),
                 CardBotton(context,w)
                ],
              ),
              Spacer(),
              CardImage(image),

            ],
          ),
        ),
      ),
    );
  }

  Widget CardImage(String image) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w,bottom: 10.r),
      child: Container(
        width: 120.w,
        height: 120.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(96.r))),
        child: Image.asset(image),
      ),
    );
  }

  Widget CardTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Text(
       title,
        style: GoogleFonts.poppins(
          fontSize: 17.0.sp,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
  
  Widget CardBotton(context,w)=>Padding(
    padding:  EdgeInsets.only(left: 20.w),
    child: IconButton(
      padding: EdgeInsets.only(top: 20,left: 10),
      onPressed: () {
        navigateTo(context,  w);
      },
      icon: SvgPicture.asset("assets/botton_home.svg",
        height: 40.h,
        width: 30.h,
      ),
    ),
  );
}