class MultipleLanguageElement {
  String? arabic;
  String? english;

  MultipleLanguageElement({
    required this.arabic,
    required this.english,
  });

  factory MultipleLanguageElement.fromJson(Map<String, dynamic> json){
    return MultipleLanguageElement(
      arabic: json["AR"] ?? "",
      english: json["EN"] ?? "",
    );
  }
}