import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/network/end_points.dart';
import '../../../../data/models/models.dart';
import '../../../../network/remote/dio_helper.dart';
import 'company_request_states.dart';

class CompanyRequestCubit extends Cubit<CompanyRequestStates> {
  CompanyRequestCubit() : super(CompanyRequestInitialState());

  static CompanyRequestCubit get(context) => BlocProvider.of(context);

  ServiceModel? companyRequest;

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
      if (response?.statusCode == 201) {
        emit(CompanyRequestSuccessState());
      } else {
        print(response!.statusCode.toString());
        emit(CompanyRequestErrorState(response!.statusCode.toString()));
      }
    } catch (error) {
      print(error.toString());
      emit(CompanyRequestErrorState(error.toString()));
    }
  }
}
