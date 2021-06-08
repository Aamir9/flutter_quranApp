class LanguagesListApiResponse {
  late List<Languages> languages;

  LanguagesListApiResponse({required this.languages});

  LanguagesListApiResponse.fromJson(Map<String?, dynamic> json) {
    if (json['languages'] != null) {
      // languages = new List<Languages>();
      languages = [];
      json['languages'].forEach((v) {
        languages.add(new Languages.fromJson(v));
      });
    }
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    // ignore: unnecessary_null_comparison
    if (this.languages != null) {
      data['languages'] = this.languages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Languages {
 late int id;
 late String name;
 late String isoCode;
 late String nativeName;
 late String direction;
 late int translationsCount;
 late TranslatedName? translatedName;

  Languages(
      {required this.id,
        required this.name,
        required this.isoCode,
        required this.nativeName,
        required this.direction,
        required this.translationsCount,
        required this.translatedName});

  Languages.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isoCode = json['iso_code'];
    nativeName = json['native_name'];
    direction = json['direction'];
    translationsCount = json['translations_count'];
    translatedName = json['translated_name'] != null
        ? new TranslatedName.fromJson(json['translated_name'])
        : null;
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['iso_code'] = this.isoCode;
    data['native_name'] = this.nativeName;
    data['direction'] = this.direction;
    data['translations_count'] = this.translationsCount;
    if (this.translatedName != null) {
      data['translated_name'] = this.translatedName?.toJson();
    }
    return data;
  }
}

class TranslatedName {
  String? name;
  String? languageName;

  TranslatedName({this.name, this.languageName});

  TranslatedName.fromJson(Map<String?, dynamic> json) {
    name = json['name'];
    languageName = json['language_name'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['name'] = this.name;
    data['language_name'] = this.languageName;
    return data;
  }
}
