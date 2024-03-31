
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/ui/Cubit1/states.dart';
import 'package:spark/ui/cubit1/cubit.dart';
import 'package:spark/ui/navigation/spark_navigator.dart';
import 'package:spark/ui/screens/categories/categories_screen.dart';
import 'package:spark/ui/screens/service_students/service_students_screen.dart';
import 'package:spark/ui/style/color/spark_colors.dart';
import 'package:spark/ui/style/themes/spark_theme.dart';
import 'package:spark/ui/widgets/spark_app_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=>Cubit1(),
    child: BlocConsumer<Cubit1,Cubit1States>(
      builder: (BuildContext context, Cubit1States state)=>Scaffold(
        appBar: buildSparkAppBar(context: context

        ),
        body: Center(
          child: Column(

            children: <Widget>[
              buildImage(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                    'We offer a wide range of services for both corporates and students. Click below to explore',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: SparkColors.color1
                    )
                ),
              ),
              SizedBox(height: 60.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildCard(context,'assets/onboarding1.png', 'Company Services',const CategoriesScreen()),
                  buildCard(context,'assets/onboarding1.png', 'Students Services', StudentService())
                ],
              )

            ],
          ),
        ),
      ),
      listener: (BuildContext context, Cubit1States state) {  },

    ),
    );
  }

  Widget buildImage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 33.4.r),
      child: SizedBox(
        height: 290.58.h,
        width: 290.58.w,
        child: Image(
          image: AssetImage('assets/onboarding1.png'),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, String image,String title,Widget w) {
    return InkWell(
      onTap: () {
        navigateTo(context,  w);

      },
      child: Padding(
        padding:  EdgeInsets.all(10.0.r),
        child: Card(
          color: Colors.grey.shade50,
          shadowColor: SparkColors.color7,
          elevation: 11.r,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardImage(image),
              CardTitle(title),
            ],
          ),
        ),
      ),
    );
  }

  Widget CardImage(String image) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 15.h),
      child: Container(
        width: 46.w,
        height: 46.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(96.r))),
        child: Image.asset(image),
      ),
    );
  }

  Widget CardTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Text(
       title,
        style: SparkTheme.lightTextTheme.headlineSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}