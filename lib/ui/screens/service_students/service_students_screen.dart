import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/ui/Cubit1/states.dart';
import 'package:spark/ui/cubit1/cubit.dart';
import 'package:spark/ui/navigation/spark_navigator.dart';
import 'package:spark/ui/screens/screens.dart';
import 'package:spark/ui/screens/student_home/student_home_screen.dart';
import 'package:spark/ui/style/color/spark_colors.dart';
import 'package:spark/ui/style/themes/spark_theme.dart';
import 'package:spark/ui/widgets/widgets.dart';

import '../../widgets/spark_button_N.dart';

class StudentService extends StatelessWidget {
  static bool isSelectedIT=false;
  static bool isSelectedARCH=false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=>Cubit1(),
    child: BlocConsumer<Cubit1,Cubit1States>(
      listener: (context,state) {

      },
      builder: (context,state)=>Scaffold(
        appBar: buildSparkAppBar(
          text: "Students Services",
          context: context,
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 70*0.94,
            ),
            ServiceTileIT(
              title: 'Informatics',
              subtitle: 'Courses & Project',
              image: 'assets/Informatics.png', // Replace with your asset

            ),
            SizedBox(
              height: 20,
            ),
            ServiceTileARCH(
              title: 'Architectural Engineering',
              subtitle: 'Courses & Project',
              image: 'assets/Architectural Engineering.png', // Replace with your asset

            ),
          ],
        ),
      ),

    ),
    );
  }
}

class ServiceTileIT extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const ServiceTileIT({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 130*0.94,
        width: double.infinity.w,
        decoration: BoxDecoration(
            color: SparkColors.color5,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            ImageService(image),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                      style: SparkTheme.lightTextTheme.titleMedium,
                    ),
                    Text(title,
                      style: SparkTheme.lightTextTheme.bodyLarge,
                    ),

                    Flexible(
                      child: SparkButtonN(onPressed: (){
                       if(!StudentService.isSelectedIT){
                         Cubit1.get(context).getProjectsAndCoursesIT();
                         StudentService.isSelectedIT=true;
                         StudentService.isSelectedARCH=false;
                       }
                       navigateTo(context,  StudentHomeScreen());

                      },
                      width: 100,
                      height: 40,
                      backgroundColor: SparkColors.color1,
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
              image: AssetImage(path),
              fit: BoxFit.cover
          )
      ) ,
    ),
  );
}

class ServiceTileARCH extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const ServiceTileARCH({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 130*0.94,
        width: double.infinity.w,
        decoration: BoxDecoration(
            color: SparkColors.color5,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            ImageService(image),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                      style: SparkTheme.lightTextTheme.titleMedium,
                    ),
                    Text(title,
                      style: SparkTheme.lightTextTheme.bodyLarge,
                    ),

                    Flexible(
                      child: SparkButtonN(onPressed: (){
                        if( !StudentService.isSelectedARCH){
                          Cubit1.get(context).getProjectsAndCoursesARCH();
                          StudentService.isSelectedARCH=true;
                          StudentService.isSelectedIT=false;
                        }
                        navigateTo(context,  StudentHomeScreen());
                        print(Cubit1.projects.length);
                      },
                        width: 100,
                        height: 40,
                        backgroundColor: SparkColors.color1,
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