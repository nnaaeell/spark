




abstract class CompanyRequestStates{}

class CompanyRequestInitialState extends CompanyRequestStates {}

class CompanyRequestLoadingState extends CompanyRequestStates {}

class CompanyRequestSuccessState extends CompanyRequestStates {

  CompanyRequestSuccessState();
}



class CompanyRequestErrorState extends CompanyRequestStates {
  final String error;
  CompanyRequestErrorState(this.error);
}

