String? validateUniversityName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your university name.';
  }
  return null;
}
String? validateStudentProjectDescription(String? value) {
  /*if (value == null || value.isEmpty) {
    return 'Please enter your project description.';
  }*/
 /* if(value.length<=50){
    return "Your description is too short ! ";
  }
  if(value.length>=5000){
    return "Your description is too long !";
  }*/
  return null;
}
