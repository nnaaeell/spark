import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/ui/style/themes/spark_theme.dart';
import 'package:spark/ui/widgets/spark_app_bar.dart';
import 'package:spark/ui/widgets/spark_read_more_text.dart';
import 'package:spark/ui/widgets/spark_sizedbox.dart';
import 'package:spark/ui/widgets/spark_images_grid_view.dart';

import '../../style/color/spark_colors.dart';

class OurProjectsScreen extends StatelessWidget {
  OurProjectsScreen({super.key});

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildSparkAppBar(context: context, text: "Our Projects"),
        body: Column(
          children: [
            buildOurProjectsScreenListView(),
            SparkSizedBox(height: 15),
          ],
        ));
  }
  Widget buildOurProjectsScreenListView(){
    return Expanded(
      child: ListView.separated(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) =>buildProjectItem(),
        separatorBuilder: (BuildContext context, int index) =>buildProjectDivider(),
      ),
    );
  }
  Widget buildProjectItem(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SparkSizedBox(height: 10),
          buildProjectTitle(),
          SparkSizedBox(height: 4),
          buildProjectCategory(),
          SparkSizedBox(height: 10),
          buildProjectDescription(),
          SparkSizedBox(height: 10),
          const SparkImagesGridView(),
          SparkSizedBox(height: 10),
          buildProjectLink(),
          SparkSizedBox(height: 10),
        ]);
  }
  Widget buildProjectDivider(){
     return Container(
      height: 2.h,
      color: SparkColors.color3,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
    );
  }

  Widget buildProjectTitle(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Text("Memory App",
          style: SparkTheme.lightTextTheme.headlineLarge
              ?.copyWith(
              color: SparkColors.color1,
              fontSize: 25.sp)),
    );
  }

  Widget buildProjectCategory(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Text("Flutter Application",
          style: SparkTheme.lightTextTheme.headlineMedium
              ?.copyWith(
              color:
              SparkColors.color1.withOpacity(0.5))),
    );
  }

  Widget buildProjectDescription(){
     return SparkReadMoreText(
      numberOfLines: 4,
      horizontalPadding: 5,
      text:
      "Utilizes Tony Buzan's memory techniques for effective recall through reminders. It stores data securely with SQFLite and uses Bloc (Cubit) for app behavior management in Flutter and Dart. Features include timed reminders (24 hours, 1 week, 1 month, 6 months), group creation for organizing content, and favorites, and a quiz feature for quick reviews. Improve your memory effortlessly.",
    );
  }
  Widget buildProjectLink(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Text(
        "https://MRR.com",
        style: SparkTheme.lightTextTheme.headlineSmall
            ?.copyWith(color: SparkColors.color1),
        textAlign: TextAlign.center,
      ),
    );
  }
}
