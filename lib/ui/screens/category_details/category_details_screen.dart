import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/ui/navigation/spark_navigator.dart';
import 'package:spark/ui/screens/company_request/company_request_screen.dart';
import 'package:spark/ui/style/color/spark_colors.dart';
import 'package:spark/ui/style/themes/spark_theme.dart';
import 'package:spark/ui/widgets/spark_app_bar.dart';
import 'package:spark/ui/widgets/spark_button.dart';
import 'package:spark/ui/widgets/spark_read_more_text.dart';
import 'package:spark/ui/widgets/spark_sizedbox.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({super.key,required this.title,required this.imagePath});
  final String title;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSparkAppBar(text: title, context: context,),
      body: ListView(
        children: [
          SparkSizedBox(height: 30,),
          buildCategoryDetailsImage(),
          SparkSizedBox(height: 33),
          SparkReadMoreText(
              text:
                  "From automation to advanced analytics and seamless experiences,"
                  "we can embed AI in business. We'll deliver new operating models and strategic"
                  " intelligencfor smart processes and data-driven decisions What,"
                  " Why and How? From automation to advanced analytics and seamless "
                  "experiences, we can embed AI in business. We'll deliver new operating models"
                  " and strategic intelligence for smart processes and data-driven decisions.From automation to advanced analytics and seamless experiences,"
                  "we can embed AI in business. We'll deliver new operating models and strategic"
                  " intelligencfor smart processes and data-driven decisions What,"
                  " Why and How? From automation to advanced analytics and seamless "
                  "experiences, we can embed AI in business. We'll deliver new operating models"
                  " What, Why and How?"),
          SparkSizedBox(height: 50),
          buildCategoryDetailsRequestButton(context),
          SparkSizedBox(height: 50),
        ],
      ),
    );
  }
  Widget buildCategoryDetailsImage(){
    return SizedBox(
        width: double.infinity.w,
        height: 204.h,
        child: Image.asset("assets/category_details.png"));
  }

  Widget buildCategoryDetailsRequestButton(BuildContext context){
    return Row(
      children: [
        const Spacer(),
        SparkButton(
          width: 191,
          height: 41,
          radius: 7,
          backgroundColor: SparkColors.color1,
          text: "Service request ",
          textStyle: SparkTheme.lightTextTheme.bodyLarge
              ?.copyWith(color: SparkColors.color2),
          onPressed: () {
            navigateTo(context,CompanyRequestScreen());
          },
        ),
        const Spacer()
      ],
    );
  }
}
