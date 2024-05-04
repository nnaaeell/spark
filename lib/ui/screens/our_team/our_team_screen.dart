import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:spark/data/models/our_team.dart';
import 'package:spark/ui/Cubit1/states.dart';
import 'package:spark/ui/cubit1/cubit.dart';
import 'package:spark/ui/style/color/spark_colors.dart';
import 'package:spark/ui/style/themes/spark_theme.dart';
import 'package:spark/ui/widgets/drawer.dart';
import 'package:spark/ui/widgets/spark_sizedbox.dart';

import '../../widgets/spark_app_bar.dart';

class Team extends StatefulWidget {
  const Team({super.key});

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadScreen();
  }

  bool showSpinKit=true;
  _loadScreen() async {
    // انتظر لمدة ثلاث ثواني
    await Future.delayed(Duration(seconds: 2));

    // بعد انتهاء الفترة، قم بتحديث حالة العرض لعرض العناصر الأساسية
    setState(() {
      showSpinKit = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return BlocConsumer<Cubit1,Cubit1States>(
      listener: (context,state){},
      builder: (context,state)=> Scaffold(
          endDrawer:SparkDrawer(height: height,width: width,),
          appBar:buildSparkAppBar(context: context,
              text: 'Our team'
          ),
          body:showSpinKit?Center(child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              SpinKitChasingDots(color:SparkColors.color1,size: 100,),
            ],
          )): ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (context,index)=>buildItemOfOurTeam( Cubit1.ourTeamList[index]),
              separatorBuilder:(context,index)=>SizedBox(height: 20.h,),
              itemCount: Cubit1.ourTeamList.length)

      ),
    );
  }

  Widget buildItemOfOurTeam(Member member)=>Padding(
    padding: EdgeInsets.all(40.0.r),
    child: Container(
      height: 500,
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
          BoxShadow(
          color: Colors.black,
          spreadRadius: 0.2,
          blurRadius: 1,
          offset: Offset(1, 1)
      )
        ]
      ),
      child: Stack(
        children: [
          Container(
            height: 150.h,
            width: double.infinity.w,
// alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: SparkColors.color1
            ),
          ),
          Column(
            children: [
              SizedBox(height: 100.h,),
              Expanded(
                child: Container(
                  width: double.infinity.w,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20.r),bottomRight:Radius.circular(20.r), ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60.h,
                      ),
                      Text(member.name!.ar,
                        style: SparkTheme.lightTextTheme.titleMedium,),
                      SparkSizedBox(
                        height: 10,
                      ),
                      Text(member.memberPposition!.ar,
                        style: SparkTheme.lightTextTheme.titleSmall,),
                      SparkSizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(member.memberDesc!.ar,
                        style: SparkTheme.lightTextTheme.bodyMedium,
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Center(
                child: Container(
                  height:100.h ,
                  width:100.w ,
                  child: CircleAvatar(
                      backgroundImage:CachedNetworkImageProvider('https://sparkeng.pythonanywhere.com${member.member_picture}')),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
