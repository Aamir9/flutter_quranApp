class RecitationsListApiResponse {
 var recitations;

  RecitationsListApiResponse({required this.recitations});

  RecitationsListApiResponse.fromJson(Map<String, dynamic> json) {
    if (json['recitations'] != null) {
      // recitations = new List<Recitations>();
      recitations = [];
      json['recitations'].forEach((v) {
        recitations.add(new Recitations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_null_comparison
    if (this.recitations != null) {
      data['recitations'] = this.recitations.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Recitations {
  late int id;
  late String reciterName;
  late String style;
  late TranslatedName translatedName;

  Recitations({required this.id, required this.reciterName, required this.style, required this.translatedName});

  Recitations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reciterName = json['reciter_name'];
    style = json['style'];
    translatedName = (json['translated_name'] != null
        ? new TranslatedName.fromJson(json['translated_name'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reciter_name'] = this.reciterName;
    data['style'] = this.style;
    // ignore: unnecessary_null_comparison
    if (this.translatedName != null) {
      data['translated_name'] = this.translatedName.toJson();
    }
    return data;
  }
}

class TranslatedName {
  late String name ;
  late String languageName;

  TranslatedName({required this.name , required this.languageName});

  TranslatedName.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    languageName = json['language_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['language_name'] = this.languageName;
    return data;
  }
}
