  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spark/ui/Cubit1/states.dart';
import 'package:spark/ui/navigation/spark_navigator.dart';
import 'package:spark/ui/screens/our_projects/our_projects_screen.dart';
import 'package:spark/ui/screens/our_team/our_team_screen.dart';
import 'package:spark/ui/screens/screens.dart';
import 'package:spark/ui/style/color/spark_colors.dart';
import 'package:spark/ui/widgets/spark_sizedbox.dart';

import '../../data/models/our_team.dart';
import '../cubit1/cubit.dart';
import '../screens/about_us/about_us_screen.dart';
import '../style/themes/spark_theme.dart';

class SparkDrawer extends StatelessWidget {
  final double width;
  final double height;
    const SparkDrawer({Key? key,
    required this.width,
    required this.height
    }):super(key: key);


    @override
    Widget build(BuildContext context) {
      return BlocConsumer<Cubit1,Cubit1States>(
          builder:(context,state)=> Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              alignment: Alignment.topRight,
              height: height*0.75,
              width: width*0.6,
              child: Drawer(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(15),bottomLeft: Radius.circular(15))
                ),// الشريط الجانبي
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Container(
                      height: 120.h,
                      color: SparkColors.color1,
                      child: Row(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(right: 10.w),
                            child: Image.asset('assets/spark_text_for_drawer.png',
                            width: 80.w,
                            height: 120.h,
                            )
                          ),
                          Center(
                            child:  Image.asset('assets/spark_logo_for_drawer.png',
                              width: 80.w,
                              height: 120.h,
                            )
                          )
                        ],
                      ),
                    ),
                    line(20),

                    ListTile(title: Text('Home'),leading: SvgPicture.asset("assets/home_for_drawer.svg",
                      height: 20.h,
                      width: 10.h,
                    ), onTap: () {}),
                    ListTile(title: Text('Our Project'),leading:SvgPicture.asset("assets/projects_for_drawer.svg",
                      height: 20.h,
                      width: 10.h,
                    ), onTap: () {
                      navigateTo(context, OurProjectsScreen());
                    }),
                    ListTile(title: Text('Our Team'),leading:SvgPicture.asset("assets/our_Team_for_drawer.svg",
                      height: 20.h,
                      width: 10.h,
                    ), onTap: () {
                      Cubit1.get(context).getOurTeam();
                      navigateTo(context,Team());
                    }),
                    ListTile(title: Text('About Us'),leading: SvgPicture.asset("assets/home_for_drawer.svg",
                      height: 20.h,
                      width: 10.h,
                    ), onTap :(){

                      navigateTo(context,AboutUs());
                    }),
                    line(20),

                  ],
                ),
              ),
            ),
          ),
          listener: (context,state){});
    }
  }



  Widget line(double padding)=>Padding(
    padding:  EdgeInsets.symmetric(horizontal: padding.w),
    child: Container(
      height: 2.h,
      color: Colors.grey.shade300,
    ),
  );




