import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/ui/Cubit1/states.dart';
import 'package:spark/ui/cubit1/cubit.dart';
import 'package:spark/ui/screens/our_team/our_team_screen.dart';
import 'package:spark/ui/style/themes/spark_theme.dart';
import 'package:spark/ui/widgets/spark_sizedbox.dart';

import '../navigation/spark_navigator.dart';

Widget drawer(context)=>BlocProvider(create:(context)=>Cubit1(),
child: BlocConsumer<Cubit1,Cubit1States>(
  listener: (BuildContext context, Cubit1States state) {  },
  builder: (BuildContext context, Cubit1States state)=> Drawer( // الشريط الجانبي
    child: Directionality(
      textDirection: TextDirection.rtl,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[

          Container(
            height: 200.h,
            child: Row(
              children: [
                Padding(
                  padding:  EdgeInsets.only(right: 10.w),
                  child: Text('SPARK',
                    style: SparkTheme.lightTextTheme.headlineLarge,
                  ),
                ),
                SparkSizedBox(
                  width: 50.w,
                ),
                Center(
                  child: Container(
                    height:60.h ,
                    width:60.w ,

                    child: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Image.asset('assets/spark_logo.png')),
                  ),
                )
              ],
            ),
          ),
          line(20),

          ListTile(title: Text('Home'),leading: Icon(Icons.home), onTap: () {}),
          ListTile(title: Text('Our Project'),leading:Icon(Icons.category_outlined), onTap: () {}),
          ListTile(title: Text('Our Team'),leading:Icon(Icons.account_circle), onTap: () {
            Cubit1.get(context).getOurTeam();
             navigateTo(context,  OurTeam());
          }),
          ListTile(title: Text('About Us'),leading: Icon(Icons.announcement_outlined), onTap :(){}),

          line(20)
        ],
      ),
    ),
  ),

  ),
);

Widget line(double padding)=>Padding(
  padding:  EdgeInsets.symmetric(horizontal: padding.w),
  child: Container(
    height: 2.h,
    color: Colors.grey.shade300,
  ),
);// المحتوى الرئيسي للصفحة

