import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/data/models/company_project_model.dart';
import 'package:spark/network/end_points.dart';
import '../../../../data/models/models.dart';
import '../../../../network/remote/dio_helper.dart';
import 'our_projects_states.dart';

class OurProjectsCubit extends Cubit<OurProjectsStates> {
  OurProjectsCubit() : super(OurProjectsInitialState());

  static OurProjectsCubit get(context) => BlocProvider.of(context);

  List<CompanyProjectModel> ourProjects = [];

  Future<void> getOurProjectsList() async {
    ourProjects = [];
    emit(OurProjectsLoadingState());
    try {
      var response = await DioHelper.getData(
        url: COMPANYPROJECTS,
      );
      if (response?.statusCode==200) {
        response!.data["company_project"].forEach((project){
          ourProjects.add(CompanyProjectModel.fromJson(project));
        });
        emit(OurProjectsSuccessState());
      } else {
        emit(OurProjectsErrorState(response!.statusCode.toString()));
      }
    } catch (error) {
      emit(OurProjectsErrorState(error.toString()));
      print(error);
    }
  }
}
