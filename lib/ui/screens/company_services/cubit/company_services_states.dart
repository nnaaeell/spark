


import '../../../../data/models/models.dart';

abstract class CompanyServicesStates{}

class CompanyServicesInitialState extends CompanyServicesStates {}

class CompanyServicesLoadingState extends CompanyServicesStates {}

class CompanyServicesSuccessState extends CompanyServicesStates {

  CompanyServicesSuccessState();
}



class CompanyServicesErrorState extends CompanyServicesStates {
  final String error;
  CompanyServicesErrorState(this.error);
}

class CompanyServicesChangePasswordVisibilityState extends CompanyServicesStates {}