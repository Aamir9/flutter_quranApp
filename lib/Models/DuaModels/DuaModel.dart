class DuaModel {
  late List<DuaList> duaList;

  DuaModel({required this.duaList});

  DuaModel.fromJson(Map<String, dynamic> json) {
    if (json['dua_list'] != null) {
      // duaList = new List<DuaList>();
      duaList = [];
      json['dua_list'].forEach((v) {
        duaList.add(new DuaList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_null_comparison
    if (this.duaList != null) {
      data['dua_list'] = this.duaList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DuaList {
 late int iId;
 late int groupId;
 late int fav;
 late  String arDua;
 late Null arReference;
 late String enTranslation;
 late String enReference;

  DuaList(
      {required this.iId,
      required  this.groupId,
      required  this.fav,
      required  this.arDua,
      required  this.arReference,
      required  this.enTranslation,
      required  this.enReference});

  DuaList.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    groupId = json['group_id'];
    fav = json['fav'];
    arDua = json['ar_dua'];
    arReference = json['ar_reference'];
    enTranslation = json['en_translation'];
    enReference = json['en_reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.iId;
    data['group_id'] = this.groupId;
    data['fav'] = this.fav;
    data['ar_dua'] = this.arDua;
    data['ar_reference'] = this.arReference;
    data['en_translation'] = this.enTranslation;
    data['en_reference'] = this.enReference;
    return data;
  }
}
