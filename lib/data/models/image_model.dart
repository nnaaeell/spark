class ImageModel {
  String? image;


  ImageModel({
    required this.image,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json){
    return ImageModel(
      image: json["image"] ?? "",
    );
  }
}