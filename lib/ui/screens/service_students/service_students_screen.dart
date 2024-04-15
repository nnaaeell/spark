import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spark/ui/Cubit1/states.dart';
import 'package:spark/ui/cubit1/cubit.dart';
import 'package:spark/ui/navigation/spark_navigator.dart';
import 'package:spark/ui/screens/screens.dart';
import 'package:spark/ui/screens/student_home/student_home_screen.dart';
import 'package:spark/ui/style/color/spark_colors.dart';
import 'package:spark/ui/style/themes/spark_theme.dart';
import 'package:spark/ui/widgets/drawer.dart';
import 'package:spark/ui/widgets/spark_botton_for_student_services.dart';
import 'package:spark/ui/widgets/widgets.dart';

import '../../widgets/spark_button_N.dart';

class StudentService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return BlocConsumer<Cubit1,Cubit1States>(
      listener: (context,state) {

      },
      builder: (context,state)=>Scaffold(
        appBar: buildSparkAppBar(
          text: "Students Services",
          context: context,
        ),
        endDrawer: SparkDrawer(),
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 70*0.94,
            ),
            ServiceTileIT(
              title: 'Informatics',
              subtitle: 'Engineering',
              image: 'assets/informatics_image1.jpg',
              height: height,
              width: width,
              // Replace with your asset

            ),
            SizedBox(
              height: 20,
            ),
            ServiceTileARCH(
              title: 'Architectural ',
              subtitle: 'Engineering',
              image: 'assets/architectural_image.jpg',
              height: height,
              width: width,// Replace with your asset

            ),
          ],
        ),
      ),

    );
  }
}

class ServiceTileIT extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final double height;
  final double width;


  const ServiceTileIT({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.height,
    required this.width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: height*0.31,
        width: double.infinity.w,

        decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover
            ),
            color: SparkColors.color5,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SparkSizedBox(
                      height: 20,
                    ),
                    text1(title),
                    text2(subtitle),
                    Spacer(),
                    Flexible(
                      child: Row(
                        children: [
                          Spacer(),
                          SparkButtonForStudentsSrevices(onPressed: (){

                             Cubit1.get(context).getProjectsAndCoursesIT();
                             Cubit1.isARCH=false;

                           navigateTo(context,  StudentHomeScreen());

                          },
                          width: width,
                          height: height,
                          backgroundColor:Colors.white,
                          radius:15 ,
                          ),
                        ],
                      ),
                    )



                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class ServiceTileARCH extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final double height;
  final double width;

  const ServiceTileARCH({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.height,
    required this.width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 230*0.94.h,
        width: double.infinity.w,
        decoration: BoxDecoration(
            color: SparkColors.color5,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SparkSizedBox(
                      height: 20,
                    ),
                    text1(title),
                    text2(subtitle),
                    Spacer(),
                    Flexible(
                      child: Row(
                        children: [
                          Spacer(),
                          SparkButtonForStudentsSrevices(onPressed: (){

                              Cubit1.get(context).getProjectsAndCoursesARCH();
                              Cubit1.isARCH=true;
                              navigateTo(context,  StudentHomeScreen());

                          },

                            width: width,
                            height: height,
                            backgroundColor:Colors.white,
                            radius:15 ,
                          ),
                        ],
                      ),
                    )



                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget ImageService(String path)=> Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      height:100*094.h ,
      width: 100*0.86.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

          image: DecorationImage(
              image:AssetImage(path),
              ),

          )
      ) ,
  );
}

Widget text1(String title)=> Text(title,
  style:GoogleFonts.poppins(
    fontSize: 35.sp,
    color: Colors.white
  )
);

Widget text2(String title)=> Text(title,
    style:GoogleFonts.poppins(
        fontSize: 25.sp,
        color: Colors.white
    )
);