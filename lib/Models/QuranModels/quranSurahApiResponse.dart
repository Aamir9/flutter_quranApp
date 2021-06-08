class QuranSurahApiResponse {
 late  int code;
 late  String status;
 late List<Data> data;

  QuranSurahApiResponse({required this.code, required this.status, required this.data});

  QuranSurahApiResponse.fromJson(Map<String?, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      // data = new List<Data>();
      data = [];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String?, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    // ignore: unnecessary_null_comparison
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  late int number;
  late String name;
  late  String englishName;
  late String englishNameTranslation;
  late int numberOfAyahs;
  late String revelationType;

  Data(
      { required  this.number,
        required  this.name,
        required  this.englishName,
        required  this.englishNameTranslation,
        required  this.numberOfAyahs,
        required  this.revelationType});

  Data.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    numberOfAyahs = json['numberOfAyahs'];
    revelationType = json['revelationType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['name'] = this.name;
    data['englishName'] = this.englishName;
    data['englishNameTranslation'] = this.englishNameTranslation;
    data['numberOfAyahs'] = this.numberOfAyahs;
    data['revelationType'] = this.revelationType;
    return data;
  }
}
