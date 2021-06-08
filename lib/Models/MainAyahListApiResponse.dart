class MainAyahListApiResponse {
  late List<Data> data;

  MainAyahListApiResponse({required this.data});

  MainAyahListApiResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      //  data = new List<Data>();
      data = [];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_null_comparison
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
 late String id;
 late String ayat;
 late String translation;
 late String ref;

  Data({required this.id, required this.ayat, required this.translation, required this.ref});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ayat = json['ayat'];
    translation = json['translation'];
    ref = json['ref'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ayat'] = this.ayat;
    data['translation'] = this.translation;
    data['ref'] = this.ref;
    return data;
  }
}
