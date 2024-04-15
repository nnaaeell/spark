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

  final String trimmedValue = value.replaceAll(RegExp(r'\s'), '');

  if (value != trimmedValue) {
    return 'Email should not contain any white spaces.';
  }

  if (value.length < 6 || value.length > 120) {
    return 'Email length should be between 6 and 120 characters.';
  }

  final List<String> parts = value.split('@');

  if (parts.length != 2 || parts[0].length < 2 || parts[1].length < 2) {
    return 'Please enter a valid email address';
  }
  return null; // Validation successful
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
  } else if (
  value.length < 9 ||
      value.length > 10 ||
      (value.length == 9 && !value.startsWith("9")) ||
      (value.length == 10 && !value.startsWith("09"))) {
    return "Please enter a valid syrian number.";
  }
  return null; // Validation successful
}

String? validateProjectDescription(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your project description.';
  }
  if(value.length<=50){
    return "Your description is too short ! ";
  }
  if(value.length>=5000){
    return "Your description is too long !";
  }
  return null;
}
