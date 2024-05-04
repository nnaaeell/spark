import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:spark/ui/navigation/spark_navigator.dart';
import 'package:spark/ui/screens/company_request/cubit/company_request_states.dart';
import 'package:spark/ui/screens/request_completed/request_completed_screen.dart';
import 'package:spark/ui/widgets/spark_app_bar.dart';
import 'package:spark/ui/widgets/spark_text_form_field.dart';
import 'package:spark/utilities/showToast.dart';
import '../../../utilities/company_request_validation.dart';
import '../../style/color/spark_colors.dart';
import '../../style/themes/spark_theme.dart';
import '../../widgets/widgets.dart';
import 'cubit/company_request_cubit.dart';

class CompanyRequestScreen extends StatelessWidget {
  CompanyRequestScreen({super.key, required this.id});

  static TextEditingController fullNameController = TextEditingController();

  static TextEditingController emailController = TextEditingController();

  static TextEditingController companyNameController = TextEditingController();

  static TextEditingController phoneNumberController = TextEditingController();

  static TextEditingController projectDescriptionController =
  TextEditingController();

  PhoneNumber? phoneNumber;

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int? id;
  String? emailErrorText;

  @override
  Widget build(BuildContext context) {
    var cubit = CompanyRequestCubit.get(context);
    return BlocConsumer<CompanyRequestCubit,CompanyRequestStates>(
      listener: (BuildContext context, Object? state) {
        if(state is CompanyRequestSuccessState){
          if(state.id=='1'){
            _companyRequestSuccessState(context);
          }else{
            showToast(message: state.message);
          }
        }
      },
      builder: (BuildContext context, state) {
        return GestureDetector(
            onTap: () {
              // This will remove the focus from the text field
              final currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Scaffold(
              appBar:
              buildSparkAppBar(context: context, text: "Create a request"),
              body: Form(
                key: formKey,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 21.w),
                  children: [
                    SparkSizedBox(height: 22),
                    buildCompanyRequestFullNameTextFormField(),
                    SparkSizedBox(height: 21),
                    buildCompanyRequestEmailTextFormField(),
                    SparkSizedBox(height: 21),
                    buildCompanyRequestCompanyNameTextFormField(),
                    SparkSizedBox(height: 21),
                    buildCompanyRequestPhoneNumberTextFormField(),
                    SparkSizedBox(height: 21),
                    buildCompanyRequestProjectDescriptionTextFormField(),
                    SparkSizedBox(height: 36),
                    state is CompanyRequestLoadingState?Center(
                      child: SpinKitChasingDots(
                        color: SparkColors.color1,
                        size: 50,
                      ),
                    ):buildCompanyRequestButton(context,cubit),
                    SparkSizedBox(height: 38),
                  ],
                ),
              ),
            ));
      },
    );
  }

  Widget buildCompanyRequestFullNameTextFormField() {
    return SparkTextFormField(
      title: "Full Name",
      label: "Enter your full name here",
      hintText: "E.g. Omar Ali",
      type: TextInputType.text,
      controller: fullNameController,
      isPassword: false,
      validate: validateFullName,
    );
  }

  Widget buildCompanyRequestEmailTextFormField() {
    return SparkTextFormField(
      title: "Email",
      label: "Enter your email here",
      hintText: "E.g. info@gmail.com",
      type: TextInputType.emailAddress,
      controller: emailController,
      isPassword: false,
      validate: validateEmail,
    );
  }

  Widget buildCompanyRequestCompanyNameTextFormField() {
    return SparkTextFormField(
      title: "Company Name",
      hintText: "E.g. Google",
      label: "Enter your company name here",
      type: TextInputType.name,
      controller: companyNameController,
      isPassword: false,
      validate: validateCompanyName,
    );
  }

  Widget buildCompanyRequestPhoneNumberTextFormField() {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Phone Number",
          style: SparkTheme.lightTextTheme.headlineMedium
              ?.copyWith(fontSize: 15.sp),
        ),
        SparkSizedBox(
          height: 10,
        ),
        IntlPhoneField(
          decoration: const InputDecoration(
            labelText: 'Enter your phone number here',
            hintText: "E.g. 0988095867",
          ),
          autovalidateMode: AutovalidateMode.disabled,
          controller: phoneNumberController,
          validator: validatePhoneNumber,
          //disableLengthCheck: true,
          initialCountryCode: 'SY',
          onChanged: (PhoneNumber phone){
             phoneNumber=phone;
          },


        ),
      ],
    );
  }

  Widget buildCompanyRequestProjectDescriptionTextFormField() {
    return SparkTextFormField(
      title: "Project Description",
      hintText:
      "E.g. I need a mobile application for my company that contains these features....",
      label: "Tell us more about your project",
      type: TextInputType.name,
      controller: projectDescriptionController,
      isPassword: false,
      validate: validateProjectDescription,
      maxLines: 4,

    );
  }

  Widget buildCompanyRequestButton(BuildContext context,
      CompanyRequestCubit cubit) {
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
              if (formKey.currentState!.validate()) {
                print(id.toString());
                print(fullNameController.text);
                print(emailController.text);
                print(companyNameController.text);
                print(phoneNumber!.completeNumber);
                print(projectDescriptionController.text);
                cubit.postCompanyRequest(
                    id: id!,
                    fullName: fullNameController.text,
                    email: emailController.text,
                    companyName: companyNameController.text,
                    phoneNumber: phoneNumber!.completeNumber,
                    description: (projectDescriptionController.text.isNotEmpty)?projectDescriptionController.text:"Empty Description");
              }
            }),
      ],
    );
  }
  void dispose(){
    fullNameController.clear();
    emailController.clear();
    companyNameController.clear();
    phoneNumberController.clear();
    projectDescriptionController.clear();
  }
  void _companyRequestSuccessState(context){
    navigateReplace(context,RequestCompletedScreen());
    dispose();
  }
}
