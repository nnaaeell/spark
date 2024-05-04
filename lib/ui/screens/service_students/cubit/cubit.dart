import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/data/models/sections.dart';
import 'package:spark/ui/screens/service_students/cubit/states.dart';
import 'package:http/http.dart'as http;

class CubitSections extends Cubit<SectionsStates>{
  CubitSections():super(InitialSectionsState());


  static CubitSections get(context) => BlocProvider.of(context);

  late Sections sections;
  static List<Section>section_list_for_cubit=[];

  void getSections(){
    emit(GetSectionsLoading());
    http.get(
      Uri.parse('https://sparkeng.pythonanywhere.com/rest/sections_list_mobile/'),
      headers: {
        'Content-Type': 'application/json', // تحديد نوع المحتوى
      },
    ).then((value){
      var data = jsonDecode(utf8.decode(value.bodyBytes));
      print(data.toString());
       sections=Sections.fromJson(data as Map<String, dynamic>);
       section_list_for_cubit=sections.section_list;
       print(section_list_for_cubit[0].id);

      emit(GetSectionsSuccess());

    }).catchError((e){
      print(onError.toString());
      emit(GetSectionsErorr());
    });

  }




}