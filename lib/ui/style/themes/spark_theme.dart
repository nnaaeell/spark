import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color/spark_colors.dart';

class SparkTheme {
  // 1
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    prefixIconColor: SparkColors.color4,
    suffixIconColor: SparkColors.color4,
    labelStyle: SparkTheme.lightTextTheme.bodyMedium,
    hintStyle:SparkTheme.lightTextTheme.bodySmall?.copyWith(color: SparkColors.color3),
    errorStyle: SparkTheme.lightTextTheme.bodySmall?.copyWith(color: SparkColors.color5),
    errorMaxLines: 3,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: SparkColors.color3, width: 1.w),
        borderRadius:  BorderRadius.all(Radius.circular(25.r))),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: SparkColors.color4, width: 1.w),
        borderRadius:  BorderRadius.all(Radius.circular(25.r))),
    border: OutlineInputBorder(
        borderSide: BorderSide(color: SparkColors.color3, width: 1.w),
        borderRadius:  BorderRadius.all(Radius.circular(25.r))),
    errorBorder:  OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.w),
        borderRadius:  BorderRadius.all(Radius.circular(25.r)),
    ),
    focusedErrorBorder:  OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.w),
        borderRadius:  BorderRadius.all(Radius.circular(25.r))),



  );

  static TextTheme lightTextTheme = TextTheme(
    bodySmall: GoogleFonts.openSans(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.openSans(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodyLarge: GoogleFonts.openSans(
      fontSize: 18.0.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    headlineSmall: GoogleFonts.openSans(
      fontSize: 18.0.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    headlineMedium: GoogleFonts.openSans(
      fontSize: 26.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineLarge: GoogleFonts.openSans(
      fontSize: 28.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    displayLarge:  GoogleFonts.dancingScript(
      fontSize: 80.0.sp,
      fontWeight: FontWeight.bold,
      color: SparkColors.color4,
    )
  );

  // 2
  static TextTheme darkTextTheme = TextTheme(
      bodyText1: GoogleFonts.openSans(
          fontSize: 14.0.sp, fontWeight: FontWeight.w700, color: Colors.white),
      headline1: GoogleFonts.openSans(
        fontSize: 32.0.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headline2: GoogleFonts.openSans(
          fontSize: 21.0.sp, fontWeight: FontWeight.w700, color: Colors.white),
      headline3: GoogleFonts.openSans(
        fontSize: 16.0.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      headline6: GoogleFonts.openSans(
          fontSize: 20.0.sp, fontWeight: FontWeight.w600, color: Colors.white));

  // 3
  static ThemeData light() {
    return ThemeData(
        brightness: Brightness.light,
        checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateColor.resolveWith(
          (states) => Colors.black,
        )),
        appBarTheme:  AppBarTheme(
          centerTitle: true,
          titleTextStyle: SparkTheme.lightTextTheme.headlineMedium,
          color: SparkColors.color2,
          iconTheme: IconThemeData(
            color: SparkColors.color1
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: SparkColors.color2,
              statusBarIconBrightness: Brightness.dark),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: SparkColors.color4,
          unselectedItemColor: SparkColors.color3,
        ),
        textTheme: lightTextTheme,
        inputDecorationTheme: inputDecorationTheme,
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: inputDecorationTheme,
        )
    );
  }

  // 4
  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.yellowAccent,
      ),
      textTheme: darkTextTheme,
    );
  }
}
