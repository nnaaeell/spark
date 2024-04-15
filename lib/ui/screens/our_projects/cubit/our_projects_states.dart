


import '../../../../data/models/models.dart';

abstract class OurProjectsStates{}

class OurProjectsInitialState extends OurProjectsStates {}

class OurProjectsLoadingState extends OurProjectsStates {}

class OurProjectsSuccessState extends OurProjectsStates {

  OurProjectsSuccessState();
}



class OurProjectsErrorState extends OurProjectsStates {
  final String error;
  OurProjectsErrorState(this.error);
}

class OurProjectsChangePasswordVisibilityState extends OurProjectsStates {}