import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../color/spark_colors.dart';

class SparkTheme {
  // 1
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    prefixIconColor: SparkColors.color4,
    suffixIconColor: SparkColors.color4,
    fillColor: SparkColors.color10,
    suffixStyle: SparkTheme.lightTextTheme.bodyMedium?.copyWith(color: SparkColors.color1,),
    floatingLabelStyle: SparkTheme.lightTextTheme.bodyMedium?.copyWith(color: SparkColors.color1,),
    prefixStyle: SparkTheme.lightTextTheme.bodyMedium?.copyWith(color: SparkColors.color1,),
    filled: true,
    labelStyle: SparkTheme.lightTextTheme.bodyMedium?.copyWith(color: SparkColors.color11,),
    hintStyle:SparkTheme.lightTextTheme.bodyMedium?.copyWith(color: SparkColors.color11),
    errorStyle: SparkTheme.lightTextTheme.bodySmall?.copyWith(color: Colors.red),
    errorMaxLines: 3,

    floatingLabelBehavior: FloatingLabelBehavior.never,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: SparkColors.color10, width: 1.w),
        borderRadius:  BorderRadius.all(Radius.circular(5.r)),
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: SparkColors.color10, width: 1.w),
        borderRadius:  BorderRadius.all(Radius.circular(5.r))),
    border: OutlineInputBorder(
        borderSide: BorderSide(color: SparkColors.color10, width: 1.w),
        borderRadius:  BorderRadius.all(Radius.circular(5.r))),
    errorBorder:  OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.w),
        borderRadius:  BorderRadius.all(Radius.circular(5.r)),
    ),
    focusedErrorBorder:  OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.w),
        borderRadius:  BorderRadius.all(Radius.circular(5.r))),



  );

  static TextTheme lightTextTheme = TextTheme(

    bodySmall: GoogleFonts.poppins(
      fontSize: 10.0.sp,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.poppins(
        fontSize: 12.0.sp,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 14.4.sp,
      fontWeight: FontWeight.w400,
      color: SparkColors.color3
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 17.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineLarge: GoogleFonts.poppins(
      fontSize: 19.5.sp,
      fontWeight: FontWeight.w600,
      color: SparkColors.color4,
      //height:36.sp

    ),
    titleMedium: GoogleFonts.poppins(
      fontSize:16.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    )

    /*displayLarge:  GoogleFonts.dancingScript(
      fontSize: 80.0.sp,
      fontWeight: FontWeight.bold,
      color: SparkColors.color4,
    )*/
  );



  // 3
  static ThemeData light() {
    return ThemeData(
        brightness: Brightness.light,
        checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateColor.resolveWith(
          (states) => Colors.black,
        )),
        appBarTheme:  AppBarTheme(
          scrolledUnderElevation: 0,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: SparkTheme.lightTextTheme.headlineLarge?.copyWith(color: SparkColors.color1),
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: SparkColors.color4),



          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
        ),
        floatingActionButtonTheme:  FloatingActionButtonThemeData(
          foregroundColor: SparkColors.color2,
          backgroundColor: SparkColors.color4,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: SparkColors.color4,
          unselectedItemColor: SparkColors.color3,
        ),
        textTheme: lightTextTheme,
        textSelectionTheme: TextSelectionThemeData(
           cursorColor: SparkColors.color1,
          selectionColor: SparkColors.color1,
          selectionHandleColor: SparkColors.color1,
        ),
        inputDecorationTheme: inputDecorationTheme,
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: inputDecorationTheme,
        )
    );
  }


}
