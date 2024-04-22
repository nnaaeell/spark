




abstract class StudentProjectRequestStates{}

class StudentProjectRequestInitialState extends StudentProjectRequestStates {}

class StudentProjectRequestLoadingState extends StudentProjectRequestStates {}

class StudentProjectRequestSuccessState extends StudentProjectRequestStates {
  final String id;
  final String message;

  StudentProjectRequestSuccessState({
    required this.id,
    required this.message
});
}



class StudentProjectRequestErrorState extends StudentProjectRequestStates {
  final String error;
  StudentProjectRequestErrorState(this.error);
}

