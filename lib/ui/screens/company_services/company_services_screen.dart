import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/ui/constants/categories_data.dart';
import 'package:spark/ui/screens/category_details/category_details_screen.dart';
import 'package:spark/ui/screens/company_services/cubit/company_services_cubit.dart';
import 'package:spark/ui/screens/company_services/cubit/company_services_states.dart';
import 'package:spark/ui/style/color/spark_colors.dart';
import 'package:spark/ui/style/themes/spark_theme.dart';
import 'package:spark/ui/widgets/spark_sizedbox.dart';

import '../../navigation/spark_navigator.dart';
import '../../widgets/spark_app_bar.dart';

class CompanyServicesScreen extends StatelessWidget {
  const CompanyServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = CompanyServicesCubit.get(context);
    return BlocConsumer<CompanyServicesCubit,CompanyServicesStates>(
      listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {

          return Scaffold(
            appBar: buildSparkAppBar(
              text: "Our Services",
              context: context,
            ),
            body: ListView(
              primary: true,
              shrinkWrap: true,
              children: [
                SparkSizedBox(height: 3),
                buildOurServicesImage(),
                SparkSizedBox(height: 5),
                buildOurServicesGridView(cubit),
                SparkSizedBox(height: 35),
              ],
            ),
          );
        },

    );
  }

  Widget buildOurServicesImage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 51.w),
      child: SizedBox(
          height: 254.h,
          width: 254.w,
          child: Image.asset('assets/categories_picture.png')),
    );
  }

  Widget buildOurServicesGridView(CompanyServicesCubit cubit) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.3,
            crossAxisSpacing: 24.w,
            mainAxisSpacing: 18.h,
            mainAxisExtent: 135.h),
        itemCount: cubit.companyServices.length,
        itemBuilder: (context, index) => buildServiceCard(index, context,cubit));
  }

  Widget buildServiceCard(int index, BuildContext context,cubit) {
    return InkWell(
      onTap: () {
        navigateTo(
            context,
            CategoryDetailsScreen(
              title: categories[index].title,
              imagePath: categories[index].imagePath,
            ));
      },
      child: Card(
        color: SparkColors.color2,
        shadowColor: SparkColors.color7,
        elevation: 11.r,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCardImage(index,cubit),
            buildCardTitle(index,cubit),
          ],
        ),
      ),
    );
  }

  Widget buildCardImage(int index,CompanyServicesCubit cubit) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 15.h),
      child: Container(
        width: 46.w,
        height: 46.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(96.r))),
        child: Image.network("https://sparkeng.pythonanywhere.com/${cubit.companyServices[index].picture!}"),
      ),
    );
  }

  Widget buildCardTitle(int index,CompanyServicesCubit cubit) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Text(
        cubit.companyServices[index].name!.english!,
        style: SparkTheme.lightTextTheme.headlineSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}