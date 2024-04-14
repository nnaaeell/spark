




abstract class StudentCourseRequestStates{}

class StudentCourseRequestInitialState extends StudentCourseRequestStates {}

class StudentCourseRequestLoadingState extends StudentCourseRequestStates {}

class StudentCourseRequestSuccessState extends StudentCourseRequestStates {

  StudentCourseRequestSuccessState();
}



class StudentCourseRequestErrorState extends StudentCourseRequestStates {
  final String error;
  StudentCourseRequestErrorState(this.error);
}

