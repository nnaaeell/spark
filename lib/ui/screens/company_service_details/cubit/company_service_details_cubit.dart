import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/network/end_points.dart';
import '../../../../data/models/models.dart';
import '../../../../network/remote/dio_helper.dart';
import 'company_service_details_states.dart';

class CompanyServiceDetailsCubit extends Cubit<CompanyServiceDetailsStates> {
  CompanyServiceDetailsCubit() : super(CompanyServiceDetailsInitialState());

  static CompanyServiceDetailsCubit get(context) => BlocProvider.of(context);

 ServiceModel? companyServiceDetails;

  Future<void> getCompanyServiceDetails(int id) async {

    emit(CompanyServiceDetailsLoadingState());
    try {
      var response = await DioHelper.getData(
        url: "$SERVICEDETAILS/$id",
      );
      if (response?.statusCode==200) {
        companyServiceDetails=ServiceModel.fromJson(response!.data);
        //print(response.data["service_picture"].toString());
        emit(CompanyServiceDetailsSuccessState());
      } else {
        emit(CompanyServiceDetailsErrorState(response!.statusCode.toString()));
      }
    } catch (error) {
      emit(CompanyServiceDetailsErrorState(error.toString()));
      print(error);
    }
  }
}
