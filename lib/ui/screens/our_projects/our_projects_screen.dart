import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:spark/ui/style/themes/spark_theme.dart';
import 'package:spark/ui/widgets/spark_app_bar.dart';
import 'package:spark/ui/widgets/spark_read_more_text.dart';
import 'package:spark/ui/widgets/spark_sizedbox.dart';
import 'package:spark/ui/widgets/spark_images_grid_view.dart';

import '../../style/color/spark_colors.dart';
import 'cubit/our_projects_cubit.dart';
import 'cubit/our_projects_states.dart';

class OurProjectsScreen extends StatelessWidget {
  OurProjectsScreen({super.key});

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var cubit = OurProjectsCubit.get(context);
    return BlocConsumer<OurProjectsCubit, OurProjectsStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          return Scaffold(
              appBar: buildSparkAppBar(context: context, text: "Our Projects"),
              body: Column(
                children: [
                  buildOurProjectsScreenListView(cubit,state),
                  SparkSizedBox(height: 15),
                ],
              ));
        });
  }

  Widget buildOurProjectsScreenListView(OurProjectsCubit cubit,OurProjectsStates state) {
    if(state is !OurProjectsLoadingState) {
      return Expanded(
        child: ListView.separated(
          itemCount: cubit.ourProjects.length,
          itemBuilder: (BuildContext context, int index) =>
              buildProjectItem(index, cubit),
          separatorBuilder: (BuildContext context, int index) =>
              buildProjectDivider(),
        ),
      );
    }
    else {
    return Center(
      child: SpinKitChasingDots(
      color: SparkColors.color1,
      size: 100,
      ),
    );
    }
  }

  Widget buildProjectItem(int index,OurProjectsCubit cubit) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SparkSizedBox(height: 30),
      buildProjectTitle(index,cubit),
      SparkSizedBox(height: 4),
      buildProjectCategory(index,cubit),
      SparkSizedBox(height: 10),
      buildProjectDescription(index,cubit),
      SparkSizedBox(height: 10),
      SparkImagesGridView(project:cubit.ourProjects[index]),
      SparkSizedBox(height: 10),
      buildProjectLink(index,cubit),
      SparkSizedBox(height: 10),
    ]);
  }

  Widget buildProjectDivider() {
    return Container(
      height: 2.h,
      color: SparkColors.color3,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
    );
  }

  Widget buildProjectTitle(int index,OurProjectsCubit cubit) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Text(cubit.ourProjects[index].name!.english!,
          style: SparkTheme.lightTextTheme.headlineLarge
              ?.copyWith(color: SparkColors.color1, fontSize: 25.sp)),
    );
  }

  Widget buildProjectCategory(int index,OurProjectsCubit cubit) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Text(cubit.ourProjects[index].category!.english!,
          style: SparkTheme.lightTextTheme.headlineMedium
              ?.copyWith(color: SparkColors.color1.withOpacity(0.5))),
    );
  }

  Widget buildProjectDescription(int index,OurProjectsCubit cubit) {
    return SparkReadMoreText(
      numberOfLines: 4,
      horizontalPadding: 5,
      text:cubit.ourProjects[index].description!.english!
    );
  }

  Widget buildProjectLink(int index,OurProjectsCubit cubit) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Text(
        cubit.ourProjects[index].link!,
        style: SparkTheme.lightTextTheme.headlineSmall
            ?.copyWith(color: SparkColors.color1),
        textAlign: TextAlign.center,
      ),
    );
  }
}
