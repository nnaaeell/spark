
String? validateFullName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your full name.';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email.';
  }
  return null;
}

String? validateCompanyName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your company name.';
  }
  return null;
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your phone number.';
  }
  return null;
}

String? validateProjectDescription(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your project description.';
  }
  return null;
}