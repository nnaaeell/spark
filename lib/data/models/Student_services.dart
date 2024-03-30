class StudentsServices{
  List<Project> projects=[];
  List<Course> courses=[];

  StudentsServices.fromJson(Map<String,dynamic>json){
    projects=(json['projects'] as List)
        .map((e) =>Project.formJson(e)).toList();


  }
}

class Project{
  late int id;
  ProjectName? projectName;
  ProjectField? projectField;
  String project_link='';
  ProjectDesc? projectDesc;
  List<String> pictures=[];

  Project.formJson(Map<String,dynamic>json){
    id=json['id'];
    project_link=json['project_link'];
    projectName=ProjectName.formJson(json['project_name']);
    projectField=ProjectField.formJson(json['project_field']);
    projectDesc=ProjectDesc.formJson(json['project_desc']);
    pictures=json['pictures'] as List<String>;

  }

}
class ProjectName{
  String ar='';
  String en='';
  
  ProjectName.formJson(Map<String,dynamic>json){
    ar=json['AR'];
    en=json['EN'];
  }

}
class ProjectField{
  String ar='';
  String en='';
  
  ProjectField.formJson(Map<String,dynamic>json){
    ar=json['AR'];
    en=json['EN'];
  }
}
class ProjectDesc{
  String ar='';
  String en='';

  ProjectDesc.formJson(Map<String,dynamic>json){
    ar=json['AR'];
    en=json['EN'];
  }
}




class Course{
  late int id;
  String image='';
  Name? name;
  Desc? desc;
  Teacher? teacher;

  Course.fromJson(Map<String,dynamic>json){
    id=json['id'];
    image=json['image'];
    name=Name.fromJson(json['name']);
    desc=Desc.fromJson(json['desc']);
    teacher=Teacher.fromJson(json['teacher']);
  }


}

class Name{
  String ar='';
  String en='';

  Name.fromJson(Map<String,dynamic>json){
    ar=json['AR'];
    en=json['EN'];
  }
}
class Desc{
  String ar='';
  String en='';

  Desc.fromJson(Map<String,dynamic>json){
    ar=json['AR'];
    en=json['EN'];
  }
}
class Teacher{
String ar='';
String en='';

Teacher.fromJson(Map<String,dynamic>json){
  ar=json['AR'];
  en=json['EN'];
}
}