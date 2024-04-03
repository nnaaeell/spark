import 'models.dart';


class ServiceModel {
  int? id;
  MultipleLanguageElement? name;
  String? picture;

  ServiceModel({required this.id, required this.name, required this.picture});

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
        id: json["pk"] ?? -1,
        name: MultipleLanguageElement.fromJson(json["service_name"]),
        picture: json["service_picture"]);
  }
}
