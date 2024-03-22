import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/ui/constants/constants.dart';
import 'package:spark/ui/widgets/spark_drop_down_button_form_field.dart';

import '../../../utilities/utilities.dart';
import '../../navigation/spark_navigator.dart';
import '../../style/color/spark_colors.dart';
import '../../style/themes/spark_theme.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class StudentProjectRequestScreen extends StatelessWidget {
  const StudentProjectRequestScreen({super.key});

  static TextEditingController fullNameController = TextEditingController();

  static TextEditingController universityNameController = TextEditingController();

  static TextEditingController phoneNumberController = TextEditingController();

  static TextEditingController studentProjectDescriptionController = TextEditingController();

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // This will remove the focus from the text field
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: buildSparkAppBar(context: context, text: "Project request"),
        body: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 21.w),
            children: [
              SparkSizedBox(height: 22),
              buildStudentProjectRequestFullNameTextFormField(),
              SparkSizedBox(height: 21),
              buildStudentProjectRequestUniversityNameTextFormField(),
              SparkSizedBox(height: 21),
              buildStudentProjectRequestPhoneNumberTextFormField(),
              SparkSizedBox(height: 21),
              buildStudentProjectRequestDescriptionTextFormField(),
              SparkSizedBox(height: 36),
              buildStudentProjectRequestButton(context),
              SparkSizedBox(height: 38),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStudentProjectRequestFullNameTextFormField() {
    return SparkTextFormField(
      title: "Full Name",
      label: "Enter your full name here",
      hintText: "E.g. Omar Ali",
      type: TextInputType.name,
      controller: fullNameController,
      isPassword: false,
      validate: validateFullName,
    );
  }

  Widget buildStudentProjectRequestUniversityNameTextFormField() {
    return SparkTextFormField(
      title: "University Name",
      label: "Enter your university name here",
      hintText: "E.g. Tishreen University",
      type: TextInputType.text,
      controller: universityNameController,
      isPassword: false,
      validate: validateUniversityName,
    );
  }

  Widget buildStudentProjectRequestPhoneNumberTextFormField() {
    return SparkTextFormField(
      title: "Phone Number",
      label: "Enter your phone number here",
      hintText: "E.g. 0988095867",
      type: TextInputType.phone,
      controller: phoneNumberController,
      isPassword: false,
      validate: validatePhoneNumber,
    );
  }

  Widget buildStudentProjectRequestDescriptionTextFormField() {
    return SparkTextFormField(
      title: "Project Description",
      hintText: "E.g. I need Flutter application for semester project...",
      label: "Tell us more about your project",
      type: TextInputType.name,
      controller: studentProjectDescriptionController,
      isPassword: false,
      validate: validateStudentProjectDescription,
      maxLines: 4,
    );
  }

  Widget buildStudentProjectRequestButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SparkButton(
          width: 191,
          height: 41,
          radius: 7,
          backgroundColor: SparkColors.color1,
          text: "Send the request ",
          textStyle: SparkTheme.lightTextTheme.bodyLarge
              ?.copyWith(color: SparkColors.color2),
          onPressed: () {
            navigateReplace(context, const RequestCompletedScreen());
          },
        ),
      ],
    );
  }




}
