import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/ui/style/color/spark_colors.dart';
import 'package:spark/ui/style/themes/spark_theme.dart';
import 'package:spark/ui/widgets/spark_sizedbox.dart';

import '../../widgets/spark_app_bar.dart';

class OurTeam extends StatelessWidget {
  const OurTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:buildSparkAppBar(context: context,
       text: 'Our team'
      ),
      body: ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (context,index)=>buildItemOfOurTeam(),
              separatorBuilder:(context,index)=>SizedBox(height: 20.h,),
              itemCount: 3)

    );
  }

  Widget buildItemOfOurTeam()=>Padding(
    padding: EdgeInsets.all(40.0.r),
    child: Container(
      height: 500,
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
          BoxShadow(
          color: Colors.black,
          spreadRadius: 0.2,
          blurRadius: 1,
          offset: Offset(1, 1)
      )
        ]
      ),
      child: Stack(
        children: [
          Container(
            height: 150.h,
            width: double.infinity.w,
// alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image:DecorationImage(
                    image: NetworkImage('https://media.istockphoto.com/id/1439425791/nl/foto/digital-technology-software-development-concept-coding-programmer-working-on-laptop-with.jpg?s=2048x2048&w=is&k=20&c=lfOt2EUOtx6vnds-JaffxMsuYsVha5Me09ls7WwdXv0=',
                    ),
                    fit: BoxFit.cover
                )
            ),
          ),
          Column(
            children: [
              SizedBox(height: 100.h,),
              Expanded(
                child: Container(
                  width: double.infinity.w,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20.r),bottomRight:Radius.circular(20.r), ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60.h,
                      ),
                      Text('Nael',
                        style: SparkTheme.lightTextTheme.titleMedium,),
                      SparkSizedBox(
                        height: 10,
                      ),
                      Text('software engineer',
                        style: SparkTheme.lightTextTheme.titleSmall,),
                      SparkSizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('From automation to advanced analytics and seamless experiences, we can embed AI in business. We’ll'
                            ' deliver new operating models and '
                            'strategic intelligence for smart processes and data-driven decisions.',
                        style: SparkTheme.lightTextTheme.bodyMedium,
                        ),
                      )
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Center(
                child: Container(
                  height:100.h ,
                  width:100.w ,
                  child: CircleAvatar(
                      child: Image.asset('assets/onboarding1.png')),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
