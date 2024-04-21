import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spark/data/models/sections.dart';
import 'package:spark/ui/Cubit1/states.dart';
import 'package:spark/ui/cubit1/cubit.dart';
import 'package:spark/ui/navigation/spark_navigator.dart';
import 'package:spark/ui/screens/screens.dart';
import 'package:spark/ui/screens/service_students/cubit/cubit.dart';
import 'package:spark/ui/screens/service_students/cubit/states.dart';
import 'package:spark/ui/screens/student_home/student_home_screen.dart';
import 'package:spark/ui/style/color/spark_colors.dart';
import 'package:spark/ui/style/themes/spark_theme.dart';
import 'package:spark/ui/widgets/drawer.dart';
import 'package:spark/ui/widgets/spark_botton_for_student_services.dart';
import 'package:spark/ui/widgets/widgets.dart';

import '../../widgets/spark_button_N.dart';

class StudentService extends StatefulWidget {
  @override
  State<StudentService> createState() => _StudentServiceState();
}

class _StudentServiceState extends State<StudentService> {
  bool showSpinKit=true;

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return BlocConsumer<CubitSections,SectionsStates>(
      listener: (context,state) {
       if(state is GetSectionsSuccess){
         setState(() {
           showSpinKit=false;
         });
       }
      },
      builder: (context,state)=>Scaffold(
        appBar: buildSparkAppBar(
          text: "Students Services",
          context: context,
        ),
        endDrawer: SparkDrawer(width: width,height: height,),
        body:showSpinKit?Center(child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            SpinKitChasingDots(color:SparkColors.color1,size: 100,),
          ],
        )):
        ListView.separated(itemBuilder:(context,index)=>buildServiceCard(width, height, CubitSections.section_list_for_cubit[index]) ,
            separatorBuilder:(context,index)=>SizedBox(height: 20.h,) ,
            itemCount:CubitSections.section_list_for_cubit.length)
      ),

    );
  }
}

Widget buildServiceCard(double width,double height,Section section)=> BlocConsumer<Cubit1,Cubit1States>(
    builder: (context,state)=>Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: height*0.31,
        width: double.infinity.w,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage(
                placeholder: AssetImage('assets/temp2.png'),
                image: CachedNetworkImageProvider('https://sparkeng.pythonanywhere.com${section.section_image}'
                ),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height*0.01,
                        ),
                        text1(section.section_name),
                        text2('engineering'),
                        SizedBox(
                          height: height*0.04,
                        ),
                        Flexible(
                          child: Row(
                            children: [
                              Spacer(),
                              SparkButtonForStudentsSrevices(onPressed: (){
                                print(section.id);
                                Cubit1.get(context).getProjectsAndCourses(section.id);
                                print(Cubit1.projects.length);
                                navigateTo(context,StudentHomeScreen());

                              },
                                width: width,
                                height: height,
                                backgroundColor:SparkColors.color1,
                                radius:10 ,
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
          ],
        ),
      ),
    ),
    listener: (context,state){});



Widget text1(String title)=> Text(title,
  style:GoogleFonts.poppins(
    fontSize: 35.sp,
    color: SparkColors.color1
  )
);

Widget text2(String title)=> Text(title,
    style:GoogleFonts.poppins(
        fontSize: 25.sp,
        color: SparkColors.color1
    )
);

