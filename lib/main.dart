import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/ui/screens/company_services/cubit/company_services_cubit.dart';
import 'package:spark/ui/screens/on_boarding/on_boarding_screen.dart';
import 'package:spark/ui/style/themes/spark_theme.dart';
import 'package:spark/utilities/spark_bloc_observer.dart';

import 'network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Bloc.observer = SparkBlocObserver();
  runApp(const Spark());
}

class Spark extends StatelessWidget {
  const Spark({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
    BlocProvider(create: (context) => CompanyServicesCubit()..getCompanyServicesList()),
    ],
      child: ScreenUtilInit(
          designSize:  const Size(360.0, 772.0),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, widget) {
            ScreenUtil.init(context);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: MaterialApp(
                  title: 'Spark',
                  debugShowCheckedModeBanner: false,
                  theme: SparkTheme.light(),
                  home:  const OnBoardingScreen ()),
            );
          }),
    );
  }
}
