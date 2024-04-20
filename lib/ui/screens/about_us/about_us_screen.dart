import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spark/size.dart';
import 'package:spark/ui/style/color/spark_colors.dart';
import 'package:spark/ui/style/themes/spark_theme.dart';
import 'package:spark/ui/widgets/spark_app_bar.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Scaffold (
      appBar:  buildSparkAppBar(context: context,
      text: 'About us'
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: height*0.12,
                ),
                part1(context,height,width),
                part2( height,width)
              ],
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height:height*0.001 ,
                  ),
                 logo(height, width)
                ],
              ),
            ),
        
          ],
        ),
      ),
    );
  }
  Widget part1(context,double height,double width)=>Padding(
    padding: const EdgeInsets.all(15),
    child: Container(
      height: height*0.30,
      width: double.infinity,
      decoration: BoxDecoration(
        color:SparkColors.color1,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          SizedBox(
           height: height*0.08,
          ),
          textImage(height,width),
          Text('Engineering Company',
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white
          )),
          SizedBox(
            height: height*0.02,
          ),
          line(width),
          SizedBox(
            height: height*0.04,
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon(context, height,width, 'assets/facebook.svg'),
                icon(context, height,width, 'assets/whatsApp.svg'),
                icon(context, height,width, 'assets/instagram.svg'),
                icon(context, height,width, 'assets/in.svg'),
              ],
            ),
          )



        ],
      ),
    ),
  );
  
  Widget part2(double height,double width)=>Padding(
    padding: const EdgeInsets.all(15),
    child: Container(
      height: height*0.5,
      width: double.infinity,
      decoration: BoxDecoration(
          color:SparkColors.color1,
          borderRadius: BorderRadius.circular(15.r)
      ),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Description',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('As a UX designer, I specialize in crafting seamless user experiences that align with your brand and resonate with your audience. My services encompass comprehensive user research, wireframing, prototyping, and interface design. I focus on understanding user behaviors, pain points, and preferences to create intuitive and engaging digital products. Whether its improving existing interfaces or creating new ones from scratch, I ensure designs that are user-centric, visually appealing, and optimized for usability across devices and platforms',
                style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade300
                )
              ),
            ),
          )


        ],
      ),
    ),
  );

  Widget textImage(double height,double width)=>Container(
    height: height*0.06,
    width: width*0.25,
    decoration: BoxDecoration(
      image: DecorationImage(
        image:  AssetImage('assets/spark_text_for_drawer.png'),
      )
   ),


  );
  Widget logo(double height,double width)=> Container(
    height:height*0.27,
    width:width*0.27,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
          image:DecorationImage(
        image: AssetImage('assets/logo_for_about_us.png')
    )
    ),
  );

  Widget line(double width)=>Padding(
    padding:  EdgeInsets.symmetric(horizontal: width*0.02),
    child: Container(
      height: 2,
      color: Colors.grey.shade400,
    ),
  );

  Widget icon(context,double height,double width,String path)=>IconButton(
    padding: EdgeInsets.only(top: 5.h,right: 10.w),
    icon: SvgPicture.asset(path,
      color: Colors.white,
      height: height*0.035,
      width: width*0.035,

    ), // يمكنك تغيير الأيقونة هنا
    onPressed: () => Scaffold.of(context).openEndDrawer(),
  );
}
