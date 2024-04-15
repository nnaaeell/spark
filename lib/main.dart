import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/language.dart';
import 'package:spark/ui/cubit1/cubit.dart';
import 'package:spark/ui/screens/company_request/cubit/company_request_cubit.dart';
import 'package:spark/ui/screens/company_service_details/cubit/company_service_details_cubit.dart';
import 'package:spark/ui/screens/company_services/cubit/company_services_cubit.dart';
import 'package:spark/ui/screens/home/home_screen.dart';
import 'package:spark/ui/screens/on_boarding/on_boarding_screen.dart';
import 'package:spark/ui/style/themes/spark_theme.dart';
import 'package:spark/utilities/spark_bloc_observer.dart';

import 'network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Locale curr=WidgetsBinding.instance.window.locale;
  language=curr.languageCode;
  DioHelper.init();
  Bloc.observer = SparkBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const Spark());
}

class Spark extends StatelessWidget {
  const Spark({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
    BlocProvider(create: (context) => CompanyServicesCubit()..getCompanyServicesList()),
    BlocProvider(create: (context) => CompanyServiceDetailsCubit()),
    BlocProvider(create: (context) => CompanyRequestCubit()),
    BlocProvider(create: (context) => StudentCourseRequestCubit()),
    BlocProvider(create: (context) => StudentProjectRequestCubit()), BlocProvider(create: (context) => OurProjectsCubit()..getOurProjectsList()),
    BlocProvider(create: (context)=>Cubit1())
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
                  home:  const OnBoardingScreen()),
                  home:    const OnBoardingScreen()),
            );
          }),
    );
  }
}
