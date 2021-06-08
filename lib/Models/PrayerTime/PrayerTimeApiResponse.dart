class PrayerTimeApiResponse {
  late int code;
  late String status;
  late List<Data> data;

  PrayerTimeApiResponse({required this.code, required this.status, required this.data});

  PrayerTimeApiResponse.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
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
  late Timings timings;
  late Date date;
  late Meta meta;

  Data({required this.timings, required this.date, required this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    timings =
    (json['timings'] != null ? new Timings.fromJson(json['timings']) : null)!;
    date = (json['date'] != null ? new Date.fromJson(json['date']) : null)!;
    meta = (json['meta'] != null ? new Meta.fromJson(json['meta']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_null_comparison
    if (this.timings != null) {
      data['timings'] = this.timings.toJson();
    }
    // ignore: unnecessary_null_comparison
    if (this.date != null) {
      data['date'] = this.date.toJson();
    }
    // ignore: unnecessary_null_comparison
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    return data;
  }
}

class Timings {
 late  String fajr;
 late  String sunrise;
 late  String dhuhr;
 late  String asr;
 late  String sunset;
 late  String maghrib;
 late  String isha;
 late  String imsak;
 late  String midnight;

  Timings(
      {required this.fajr,
       required  this.sunrise,
      required   this.dhuhr,
       required  this.asr,
      required   this.sunset,
      required   this.maghrib,
      required   this.isha,
      required   this.imsak,
      required   this.midnight});

  Timings.fromJson(Map<String, dynamic> json) {
    fajr = json['Fajr'];
    sunrise = json['Sunrise'];
    dhuhr = json['Dhuhr'];
    asr = json['Asr'];
    sunset = json['Sunset'];
    maghrib = json['Maghrib'];
    isha = json['Isha'];
    imsak = json['Imsak'];
    midnight = json['Midnight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Fajr'] = this.fajr;
    data['Sunrise'] = this.sunrise;
    data['Dhuhr'] = this.dhuhr;
    data['Asr'] = this.asr;
    data['Sunset'] = this.sunset;
    data['Maghrib'] = this.maghrib;
    data['Isha'] = this.isha;
    data['Imsak'] = this.imsak;
    data['Midnight'] = this.midnight;
    return data;
  }
}

class Date {
 late String readable;
 late String timestamp;
 late  Gregorian gregorian;
 late  Hijri hijri;

  Date({required this.readable, required this.timestamp, required this.gregorian, required this.hijri});

  Date.fromJson(Map<String, dynamic> json) {
    readable = json['readable'];
    timestamp = json['timestamp'];
    gregorian = (json['gregorian'] != null
        ? new Gregorian.fromJson(json['gregorian'])
        : null)!;
    hijri = (json['hijri'] != null ? new Hijri.fromJson(json['hijri']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['readable'] = this.readable;
    data['timestamp'] = this.timestamp;
    // ignore: unnecessary_null_comparison
    if (this.gregorian != null) {
      data['gregorian'] = this.gregorian.toJson();
    }
    // ignore: unnecessary_null_comparison
    if (this.hijri != null) {
      data['hijri'] = this.hijri.toJson();
    }
    return data;
  }
}

class Gregorian {
  String? date;
  String? format;
  String? day;
  Weekday? weekday;
  Month? month;
  String? year;
  Designation? designation;

  Gregorian(
      {this.date,
        this.format,
        this.day,
        this.weekday,
        this.month,
        this.year,
        this.designation});

  Gregorian.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday =
    json['weekday'] != null ? new Weekday.fromJson(json['weekday']) : null;
    month = json['month'] != null ? new Month.fromJson(json['month']) : null;
    year = json['year'];
    designation = json['designation'] != null
        ? new Designation.fromJson(json['designation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['format'] = this.format;
    data['day'] = this.day;
    if (this.weekday != null) {
      data['weekday'] = this.weekday?.toJson();
    }
    if (this.month != null) {
      data['month'] = this.month?.toJson();
    }
    data['year'] = this.year;
    if (this.designation != null) {
      data['designation'] = this.designation?.toJson();
    }
    return data;
  }
}

class Designation {
  String? abbreviated;
  String? expanded;

  Designation({this.abbreviated, this.expanded});

  Designation.fromJson(Map<String, dynamic> json) {
    abbreviated = json['abbreviated'];
    expanded = json['expanded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['abbreviated'] = this.abbreviated;
    data['expanded'] = this.expanded;
    return data;
  }
}

class Hijri {
  String? date;
  String? format;
  String? day;
  Weekday? weekday;
  Month? month;
  String? year;
  Designation? designation;
  List<String>? holidays;

  Hijri(
      {this.date,
        this.format,
        this.day,
        this.weekday,
        this.month,
        this.year,
        this.designation,
        this.holidays});

  Hijri.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday =
    json['weekday'] != null ? new Weekday.fromJson(json['weekday']) : null;
    month = json['month'] != null ? new Month.fromJson(json['month']) : null;
    year = json['year'];
    designation = json['designation'] != null
        ? new Designation.fromJson(json['designation'])
        : null;
    holidays = json['holidays'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['format'] = this.format;
    data['day'] = this.day;
    if (this.weekday != null) {
      data['weekday'] = this.weekday?.toJson();
    }
    if (this.month != null) {
      data['month'] = this.month?.toJson();
    }
    data['year'] = this.year;
    if (this.designation != null) {
      data['designation'] = this.designation?.toJson();
    }
    data['holidays'] = this.holidays;
    return data;
  }
}

class Weekday {
  String? en;
  String? ar;

  Weekday({this.en, this.ar});

  Weekday.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['ar'] = this.ar;
    return data;
  }
}

class Month {
  int? number;
  String? en;
  String? ar;

  Month({this.number, this.en, this.ar});

  Month.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    en = json['en'];
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['en'] = this.en;
    data['ar'] = this.ar;
    return data;
  }
}

class Meta {
  double? latitude;
  double? longitude;
  String? timezone;
  Method? method;
  String? latitudeAdjustmentMethod;
  String? midnightMode;
  String? school;
  Offset? offset;

  Meta(
      {this.latitude,
        this.longitude,
        this.timezone,
        this.method,
        this.latitudeAdjustmentMethod,
        this.midnightMode,
        this.school,
        this.offset});

  Meta.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    timezone = json['timezone'];
    method =
    json['method'] != null ? new Method.fromJson(json['method']) : null;
    latitudeAdjustmentMethod = json['latitudeAdjustmentMethod'];
    midnightMode = json['midnightMode'];
    school = json['school'];
    offset =
    json['offset'] != null ? new Offset.fromJson(json['offset']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['timezone'] = this.timezone;
    if (this.method != null) {
      data['method'] = this.method?.toJson();
    }
    data['latitudeAdjustmentMethod'] = this.latitudeAdjustmentMethod;
    data['midnightMode'] = this.midnightMode;
    data['school'] = this.school;
    if (this.offset != null) {
      data['offset'] = this.offset?.toJson();
    }
    return data;
  }
}

class Method {
  int? id;
  String? name;
  Params? params;

  Method({this.id, this.name, this.params});

  Method.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    params =
    json['params'] != null ? new Params.fromJson(json['params']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.params != null) {
      data['params'] = this.params?.toJson();
    }
    return data;
  }
}

class Params {
  int? fajr;
  int? isha;

  Params({this.fajr, this.isha});

  Params.fromJson(Map<String, dynamic> json) {
    fajr = json['Fajr'];
    isha = json['Isha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Fajr'] = this.fajr;
    data['Isha'] = this.isha;
    return data;
  }
}

class Offset {
  int? imsak;
  int? fajr;
  int? sunrise;
  int? dhuhr;
  int? asr;
  int? maghrib;
  int? sunset;
  int? isha;
  int? midnight;

  Offset(
      {this.imsak,
        this.fajr,
        this.sunrise,
        this.dhuhr,
        this.asr,
        this.maghrib,
        this.sunset,
        this.isha,
        this.midnight});

  Offset.fromJson(Map<String, dynamic> json) {
    imsak = json['Imsak'];
    fajr = json['Fajr'];
    sunrise = json['Sunrise'];
    dhuhr = json['Dhuhr'];
    asr = json['Asr'];
    maghrib = json['Maghrib'];
    sunset = json['Sunset'];
    isha = json['Isha'];
    midnight = json['Midnight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Imsak'] = this.imsak;
    data['Fajr'] = this.fajr;
    data['Sunrise'] = this.sunrise;
    data['Dhuhr'] = this.dhuhr;
    data['Asr'] = this.asr;
    data['Maghrib'] = this.maghrib;
    data['Sunset'] = this.sunset;
    data['Isha'] = this.isha;
    data['Midnight'] = this.midnight;
    return data;
  }
}
