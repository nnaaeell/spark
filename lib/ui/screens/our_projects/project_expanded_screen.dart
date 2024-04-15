import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/ui/widgets/widgets.dart';
import '../../../data/models/company_project_model.dart';
import '../../../data/models/image_model.dart';
import '../../style/color/spark_colors.dart';
import '../../style/themes/spark_theme.dart';

class ProjectExpandedScreen extends StatelessWidget {
  ProjectExpandedScreen({super.key,required this.project});
  CompanyProjectModel project;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSparkAppBar(context: context,text: project.name!.english!),
      body: ListView(
        children: [
          SparkSizedBox(height: 10,),
          buildProjectCategory(project),
          SparkSizedBox(height: 10,),
          buildProjectDescription(project),
          SparkSizedBox(height: 10,),
          buildExpandedPostScreenListView(project),
          SparkSizedBox(height: 10,),

        ],
      ),
    );
  }


  Widget buildProjectCategory(CompanyProjectModel project){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Text(project.category!.english!,
          style: SparkTheme.lightTextTheme.headlineMedium
              ?.copyWith(
              color:
              SparkColors.color1.withOpacity(0.5))),
    );
  }
  Widget buildExpandedPostScreenListView(CompanyProjectModel project){
      return ListView.separated(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return  Container(
              padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 3).r,
              width: 360.w,
              height: 360.h,
              child:  Image(image: NetworkImage("https://sparkeng.pythonanywhere.com/${project.pictures![index].image}"), fit: BoxFit.cover,),
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


  Widget buildProjectDescription(CompanyProjectModel project){
    return SparkReadMoreText(
      numberOfLines: 10,
      horizontalPadding: 4,
      text:project.description!.english!
    );
  }

  }



