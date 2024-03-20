import 'package:flutter/material.dart';

import '../../style/themes/spark_theme.dart';
import '../../widgets/widgets.dart';

class CompanyRequestScreen extends StatelessWidget {
  CompanyRequestScreen({super.key});

  static TextEditingController fullNameController = TextEditingController();

  static TextEditingController emailController = TextEditingController();

  static TextEditingController companyNameController = TextEditingController();

  static TextEditingController projectTitleController = TextEditingController();

  static TextEditingController projectDescriptionController = TextEditingController();

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? emailErrorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            SparkTextFormField(
              label: 'Full Name',
              style: SparkTheme.lightTextTheme.bodySmall,
              hintText: 'Enter your full name here',
              type: TextInputType.name,
              isPassword: false,
              controller: fullNameController,
              //validate: validateFirstName,
            ),
            SparkTextFormField(
              label: 'Email',
              style: SparkTheme.lightTextTheme.bodySmall,
              hintText: 'Enter your email here',
              type: TextInputType.name,
              isPassword: false,
              controller: fullNameController,
              //validate: validateFirstName,
            ),

          ],
        ),
      ),
    );
  }

/*Widget buildTheSignUpStatement() {
  return Padding(
    padding: const EdgeInsets.only(left: 10).r,
    child: Text(
      'Sign up to hire talent',
      style: ProHubTheme.lightTextTheme.headlineMedium
          ?.copyWith(color: ProHubColor.color1),
    ),
  );
}

Widget buildFirstNameTextFormField() {
  return ProHubTextFormField(
    label: 'First name',
    style: ProHubTheme.lightTextTheme.bodySmall,
    hintText: 'Enter your first name here',
    type: TextInputType.name,
    isPassword: false,
    controller: fullNameController,
    validate: validateFirstName,
  );
}

Widget buildLastNameTextFormField() {
  return ProHubTextFormField(
    label: 'Last name',
    style: ProHubTheme.lightTextTheme.bodySmall,
    hintText: 'Enter your last name here',
    type: TextInputType.name,
    isPassword: false,
    controller: companyNameController,
    validate: validateLastName,
  );
}

Widget buildEmailTextFormField() {
  return ProHubTextFormField(
    label: 'Email',
    style: ProHubTheme.lightTextTheme.bodySmall,
    hintText: 'Enter your email here',
    type: TextInputType.emailAddress,
    isPassword: false,
    controller: emailController,
    validate: validateEmail,
    errorText: emailErrorText,
  );
}

Widget buildPasswordTextFormField(SignUpBloc bloc) {
  return ProHubTextFormField(
    label: 'Password',
    controller: projectTitleController,
    style: ProHubTheme.lightTextTheme.bodySmall,
    hintText: 'Enter your password here',
    suffix: IconButton(
        onPressed: () {
          bloc.add(PasswordVisibilityButtonPressed());
        },
        icon: (bloc.passwordIsShown)
            ? Icon(Icons.visibility_outlined)
            : Icon(Icons.visibility_off_outlined)),
    type: TextInputType.visiblePassword,
    isPassword: (!bloc.passwordIsShown),
    validate: validatePassword,
    onSubmit: (value) {
      if (formKey.currentState!.validate()) {
        bloc.add(
          SignUpButtonPressed(
            firstName: fullNameController.text,
            lastName: companyNameController.text,
            email: emailController.text,
            password: projectTitleController.text,
          ),
        );
      }
    },
  );
}

Widget buildSignUpButton(SignUpStates state, SignUpBloc bloc) {
  return ConditionalBuilder(
    condition: (state is! SignUpLoadingState),
    builder: (BuildContext context) {
      return ProHubButton(
          text: "Create my account",
          textStyle: ProHubTheme.lightTextTheme.bodyMedium
              ?.copyWith(color: ProHubColor.color2),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              bloc.add(
                SignUpButtonPressed(
                  firstName: fullNameController.text,
                  lastName: companyNameController.text,
                  email: emailController.text,
                  password: projectTitleController.text,
                ),
              );
            }
          });
    },
    fallback: (BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

Widget buildToggleToLoginButton(SignUpBloc bloc, context) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account ?",
            style: ProHubTheme.lightTextTheme.bodyLarge),
        TextButton(
          onPressed: () {
            bloc.add(GoToLogInButtonPressed(context));
          },
          child: Text('LOG IN',
              style: ProHubTheme.lightTextTheme.bodyMedium
                  ?.copyWith(color: ProHubColor.color4)),
        )
      ],
    ),
  );
}

void clear() {
  emailErrorText = null;
}

void dispose() {
  clear();
  emailController.clear();
  projectTitleController.clear();
  fullNameController.clear();
  companyNameController.clear();
}

void _signUpSuccessState(BuildContext context, SignUpSuccessState state) {
  navigateReplace(
      context,
      VerificationScreen(userEmail: emailController.text,));
  dispose();
  showProHubToast(message: "Verification code has sent successfully",
      state: ToastStates.SUCCESS);
}

void _signUpNotVerifiedEmailState(BuildContext context,
    SignUpNotVerifiedEmailState state) {
  var signUpModel = state.signUpModel;
  showProHubSnackBar(
    context: context,
    message: state.signUpModel.message,
    onPressed: () {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      navigateReplace(
          context, VerificationScreen(userEmail: emailController.text,));
      dispose();
    },
  );
}

void _signUpEmailVerifiedBeforeButNotCompleteHisRegistration(
    BuildContext context,
    SignUpEmailVerifiedBeforeButNotCompleteHisRegistration state) {
  showProHubSnackBar(
    context: context,
    message: state.signUpModel.message,
    onPressed: () {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      navigateReplace(
          context, SignUpSecondScreen(userEmail: emailController.text));
      dispose();
    },
  );
}

void _signUpEmailAddressAlreadyRegisteredInOurSystem(BuildContext context,
    SignUpEmailAddressAlreadyRegisteredInOurSystem state) {
  emailErrorText = state.signUpModel.message;
}

void _signUpErrorInSendingVerificationCode(BuildContext context,
    SignUpErrorInSendingVerificationCode state, bloc) {
  showProHubSnackBar(
    context: context,
    message: state.signUpModel.message,
    onPressed: () {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      bloc.add(
        SignUpButtonPressed(
          firstName: fullNameController.text,
          lastName: companyNameController.text,
          email: emailController.text,
          password: projectTitleController.text,
        ),
      );
    },
  );
}
}*/
}
