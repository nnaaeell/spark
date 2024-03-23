import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/ui/style/color/spark_colors.dart';
import 'package:spark/ui/style/themes/spark_theme.dart';
import 'package:spark/ui/widgets/widgets.dart';

import '../../widgets/spark_button_N.dart';

class StudentService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSparkAppBar(
        text: "Students Services",
        context: context,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 70*0.94,
          ),
          ServiceTile(
            title: 'Informatics',
            subtitle: 'Courses & Project',
            image: AssetImage('assets/informatics.png'), // Replace with your asset
            onTap: () {
              // Handle Informatics tap
            },
          ),
          SizedBox(
            height: 20,
          ),
          ServiceTile(
            title: 'Architectural Engineering',
            subtitle: 'Courses & Project',
            image: AssetImage('assets/architectural.png'), // Replace with your asset
            onTap: () {
              // Handle Architectural Engineering tap
            },
          ),
        ],
      ),
    );
  }
}

class ServiceTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final ImageProvider image;
  final VoidCallback onTap;

  const ServiceTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 137*0.94,
        width: double.infinity,
        decoration: BoxDecoration(
            color: SparkColors.color5,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height:117*094 ,
                width: 120*0.86,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),

                    image: DecorationImage(
                        image: NetworkImage('https://media.istockphoto.com/id/1439425791/nl/foto/digital-technology-software-development-concept-coding-programmer-working-on-laptop-with.jpg?s=2048x2048&w=is&k=20&c=lfOt2EUOtx6vnds-JaffxMsuYsVha5Me09ls7WwdXv0=',
                        ),
                        fit: BoxFit.cover
                    )
                ) ,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                      style: SparkTheme.lightTextTheme.titleMedium,
                    ),
                    Text(title,
                      style: SparkTheme.lightTextTheme.bodyLarge,
                    ),

                    SparkButtonN(onPressed: (){},
                    width: 100,
                    height: 30,
                    backgroundColor: SparkColors.color1,
                    )



                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}