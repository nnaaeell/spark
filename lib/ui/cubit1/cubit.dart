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

 static List<Project> projects=[];
 static List<Course> courses=[];
 static List<Member> ourTeamList=[];

 late StudentsServices studentsServices;
 late OurTeam ourTeam;

  void getProjectsAndCourses(int id){
   emit(GetProjectsCoursesStateLoading());
   http.get(
    Uri.parse('https://sparkeng.pythonanywhere.com/rest/Student_Services_mobile/${id}'),
    headers: {
     'Content-Type': 'application/json', // تحديد نوع المحتوى
    },
   ).then((value) {
    var data = jsonDecode(utf8.decode(value.bodyBytes));
    print(data.toString());
    studentsServices = StudentsServices.fromJson(data as Map<String, dynamic>);
    projects=studentsServices.projects;
    courses=studentsServices.courses;
    emit(GetProjectsCoursesStateSuccess());

   }).catchError((onError) {
    print(onError.toString());
   });
 }



  void getOurTeam(){
   emit(GetOurTeamLoading());
   http.get(
    Uri.parse('https://sparkeng.pythonanywhere.com/rest/member_list_mobile/'),
    headers: {
     'Content-Type': 'application/json', // تحديد نوع المحتوى
    },
   ).then((value){
    var data = jsonDecode(utf8.decode(value.bodyBytes));
    print(data.toString());
    ourTeam = OurTeam.fromJson(data as Map<String, dynamic>);
    ourTeamList=ourTeam.ourTeamList;


    emit(GetOurTeamSuccess());

   }).catchError((e){
    print(onError.toString());
    emit(GetOurTeamErorr());
   });

  }





}