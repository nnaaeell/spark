




abstract class StudentProjectRequestStates{}

class StudentProjectRequestInitialState extends StudentProjectRequestStates {}

class StudentProjectRequestLoadingState extends StudentProjectRequestStates {}

class StudentProjectRequestSuccessState extends StudentProjectRequestStates {

  StudentProjectRequestSuccessState();
}



class StudentProjectRequestErrorState extends StudentProjectRequestStates {
  final String error;
  StudentProjectRequestErrorState(this.error);
}

