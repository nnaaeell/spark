import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:spark/ui/navigation/spark_navigator.dart';
import 'package:spark/ui/screens/company_request/company_request_screen.dart';
import 'package:spark/ui/screens/screens.dart';
import 'package:spark/ui/style/color/spark_colors.dart';
import 'package:spark/ui/style/themes/spark_theme.dart';
import 'package:spark/ui/widgets/spark_app_bar.dart';
import 'package:spark/ui/widgets/spark_button.dart';
import 'package:spark/ui/widgets/spark_read_more_text.dart';
import 'package:spark/ui/widgets/spark_sizedbox.dart';

import 'cubit/company_service_details_cubit.dart';
import 'cubit/company_service_details_states.dart';

class CompanyServiceDetailsScreen extends StatelessWidget {
  CompanyServiceDetailsScreen({super.key, required this.id});

  int? id;

  @override
  Widget build(BuildContext context) {
    var cubit = CompanyServiceDetailsCubit.get(context);
    cubit.getCompanyServiceDetails(id!);
    return BlocConsumer<CompanyServiceDetailsCubit,
            CompanyServiceDetailsStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          return buildCompanyServiceDetailsScreen(state, cubit, context);
        });
  }

  Widget buildCompanyServiceDetailsScreen(state, cubit, context) {
    if (state is! CompanyServiceDetailsLoadingState) {
      return Scaffold(
        appBar: buildSparkAppBar(
          text: cubit.companyServiceDetails!.name!.english!,
          context: context,
          hasDrawer: false
        ),
        body: ListView(
          children: [
            SparkSizedBox(height: 30),
            buildCategoryDetailsImage(cubit),
            SparkSizedBox(height: 33),
            SparkReadMoreText(
                text: cubit.companyServiceDetails!.description!.english!),
            SparkSizedBox(height: 50),
            buildCategoryDetailsRequestButton(context,cubit),
            SparkSizedBox(height: 50),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: SpinKitChasingDots(
            color: SparkColors.color1,
            size: 100,
          ),
        ),
      );
    }
  }

  Widget buildCategoryDetailsImage(CompanyServiceDetailsCubit cubit) {
    return Padding(
      padding:  EdgeInsets.all(10.0.r),
      child:  Container(
        height:300.h ,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FadeInImage(
            placeholder: AssetImage('assets/temp2.png'),
            image: CachedNetworkImageProvider(cubit.companyServiceDetails!.picture!
            ),
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),

      ),
    );
  }

  Widget buildCategoryDetailsRequestButton(BuildContext context,CompanyServiceDetailsCubit cubit) {
    return Row(
      children: [
        const Spacer(),
        SparkButton(
          width: 191,
          height: 41,
          radius: 7,
          backgroundColor: SparkColors.color1,
          text: "Service request ",
          textStyle: SparkTheme.lightTextTheme.bodyLarge
              ?.copyWith(color: SparkColors.color2),
          onPressed: () {
            navigateTo(context, CompanyRequestScreen(id:cubit.companyServiceDetails!.id));
          },
        ),
        const Spacer()
      ],
    );
  }
}
