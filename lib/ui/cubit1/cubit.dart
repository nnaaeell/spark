import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/data/models/Student_services.dart';
import 'package:spark/data/models/our_team.dart';
import 'package:spark/ui/Cubit1/states.dart';
import 'package:http/http.dart'as http;


class Cubit1 extends Cubit<Cubit1States>{
  Cubit1() : super(InitialCubit1State());

  static Cubit1 get(context) => BlocProvider.of(context);

 static  bool isARCH=false;

 static List<Project> projectsForIT=[];
 static List<Course> coursesForIT=[];
  static List<Project> projectsForARCH=[];
  static List<Course> coursesForARCH=[];
 static List<Member> ourTeamList=[];

 late StudentsServices studentsServices;
 late OurTeam ourTeam;


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
    projectsForARCH=studentsServices.projects;
    coursesForARCH=studentsServices.courses;
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
    projectsForIT=studentsServices.projects;
    coursesForIT=studentsServices.courses;
    emit(GetProjectsCoursesStateSuccess());

   }).catchError((onError) {
    print(onError.toString());
   });

  }

  void getOurTeam(){
   emit(GetOurTeamLoading());
   http.get(
    Uri.parse('https://sparkeng.pythonanywhere.com/rest/member_list/'),
    headers: {
     'Content-Type': 'application/json', // تحديد نوع المحتوى
    },
   ).then((value){
    var data = jsonDecode(utf8.decode(value.bodyBytes));
    ourTeam = OurTeam.fromJson(data as Map<String, dynamic>);
    ourTeamList=ourTeam.ourTeamList;


    emit(GetOurTeamSuccess());

   }).catchError((e){
    print(onError.toString());
    emit(GetOurTeamErorr());
   });

  }



}