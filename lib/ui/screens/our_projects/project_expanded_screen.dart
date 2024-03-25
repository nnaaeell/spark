import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/ui/widgets/widgets.dart';
import '../../style/color/spark_colors.dart';
import '../../style/themes/spark_theme.dart';

class ProjectExpandedScreen extends StatelessWidget {
  const ProjectExpandedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSparkAppBar(context: context,text: "Memory App"),
      body: ListView(
        children: [
          SparkSizedBox(height: 10,),
          buildProjectCategory(),
          SparkSizedBox(height: 10,),
          buildProjectDescription(),
          SparkSizedBox(height: 10,),
          buildExpandedPostScreenListView(),
          SparkSizedBox(height: 10,),

        ],
      ),
    );
  }


  Widget buildProjectCategory(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Text("Flutter Application",
          style: SparkTheme.lightTextTheme.headlineMedium
              ?.copyWith(
              color:
              SparkColors.color1.withOpacity(0.5))),
    );
  }
  Widget buildExpandedPostScreenListView(){
      return ListView.separated(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return  Container(
              padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 3).r,
              width: 360.w,
              height: 360.h,
              child: const Image(image: AssetImage("assets/memory_app/17.png"), fit: BoxFit.cover,),
            );

          },
          separatorBuilder: (BuildContext context, int index) =>
              Container(
                color: SparkColors.color3,
                width: double.infinity.w,
                height: 5.h,
              ),
          itemCount: 5);
    }


  Widget buildProjectDescription(){
    return SparkReadMoreText(
      numberOfLines: 10,
      horizontalPadding: 4,
      text:
      "Utilizes Tony Buzan's memory techniques for effective recall through reminders. It stores data securely with SQFLite and uses Bloc (Cubit) for app behavior management in Flutter and Dart. Features include timed reminders (24 hours, 1 week, 1 month, 6 months), group creation for organizing content, and favorites, and a quiz feature for quick reviews. Improve your memory effortlessly.",
    );
  }

  }



