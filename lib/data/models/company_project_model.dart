
import 'models.dart';

class CompanyProjectModel {
  int? id;
  MultipleLanguageElement? name;
  MultipleLanguageElement? category;
  MultipleLanguageElement? description;
  String? link;
  List<ImageModel>? pictures;



  CompanyProjectModel({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.link,
    required this.pictures,

  });

  factory CompanyProjectModel.fromJson(Map<String, dynamic> json) {
    List<ImageModel> images=[];
    if(json["mobile_pictures"] != null){
      json["mobile_pictures"].forEach((picture){
         images.add(ImageModel.fromJson(picture));
      });
    }
    return CompanyProjectModel(
      id: json["pk"] ?? -1,
      name: (json["project_name"] != null)
          ? MultipleLanguageElement.fromJson(json["project_name"])
          : null,
      category: (json["project_field"] != null)
          ? MultipleLanguageElement.fromJson(json["project_field"])
          : null,
      description: (json["project_desc"] != null)
          ? MultipleLanguageElement.fromJson(json["project_desc"])
          : null,
      link: json["project_link"] ?? "",
      pictures: images,
    );
  }
}
