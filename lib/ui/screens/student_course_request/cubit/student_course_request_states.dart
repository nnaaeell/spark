




abstract class StudentCourseRequestStates{}

class StudentCourseRequestInitialState extends StudentCourseRequestStates {}

class StudentCourseRequestLoadingState extends StudentCourseRequestStates {}

class StudentCourseRequestSuccessState extends StudentCourseRequestStates {

  final String id;
  final String message;

  StudentCourseRequestSuccessState({
    required this.id,
    required this.message
});
}



class StudentCourseRequestErrorState extends StudentCourseRequestStates {
  final String error;
  StudentCourseRequestErrorState(this.error);
}

