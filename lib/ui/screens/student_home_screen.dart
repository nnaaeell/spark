

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/ui/style/color/spark_colors.dart';
import 'package:spark/ui/widgets/spark_app_bar.dart';
import 'package:spark/ui/widgets/spark_sizedbox.dart';

class StudentHomeScreen extends StatefulWidget {
  @override
  _StudentHomeScreenState createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  // Index for segmented control
  int _selectedIndex = 0;

  // List of widgets for segmented control

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSparkAppBar(
        text: "Our Services",
        context: context,
      ),
      body: Column(
        children: <Widget>[
          // Segmented control for 'project' and 'Courses'
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 330.w,
              decoration: BoxDecoration(
                  color: SparkColors.color1,
                  borderRadius: BorderRadius.circular(8)

              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6,bottom:6,top: 6),
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
          Flexible(
            child: ListView.separated(itemBuilder: (context,index)=>builtItemOfTheList(),
                separatorBuilder:(context,index)=>SizedBox(height: 20.h,),
                itemCount: 8),
          )


          // 'GO IT' button

        ],
      ),
    );
  }

  Widget builtItemOfTheList()=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height:250.h ,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),

              image: DecorationImage(
                  image: NetworkImage('https://media.istockphoto.com/id/1439425791/nl/foto/digital-technology-software-development-concept-coding-programmer-working-on-laptop-with.jpg?s=2048x2048&w=is&k=20&c=lfOt2EUOtx6vnds-JaffxMsuYsVha5Me09ls7WwdXv0=',
                  ),
                  fit: BoxFit.cover
              )
          ) ,
        ),
        SparkSizedBox(
          height: 10,
        ),// Your image asset
        Text(
          'Mobile Design ',
          style: TextStyle(
              fontSize: 20),
        ),
        SparkSizedBox(
          height: 10,
        ),
        Text(
          'Business Landing Page Design',
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
        ),
        SparkSizedBox(
          height: 10,
        ),
        Text(
          'From automation to advanced analytics and seamless experiences, we can embed AI in business. We’ll deliver new operating models and strategic intelligence for smart processes and data-driven decisions.',
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),

          child: Container(
            width: 90.w,

            child: TextButton(onPressed:(){},
                child:Text('GO IT',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),)),
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


}