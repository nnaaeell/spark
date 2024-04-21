import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:spark/ui/constants/constants.dart';
import 'package:spark/ui/widgets/spark_drop_down_button_form_field.dart';

import '../../../utilities/utilities.dart';
import '../../navigation/spark_navigator.dart';
import '../../style/color/spark_colors.dart';
import '../../style/themes/spark_theme.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';
import 'cubit/student_course_request_cubit.dart';
import 'cubit/student_course_request_states.dart';

class StudentCourseRequestScreen extends StatelessWidget {
   StudentCourseRequestScreen({super.key, required this.id});

  static TextEditingController fullNameController = TextEditingController();

  static TextEditingController phoneNumberController = TextEditingController();

  static TextEditingController studentNotesController = TextEditingController();

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PhoneNumber? phoneNumber;
  final int id;

  @override
  Widget build(BuildContext context) {
    var cubit = StudentCourseRequestCubit.get(context);
    return BlocConsumer<StudentCourseRequestCubit, StudentCourseRequestStates>(
        listener: (BuildContext context, Object? state) {
      if (state is StudentCourseRequestSuccessState) {
        _studentCourseRequestSuccessState(context);
      }
    }, builder: (BuildContext context, state) {
      return GestureDetector(
        onTap: () {
          // This will remove the focus from the text field
          final currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: buildSparkAppBar(context: context, text: "Course request"),
          body: Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 21.w),
              children: [
                SparkSizedBox(height: 22),
                buildStudentCourseRequestFullNameTextFormField(),
                SparkSizedBox(height: 21),
                buildStudentCourseRequestPhoneNumberTextFormField(),
                SparkSizedBox(height: 21),
                buildStudentCourseRequestNotesTextFormField(),
                SparkSizedBox(height: 36),
                buildStudentCourseRequestButton(context,cubit),
                SparkSizedBox(height: 38),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget buildStudentCourseRequestFullNameTextFormField() {
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

  Widget buildStudentCourseRequestAccommodationTextFormField() {
    return SparkDropDownButtonFormField(
      title: "Accommodation",
      //value: selectedCity,
      label: "Please choose your place of residence",
      onChanged: (String? newValue) {},
      items: syrianCities,
      validate: validateAccommodation,
    );
  }

  Widget buildStudentCourseRequestPhoneNumberTextFormField() {
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

  Widget buildStudentCourseRequestNotesTextFormField() {
    return SparkTextFormField(
      title: "Student Notes",
      hintText: "E.g. I prefer morning sessions from 9 AM to 11:30 AM ....",
      label: "If you have any special notes please enter them here",
      type: TextInputType.name,
      controller: studentNotesController,
      isPassword: false,
      validate: validateStudentNotes,
      maxLines: 4,
    );
  }

  Widget buildStudentCourseRequestButton(BuildContext context,StudentCourseRequestCubit cubit) {
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
              print(phoneNumber!.completeNumber);
              print(studentNotesController.text);
              cubit.postStudentCourseRequest(
                  id: id!,
                  fullName: fullNameController.text,
                  phoneNumber: phoneNumber!.completeNumber,
                  studentNotes: (studentNotesController.text.isNotEmpty)?studentNotesController.text:"Empty Description");
            }
          },
        ),
      ],
    );
  }

  void dispose() {
    fullNameController.clear();
    phoneNumberController.clear();
    studentNotesController.clear();
  }

  void _studentCourseRequestSuccessState(context) {
    navigateReplace(context, const RequestCompletedScreen());
    dispose();
  }
}
