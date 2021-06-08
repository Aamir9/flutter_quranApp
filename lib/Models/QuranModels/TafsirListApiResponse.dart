class TafsirListApiResponse {
 late List<Tafsirs> tafsirs;

  TafsirListApiResponse({required this.tafsirs});

  TafsirListApiResponse.fromJson(Map<String?, dynamic> json) {
    if (json['tafsirs'] != null) {
      // tafsirs = new List<Tafsirs>();
      tafsirs = [];
      json['tafsirs'].forEach((v) {
        tafsirs.add(new Tafsirs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_null_comparison
    if (this.tafsirs != null) {
      data['tafsirs'] = this.tafsirs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tafsirs {
 late int id;
 late String name;
 late String authorName;
 late String slug;
 late String languageName;
 late TranslatedName translatedName;

  Tafsirs(
      {required this.id,
        required this.name,
        required this.authorName,
        required this.slug,
        required this.languageName,
        required this.translatedName});

  Tafsirs.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    name = json['name'];
    authorName = json['author_name'];
    slug = json['slug'];
    languageName = json['language_name'];
    translatedName = (json['translated_name'] != null
        ? new TranslatedName.fromJson(json['translated_name'])
        : null)!;
  }

  Map<String?, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['author_name'] = this.authorName;
    data['slug'] = this.slug;
    data['language_name'] = this.languageName;
    // ignore: unnecessary_null_comparison
    if (this.translatedName != null) {
      data['translated_name'] = this.translatedName.toJson();
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
