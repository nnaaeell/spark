import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/network/end_points.dart';
import '../../../../network/remote/dio_helper.dart';
import 'student_project_request_states.dart';

class StudentProjectRequestCubit extends Cubit<StudentProjectRequestStates> {
  StudentProjectRequestCubit() : super(StudentProjectRequestInitialState());

  static StudentProjectRequestCubit get(context) => BlocProvider.of(context);



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
      if (response?.statusCode == 201) {
        emit(StudentProjectRequestSuccessState());
      } else {
        emit(StudentProjectRequestErrorState(response!.statusCode.toString()));
      }
    } catch (error) {
      emit(StudentProjectRequestErrorState(error.toString()));
    }
  }
}
