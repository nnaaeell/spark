




abstract class CompanyRequestStates{}

class CompanyRequestInitialState extends CompanyRequestStates {}

class CompanyRequestLoadingState extends CompanyRequestStates {}

class CompanyRequestSuccessState extends CompanyRequestStates {
  final String id;
  final String message;
  CompanyRequestSuccessState({
    required this.id,
    required this.message
});
}



class CompanyRequestErrorState extends CompanyRequestStates {
  final String error;
  CompanyRequestErrorState(this.error);
}

