import 'dart:io';


import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/language.dart';
import 'package:spark/messaging.dart';
import 'package:spark/ui/cubit1/cubit.dart';
import 'package:spark/ui/screens/company_request/cubit/company_request_cubit.dart';
import 'package:spark/ui/screens/company_service_details/cubit/company_service_details_cubit.dart';
import 'package:spark/ui/screens/company_services/cubit/company_services_cubit.dart';
import 'package:spark/ui/screens/home/home_screen.dart';
import 'package:spark/ui/screens/on_boarding/on_boarding_screen.dart';
import 'package:spark/ui/screens/our_projects/cubit/our_projects_cubit.dart';
import 'package:spark/ui/screens/screens.dart';
import 'package:spark/ui/screens/service_students/cubit/cubit.dart';
import 'package:spark/ui/screens/student_course_request/cubit/student_course_request_cubit.dart';
import 'package:spark/ui/screens/student_project_request/cubit/student_project_request_cubit.dart';
import 'package:spark/ui/style/themes/spark_theme.dart';
import 'package:spark/utilities/spark_bloc_observer.dart';

import 'network/remote/dio_helper.dart';
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyD2WomefktIA13n-ew_0sjWs44V_Oe90XY",
        appId: "1:328801234961:android:d9cb36aa8dad4e68c901b0",
        messagingSenderId: '328801234961',
        projectId: "spark-660cd",
        storageBucket: "spark-660cd.appspot.com"
      )
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    // Handle your message here.
  });
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('A new onMessageOpenedApp event was published!');
    // Handle your message here.
  });
  FirebaseAnalytics.instance;

  FirebaseMessaging.instance.subscribeToTopic('all');

  HttpOverrides.global = MyHttpOverrides();
  Locale curr=WidgetsBinding.instance.window.locale;
  language=curr.languageCode;
  DioHelper.init();
  Bloc.observer = SparkBlocObserver();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(const Spark());
}

class Spark extends StatefulWidget {
  const Spark({super.key});

  @override
  State<Spark> createState() => _SparkState();
}

class _SparkState extends State<Spark> {
   final Messaging _message=Messaging();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

     _message.initializeMessaging();

  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
    BlocProvider(create: (context) => CompanyServicesCubit()..getCompanyServicesList()),
    BlocProvider(create: (context) => CompanyServiceDetailsCubit()),
    BlocProvider(create: (context) => CompanyRequestCubit()),
    BlocProvider(create: (context) => StudentCourseRequestCubit()),
    BlocProvider(create: (context) => StudentProjectRequestCubit()), BlocProvider(create: (context) => OurProjectsCubit()
        ..getOurProjectsList()),
    BlocProvider(create: (context)=>Cubit1()),
    BlocProvider(create: (context)=>CubitSections())
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

);
}),
);
}
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

