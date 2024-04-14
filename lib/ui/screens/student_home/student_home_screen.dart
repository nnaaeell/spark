

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:spark/data/models/Student_services.dart';
import 'package:spark/ui/Cubit1/states.dart';
import 'package:spark/ui/cubit1/cubit.dart';
import 'package:spark/ui/style/color/spark_colors.dart';
import 'package:spark/ui/widgets/drawer.dart';
import 'package:spark/ui/widgets/spark_app_bar.dart';
import 'package:spark/ui/widgets/spark_sizedbox.dart';

import '../../navigation/spark_navigator.dart';
import '../student_course_request/student_course_request_screen.dart';
import '../student_project_request/student_project_request_screen.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  _StudentHomeScreenState createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {

  @override
  void initState() {
    // TODO: implement initState

    _loadScreen();
  }
  // Index for segmented control
   int _selectedIndex = 0;
   bool showSpinKit=true;

   _loadScreen() async {
     // انتظر لمدة ثلاث ثواني
     await Future.delayed(Duration(seconds: 2));

     // بعد انتهاء الفترة، قم بتحديث حالة العرض لعرض العناصر الأساسية
     setState(() {
       showSpinKit = false;
     });
   }



  // List of widgets for segmented control

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSparkAppBar(
        text: "Our Services",
        context: context,
      ),
      endDrawer:SparkDrawer(),
      body: Column(
        children: <Widget>[
          // Segmented control for 'project' and 'Courses'
          Padding(
            padding:  EdgeInsets.all(10.0.r),
            child: Container(
              width: 330.w,
              decoration: BoxDecoration(
                  color: SparkColors.color1,
                  borderRadius: BorderRadius.circular(8.r)

              ),
              child: Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 6.w,bottom:6.h,top: 6.h),
                    child: Container(
                      width: 150.w,

                      child: TextButton(onPressed:(){
                        setState(() {
                          _selectedIndex=0;

                        });
                      },
                          child:Text('project',
                            style: TextStyle(
                                color:_selectedIndex==0? SparkColors.color1:Colors.white,
                                fontWeight: FontWeight.bold
                            ),)),
                      decoration: BoxDecoration(
                          color:_selectedIndex==0? Colors.white:SparkColors.color1,
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                  SparkSizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6,bottom:6,top: 6),
                    child: Container(
                      width: 150.w,

                      child: TextButton(onPressed:(){
                        setState(() {
                          _selectedIndex=1;
                        });
                      },
                          child:Text('course',
                            style: TextStyle(
                                color:_selectedIndex==0? Colors.white:SparkColors.color1,
                                fontWeight: FontWeight.bold
                            ),)),
                      decoration: BoxDecoration(
                          color:_selectedIndex==0?SparkColors.color1:Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                ],
              ),

            ),
          ),

         _selectedIndex==0? ProjectsList():CoursesList()


          // 'GO IT' button

        ],
      ),
    );
  }


  Widget ProjectsList()=>showSpinKit?Center(child: Column(
    children: [
      SizedBox(
        height: 200,
      ),
      SpinKitChasingDots(color:SparkColors.color1,size: 100,),
    ],
  ))
      :Flexible(
    child: ListView.separated(itemBuilder: (context,index)=>buildItemOfTheListP(Cubit1.projects[index]),
        separatorBuilder:(context,index)=>SizedBox(height: 20.h,),
        itemCount: Cubit1.projects.length),
  );

  Widget CoursesList()=> Flexible(
    child: ListView.separated(itemBuilder: (context,index)=>buildItemOfTheListC(Cubit1.courses[index]),
        separatorBuilder:(context,index)=>SizedBox(height: 20.h,),
        itemCount: Cubit1.courses.length),
  );

  Widget buildItemOfTheListP(Project project)=>Padding(

    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height:250.h ,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage('https://sparkeng.pythonanywhere.com${project.pictures[0].image}',
                  ),
                  fit: BoxFit.cover
              )
          ) ,
        ),
        SparkSizedBox(
          height: 10,
        ),// Your image asset
        Text(
          project.projectField!.ar,
          style: TextStyle(
              fontSize: 20),
        ),
        SparkSizedBox(
          height: 10,
        ),
        Text(
          project.projectName!.ar,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
        ),
        SparkSizedBox(
          height: 10,
        ),
        Text(
         project.projectDesc!.ar,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),

          child: Container(
            width: 90.w,
            decoration: BoxDecoration(
                color: SparkColors.color1,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      spreadRadius: 0.2,
                      blurRadius: 1,
                      offset: Offset(1, 1)
                  )
                ]
            ),

            child: TextButton(onPressed:(){
              navigateTo(context,StudentProjectRequestScreen(id: project.id));
            },
                child:Text('GO IT',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        line()
      ],
    ),
  );

  Widget buildItemOfTheListC(Course course )=>Padding(

     padding: const EdgeInsets.all(20.0),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
         Container(
           height:250.h ,
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               image: DecorationImage(
                   image: NetworkImage('https://sparkeng.pythonanywhere.com${course.image}',
                   ),
                   fit: BoxFit.cover
               )
           ) ,
         ),
         SparkSizedBox(
           height: 10,
         ),// Your image asset
         Text(
           course.teacher!.ar,
           style: TextStyle(
               fontSize: 20),
         ),
         SparkSizedBox(
           height: 10,
         ),
         Text(
          course.name!.ar,
           style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
         ),
         SparkSizedBox(
           height: 10,
         ),
         Text(
           course.desc!.ar,
         ),
         Padding(
           padding: const EdgeInsets.only(top: 20),

           child: Container(
             width: 90.w,
             decoration: BoxDecoration(
                 color: SparkColors.color1,
                 borderRadius: BorderRadius.circular(20),
                 boxShadow: [
                   BoxShadow(
                       color: Colors.black,
                       spreadRadius: 0.2,
                       blurRadius: 1,
                       offset: Offset(1, 1)
                   )
                 ]
             ),

             child: TextButton(onPressed:(){
               navigateTo(context,StudentCourseRequestScreen(id:course.id));
             },
                 child:Text('GO IT',
                   style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold
                   ),)),
           ),
         ),
         SizedBox(
           height: 20,
         ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           child: Container(
             height: 2.h,
             color: Colors.black38,
           ),
         )
       ],
     ),
   );

  Widget line()=>Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      height: 2.h,
      color: Colors.black38,
    ),
  );


}