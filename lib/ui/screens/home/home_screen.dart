
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/ui/Cubit1/states.dart';
import 'package:spark/ui/cubit1/cubit.dart';
import 'package:spark/ui/navigation/spark_navigator.dart';
import 'package:spark/ui/screens/categories/categories_screen.dart';
import 'package:spark/ui/screens/screens.dart';
import 'package:spark/ui/screens/service_students/service_students_screen.dart';
import 'package:spark/ui/style/color/spark_colors.dart';
import 'package:spark/ui/style/themes/spark_theme.dart';
import 'package:spark/ui/widgets/drawer.dart';
import 'package:spark/ui/widgets/spark_app_bar.dart';
import 'package:spark/ui/widgets/spark_sizedbox.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=>Cubit1(),
    child: BlocConsumer<Cubit1,Cubit1States>(
      builder: (BuildContext context, Cubit1States state)=>Scaffold(
        appBar: buildSparkAppBar(context: context
        ),
        endDrawer: drawer(context),
        body: Center(
          child: Column(

            children: <Widget>[
              buildImage(),
              SparkSizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                    'Welcome to the worlds best service platform',
                    textAlign: TextAlign.center,
                    style: SparkTheme.lightTextTheme.headlineLarge
                ),
              ),
              SizedBox(height: 50.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildCard(context,'assets/company_services.png', 'Company Services',const CategoriesScreen()),
                  buildCard(context,'assets/student_services.png', 'Students Services', StudentsFlow())
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
        height: 100.58.h,
        width: 100.58.w,
        child: Image(
          image: AssetImage('assets/spark_logo_for_home.png'),
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
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    spreadRadius: 0.2,
                    blurRadius: 1,
                    offset: Offset(1, 1)
                )
              ],
              borderRadius: BorderRadius.circular(10.r)
          ),
          child: Card(
            color: SparkColors.color1,
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
      ),
    );
  }

  Widget CardImage(String image) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 15.h),
      child: Container(
        width: 60.w,
        height: 80.h,
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
        style: TextStyle(
            fontSize: 12.sp,
            color: SparkColors.color10
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}