import 'package:spark/data/models/multiple_language_element.dart';

import 'models.dart';

class ServiceModel {
  int? id;
  MultipleLanguageElement? name;
  MultipleLanguageElement? description;
  String? picture;
  String? icon;

  ServiceModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.picture,
    required this.description,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json["id"] ?? -1,
      name: (json["service_name"] != null)
          ? MultipleLanguageElement.fromJson(json["service_name"])
          : null,
      description: (json["service_description"] != null)
          ? MultipleLanguageElement.fromJson(json["service_description"])
          : null,
      picture: json["service_picture_mobile"] ?? "",
      icon: json["service_icon"] ?? "",
    );
  }
}
