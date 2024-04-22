import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/data/models/response_for_requast.dart';
import 'package:spark/network/end_points.dart';
import '../../../../network/remote/dio_helper.dart';
import 'student_course_request_states.dart';

class StudentCourseRequestCubit extends Cubit<StudentCourseRequestStates> {
  StudentCourseRequestCubit() : super(StudentCourseRequestInitialState());

  static StudentCourseRequestCubit get(context) => BlocProvider.of(context);


  ResponseForRequast? responseForRequast;


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
        "course": id
    },);
    emit(StudentCourseRequestLoadingState());
    try {
      var response = await DioHelper.postData(
        url: STUDENTCOURSEREQUEST,
        data: formData
      );

      responseForRequast=ResponseForRequast.fromJsonn(response!.data);
        emit(StudentCourseRequestSuccessState(id: responseForRequast!.id,message: responseForRequast!.massege));

    } catch (error) {
      emit(StudentCourseRequestErrorState(error.toString()));
    }
  }
}
