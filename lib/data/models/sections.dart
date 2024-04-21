class Sections {
  List<Section> section_list = [];

  Sections.fromJson(Map<String, dynamic>json){
    section_list = (json['sections'] as List)
        .map((e) => Section.fromJson(e)).toList();
  }
}

class Section{
  late int id;
  String section_name='';
  String section_image='';

  Section.fromJson(Map<String,dynamic>json){
    id=json['id'];
    section_name=json['section_name'];
    section_image=json['section_image'];
  }

}