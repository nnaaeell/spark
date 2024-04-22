import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/data/models/response_for_requast.dart';
import 'package:spark/network/end_points.dart';
import '../../../../network/remote/dio_helper.dart';
import 'student_project_request_states.dart';

class StudentProjectRequestCubit extends Cubit<StudentProjectRequestStates> {
  StudentProjectRequestCubit() : super(StudentProjectRequestInitialState());

  static StudentProjectRequestCubit get(context) => BlocProvider.of(context);

  ResponseForRequast? responseForRequast;

  Future<void> postStudentProjectRequest({
    required int id,
    required String fullName,
    required String universityName,
    required String phoneNumber,
    required String description,
  }) async {
    var formData = FormData.fromMap({
        "name": fullName,
        "university_name": universityName,
        "phone": phoneNumber,
        "desc": description,
        "project": id
    },);
    emit(StudentProjectRequestLoadingState());
    try {
      var response = await DioHelper.postData(
        url: STUDENTPROJECTREQUEST,
        data: formData
      );

      responseForRequast=ResponseForRequast.fromJsonn(response!.data);
        emit(StudentProjectRequestSuccessState(id: responseForRequast!.id,message: responseForRequast!.massege));
    } catch (error) {
      emit(StudentProjectRequestErrorState(error.toString()));
    }
  }
}
