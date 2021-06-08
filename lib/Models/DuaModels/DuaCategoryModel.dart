class DuaCategoryModel {
 late List<DuaCategories> duaCategories;

   DuaCategoryModel({ required this.duaCategories});

  DuaCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['dua_categories'] != null) {
      // duaCategories = new List<DuaCategories>();
      duaCategories = [];
      json['dua_categories'].forEach((v) {
        duaCategories.add(new DuaCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.duaCategories.length > 0) {
      data['dua_categories'] =
          this.duaCategories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DuaCategories {
  late int iId;
  late Null arTitle;
  late String enTitle;
  late Null frTitle;

  DuaCategories({required this.iId, this.arTitle, required this.enTitle, this.frTitle});

  DuaCategories.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    arTitle = json['ar_title'];
    enTitle = json['en_title'];
    frTitle = json['fr_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.iId;
    data['ar_title'] = this.arTitle;
    data['en_title'] = this.enTitle;
    data['fr_title'] = this.frTitle;
    return data;
  }
}
