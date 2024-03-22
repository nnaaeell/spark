import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/ui/navigation/spark_navigator.dart';
import 'package:spark/ui/screens/request_completed/request_completed_screen.dart';
import 'package:spark/ui/widgets/spark_app_bar.dart';
import 'package:spark/ui/widgets/spark_text_form_field.dart';

import '../../style/color/spark_colors.dart';
import '../../style/themes/spark_theme.dart';
import '../../widgets/widgets.dart';

class CompanyRequestScreen extends StatelessWidget {
  CompanyRequestScreen({super.key});

  static TextEditingController fullNameController = TextEditingController();

  static TextEditingController emailController = TextEditingController();

  static TextEditingController companyNameController = TextEditingController();

  static TextEditingController projectTitleController = TextEditingController();

  static TextEditingController projectDescriptionController =
      TextEditingController();

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? emailErrorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSparkAppBar(context: context, text: "Create a request"),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 21.w),
          children: [
            SparkSizedBox(
              height: 22,
            ),
            SparkTextFormField(
              title: "Full Name",
              label: "Enter your full name here",
              hintText: "E.g. Omar Ali",
              type: TextInputType.text,
              controller: fullNameController,
              isPassword: false,
              validate: validateFirstName,
            ),
            SparkSizedBox(
              height: 21,
            ),
            SparkTextFormField(
              title: "Email",
              label: "Enter your email here",
              hintText: "E.g. info@gmail.com",
              type: TextInputType.emailAddress,
              controller: emailController,
              isPassword: false,
              validate: validateEmail,
            ),
            SparkSizedBox(
              height: 21,
            ),
            SparkTextFormField(
              title: "Company Name",
              hintText: "E.g. Google",
              label: "Enter your company name here",
              type: TextInputType.name,
              controller: companyNameController,
              isPassword: false,
              validate: validateCompanyName,
            ),
            SparkSizedBox(
              height: 21,
            ),
            SparkTextFormField(
              title: "Project Title",
              label: "Enter your project title here",
              hintText: "E.g. Mobile Application",
              type: TextInputType.name,
              controller: projectTitleController,
              isPassword: false,
              validate: validateProjectTitle,
            ),
            SparkSizedBox(
              height: 21,
            ),
            SizedBox(
              child: SparkTextFormField(
                title: "Project Description",
                hintText: "E.g. I need a mobile application for my company that contains these features....",
                label: "Tell us more about your project",
                type: TextInputType.name,
                controller: projectDescriptionController,
                isPassword: false,
                validate: validateProjectDescription,
                maxLines: 4,
              ),
            ),
            SparkSizedBox(
              height: 36,
            ),
            Row(
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
                    navigateReplace(context,const RequestCompletedScreen());
                  },
                ),
              ],
            ),
            SparkSizedBox(height: 38),
          ],
        ),
      ),
    );
  }

  String? validateFirstName(String? value) {
  }

  String? validateEmail(String? value) {
  }

  String? validateCompanyName(String? value) {
  }

  String? validateProjectTitle(String? value) {
  }

  String? validateProjectDescription(String? value) {
  }
}
