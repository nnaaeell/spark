import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:spark/ui/screens/on_boarding/on_boarding_screen.dart';
import 'package:spark/ui/style/themes/spark_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Spark());
}

class Spark extends StatelessWidget {
  const Spark({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize:  const Size(360.0, 772.0),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, widget) {
          return MaterialApp(
              title: 'Spark',
              debugShowCheckedModeBanner: false,
              theme: SparkTheme.light(),
              home:  OnBoardingScreen());
        });
  }
}
