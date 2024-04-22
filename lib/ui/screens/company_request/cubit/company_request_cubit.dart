import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/data/models/response_for_requast.dart';
import 'package:spark/network/end_points.dart';
import '../../../../data/models/models.dart';
import '../../../../network/remote/dio_helper.dart';
import 'company_request_states.dart';

class CompanyRequestCubit extends Cubit<CompanyRequestStates> {
  CompanyRequestCubit() : super(CompanyRequestInitialState());

  static CompanyRequestCubit get(context) => BlocProvider.of(context);

  ServiceModel? companyRequest;
  ResponseForRequast? responseForRequast;

  Future<void> postCompanyRequest({
    required int id,
    required String fullName,
    required String email,
    required String companyName,
    required String phoneNumber,
    required String description,
  }) async {
    var formData = FormData.fromMap({
        "agent_name": fullName,
        "company_name": companyName,
        "email": email,
        "phone": phoneNumber,
        "desc": description,
        "service": id
    },);
    emit(CompanyRequestLoadingState());
    try {
      var response = await DioHelper.postData(
        url: COMPANYREQUEST,
        data: formData
      );

     print(response!.data);
     responseForRequast=ResponseForRequast.fromJsonn(response!.data);
     // print(responseForRequast!.massege);

        emit(CompanyRequestSuccessState( id: responseForRequast!.id,message:responseForRequast!.massege));

    } catch (error) {
      print(error.toString());
      emit(CompanyRequestErrorState(error.toString()));
    }
  }
}
