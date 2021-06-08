class SurahDetailsApiResponse {
  late int code;
  late String status;
  late Data data;

  SurahDetailsApiResponse({required this.code, required this.status, required this.data});

  SurahDetailsApiResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    // ignore: unnecessary_null_comparison
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  late int number;
  late String name;
  late String englishName;
  late String englishNameTranslation;
  late String revelationType;
  late int numberOfAyahs;
  late List<Ayahs> ayahs;
  late Edition edition;

  Data(
      {required this.number,
        required this.name,
        required this.englishName,
        required this.englishNameTranslation,
        required this.revelationType,
        required this.numberOfAyahs,
        required this.ayahs,
        required this.edition});

  Data.fromJson(Map<String?, dynamic> json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    revelationType = json['revelationType'];
    numberOfAyahs = json['numberOfAyahs'];
    if (json['ayahs'] != null) {
      // ayahs = new List<Ayahs>();
      ayahs = [];
      json['ayahs'].forEach((v) {
        ayahs.add(new Ayahs.fromJson(v));
      });
    }
    edition =
    (json['edition'] != null ? new Edition.fromJson(json['edition']) : null)!;
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['number'] = this.number;
    data['name'] = this.name;
    data['englishName'] = this.englishName;
    data['englishNameTranslation'] = this.englishNameTranslation;
    data['revelationType'] = this.revelationType;
    data['numberOfAyahs'] = this.numberOfAyahs;
    if (this.ayahs.length >= 0) {
      data['ayahs'] = this.ayahs.map((v) => v.toJson()).toList();
    }
    // ignore: unnecessary_null_comparison
    if (this.edition !=null) {
      data['edition'] = this.edition.toJson();
    }
    return data;
  }
}

class Ayahs {
  late int number;
  late String text;
  late int numberInSurah;
  late int juz;
  late int manzil;
  late int page;
  late int ruku;
  late int hizbQuarter;
  late bool sajda;

  Ayahs(
      {required this.number,
        required this.text,
        required this.numberInSurah,
        required this.juz,
        required this.manzil,
        required this.page,
        required this.ruku,
        required this.hizbQuarter,
        required this.sajda});

  Ayahs.fromJson(Map<String?, dynamic> json) {
    number = json['number'];
    text = json['text'];
    numberInSurah = json['numberInSurah'];
    juz = json['juz'];
    manzil = json['manzil'];
    page = json['page'];
    ruku = json['ruku'];
    hizbQuarter = json['hizbQuarter'];
    sajda = json['sajda'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['number'] = this.number;
    data['text'] = this.text;
    data['numberInSurah'] = this.numberInSurah;
    data['juz'] = this.juz;
    data['manzil'] = this.manzil;
    data['page'] = this.page;
    data['ruku'] = this.ruku;
    data['hizbQuarter'] = this.hizbQuarter;
    data['sajda'] = this.sajda;
    return data;
  }
}

class Edition {
  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? format;
  String? type;
  String? direction;

  Edition(
      {this.identifier,
        this.language,
        this.name,
        this.englishName,
        this.format,
        this.type,
        this.direction});

  Edition.fromJson(Map<String?, dynamic> json) {
    identifier = json['identifier'];
    language = json['language'];
    name = json['name'];
    englishName = json['englishName'];
    format = json['format'];
    type = json['type'];
    direction = json['direction'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['identifier'] = this.identifier;
    data['language'] = this.language;
    data['name'] = this.name;
    data['englishName'] = this.englishName;
    data['format'] = this.format;
    data['type'] = this.type;
    data['direction'] = this.direction;
    return data;
  }
}
