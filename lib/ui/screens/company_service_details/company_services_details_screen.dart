import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:spark/ui/navigation/spark_navigator.dart';
import 'package:spark/ui/screens/company_request/company_request_screen.dart';
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
            buildCategoryDetailsRequestButton(context),
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
    return SizedBox(
        width: double.infinity.w,
        height: 300.h,
        child: Image.network(
          cubit.companyServiceDetails!.picture!,
          fit: BoxFit.cover,
        ));
  }

  Widget buildCategoryDetailsRequestButton(BuildContext context) {
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
            navigateTo(context, CompanyRequestScreen());
          },
        ),
        const Spacer()
      ],
    );
  }
}
