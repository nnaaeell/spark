import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:spark/ui/screens/student_project_request/cubit/student_project_request_cubit.dart';
import 'package:spark/ui/screens/student_project_request/cubit/student_project_request_states.dart';
import '../../../utilities/utilities.dart';
import '../../navigation/spark_navigator.dart';
import '../../style/color/spark_colors.dart';
import '../../style/themes/spark_theme.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class StudentProjectRequestScreen extends StatelessWidget {
  StudentProjectRequestScreen({super.key, required this.id});

  static TextEditingController fullNameController = TextEditingController();

  static TextEditingController universityNameController =
      TextEditingController();

  static TextEditingController phoneNumberController = TextEditingController();

  static TextEditingController studentProjectDescriptionController =
      TextEditingController();

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PhoneNumber? phoneNumber;
  int? id;

  @override
  Widget build(BuildContext context) {
    var cubit = StudentProjectRequestCubit.get(context);
    return BlocConsumer<StudentProjectRequestCubit,
        StudentProjectRequestStates>(
      listener: (BuildContext context, Object? state) {
        if(state is StudentProjectRequestSuccessState)_studentProjectRequestSuccessState(context);
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
                  buildStudentProjectRequestButton(context,cubit),
                  SparkSizedBox(height: 38),
                ],
              ),
            ),
          ),
        );
      },
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
          controller: phoneNumberController,
          initialCountryCode: 'SY',
          onChanged: (PhoneNumber phone) {
            phoneNumber = phone;
          },

        ),
      ],
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

  Widget buildStudentProjectRequestButton(
      BuildContext context, StudentProjectRequestCubit cubit) {
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
              print(universityNameController.text);
              print(phoneNumber!.completeNumber);
              print(studentProjectDescriptionController.text);
              cubit.postStudentProjectRequest(
                  id: id!,
                  fullName: fullNameController.text,
                  universityName: universityNameController.text,
                  phoneNumber: phoneNumber!.completeNumber,
                  description: (studentProjectDescriptionController.text.isNotEmpty)?studentProjectDescriptionController.text:"Empty Description");
            }
          },
        ),
      ],
    );
  }
  void dispose(){
    fullNameController.clear();
    universityNameController.clear();
    phoneNumberController.clear();
    studentProjectDescriptionController.clear();
  }
  void _studentProjectRequestSuccessState(context){
    navigateReplace(context,const RequestCompletedScreen());
    dispose();
  }
}
