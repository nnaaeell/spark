import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/network/end_points.dart';
import '../../../../network/remote/dio_helper.dart';
import 'student_course_request_states.dart';

class StudentCourseRequestCubit extends Cubit<StudentCourseRequestStates> {
  StudentCourseRequestCubit() : super(StudentCourseRequestInitialState());

  static StudentCourseRequestCubit get(context) => BlocProvider.of(context);



  Future<void> postStudentCourseRequest({
    required int id,
    required String fullName,
    required String phoneNumber,
    required String studentNotes,
  }) async {
    var formData = FormData.fromMap({
        "name": fullName,
        "phone": phoneNumber,
        "desc": studentNotes,
        "course_name": id
    },);
    emit(StudentCourseRequestLoadingState());
    try {
      var response = await DioHelper.postData(
        url: STUDENTCOURSEREQUEST,
        data: formData
      );
      if (response?.statusCode == 201) {
        emit(StudentCourseRequestSuccessState());
      } else {
        emit(StudentCourseRequestErrorState(response!.statusCode.toString()));
      }
    } catch (error) {
      emit(StudentCourseRequestErrorState(error.toString()));
    }
  }
}
