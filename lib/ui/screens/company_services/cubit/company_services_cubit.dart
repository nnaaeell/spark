import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/network/end_points.dart';
import '../../../../data/models/models.dart';
import '../../../../network/remote/dio_helper.dart';
import 'company_services_states.dart';

class CompanyServicesCubit extends Cubit<CompanyServicesStates> {
  CompanyServicesCubit() : super(CompanyServicesInitialState());

  static CompanyServicesCubit get(context) => BlocProvider.of(context);

  List<ServiceModel> companyServices = [];

  Future<void> getCompanyServicesList() async {
    companyServices = [];
    emit(CompanyServicesLoadingState());
    try {
      var response = await DioHelper.getData(
        url: COMPANYSERVICES,
      );

      if (response?.statusCode==200) {
        response!.data["services"].forEach((service){
          companyServices.add(ServiceModel.fromJson(service));
        });
        emit(CompanyServicesSuccessState());
      } else {
        emit(CompanyServicesErrorState(response!.statusCode.toString()));
      }
    } catch (error) {
      emit(CompanyServicesErrorState(error.toString()));
      print(error);
    }
  }
}
