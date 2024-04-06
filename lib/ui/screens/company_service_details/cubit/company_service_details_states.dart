




abstract class CompanyServiceDetailsStates{}

class CompanyServiceDetailsInitialState extends CompanyServiceDetailsStates {}

class CompanyServiceDetailsLoadingState extends CompanyServiceDetailsStates {}

class CompanyServiceDetailsSuccessState extends CompanyServiceDetailsStates {

  CompanyServiceDetailsSuccessState();
}



class CompanyServiceDetailsErrorState extends CompanyServiceDetailsStates {
  final String error;
  CompanyServiceDetailsErrorState(this.error);
}

class CompanyServiceDetailsChangePasswordVisibilityState extends CompanyServiceDetailsStates {}