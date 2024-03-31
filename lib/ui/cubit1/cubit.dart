import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/data/models/Student_services.dart';
import 'package:spark/ui/Cubit1/states.dart';
import 'package:http/http.dart'as http;

class Cubit1 extends Cubit<Cubit1States>{
  Cubit1() : super(InitialCubit1State());


  static Cubit1 get(context) => BlocProvider.of(context);

 static List<Project> projects=[];
 static List<Course> courses=[];

 late StudentsServices studentsServices;

  void getProjectsAndCoursesARCH(){
   emit(GetProjectsCoursesStateLoading());
   http.get(
    Uri.parse('https://sparkeng.pythonanywhere.com/rest/ProjectCourseView_ARCH/'),
    headers: {
     'Content-Type': 'application/json', // تحديد نوع المحتوى
    },
   ).then((value) {
    var data = jsonDecode(utf8.decode(value.bodyBytes));
    print(data.toString());
    studentsServices = StudentsServices.fromJson(data as Map<String, dynamic>);
    projects=studentsServices.projects;
    courses=studentsServices.courses;
    print(projects.length);
    print(courses.length);
    emit(GetProjectsCoursesStateSuccess());

   }).catchError((onError) {
    print(onError.toString());
   });

 }

  void getProjectsAndCoursesIT(){
   emit(GetProjectsCoursesStateLoading());
   http.get(
    Uri.parse('https://sparkeng.pythonanywhere.com/rest/ProjectCourseView_IT/'),
    headers: {
     'Content-Type': 'application/json', // تحديد نوع المحتوى
    },
   ).then((value) {
    var data = jsonDecode(utf8.decode(value.bodyBytes));
    print(data.toString());
    studentsServices = StudentsServices.fromJson(data as Map<String, dynamic>);
    projects=studentsServices.projects;
    courses=studentsServices.courses;
    print(projects.length);
    print(courses.length);
    emit(GetProjectsCoursesStateSuccess());

   }).catchError((onError) {
    print(onError.toString());
   });

  }



}