class CurrentDatePrayerTimeApiResponse {
 late int code;
 late String status;
 late Data data;

  CurrentDatePrayerTimeApiResponse({ required this.code,  required this.status,  required this.data});

  CurrentDatePrayerTimeApiResponse.fromJson(Map<String, dynamic> json) {
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
 late String fajr;
 late String sunrise;
 late String dhuhr;
 late String asr;
 late String sunset;
 late String maghrib;
 late String isha;
 late String imsak;
 late String midnight;

  Timings(
      { required this.fajr,
        required this.sunrise,
        required this.dhuhr,
        required this.asr,
        required this.sunset,
        required this.maghrib,
        required this.isha,
        required this.imsak,
        required this.midnight});

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
  late Hijri hijri;
  late Gregorian gregorian;

  Date({required this.readable, required this.timestamp, required this.hijri, required this.gregorian});

  Date.fromJson(Map<String, dynamic> json) {
    readable = json['readable'];
    timestamp = json['timestamp'];
    hijri = (json['hijri'] != null ? new Hijri.fromJson(json['hijri']) : null)!;
    gregorian = (json['gregorian'] != null
        ? new Gregorian.fromJson(json['gregorian'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['readable'] = this.readable;
    data['timestamp'] = this.timestamp;
    // ignore: unnecessary_null_comparison
    if (this.hijri != null) {
      data['hijri'] = this.hijri.toJson();
    }
    // ignore: unnecessary_null_comparison
    if (this.gregorian != null) {
      data['gregorian'] = this.gregorian.toJson();
    }
    return data;
  }
}

class Hijri {
  late String date;
  late String format;
  late String day;
  late Weekday weekday;
  late Month month;
  late String year;
  late Designation designation;

  Hijri(
      {required this.date,
        required this.format,
        required this.day,
        required this.weekday,
        required this.month,
        required this.year,
        required this.designation});

  Hijri.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday =
    (json['weekday'] != null ? new Weekday.fromJson(json['weekday']) : null)!;
    month = (json['month'] != null ? new Month.fromJson(json['month']) : null)!;
    year = json['year'];
    designation = (json['designation'] != null
        ? new Designation.fromJson(json['designation'])
        : null)!;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['format'] = this.format;
    data['day'] = this.day;
    // ignore: unnecessary_null_comparison
    if (this.weekday != null) {
      data['weekday'] = this.weekday.toJson();
    }
    // ignore: unnecessary_null_comparison
    if (this.month != null) {
      data['month'] = this.month.toJson();
    }
    data['year'] = this.year;
    // ignore: unnecessary_null_comparison
    if (this.designation != null) {
      data['designation'] = this.designation.toJson();
    }
    // if (this.holidays != null) {
    //   data['holidays'] = this.holidays.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Weekday {
 late  String? en;
 late String? ar;

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
  late int? number;
  late String? en;
  late String? ar;

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

class Designation {
 late  String? abbreviated;
  late String? expanded;

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

class Gregorian {
 late String date;
 late String format;
 late String day;
 late Weekday weekday;
 late Month month;
 late String year;
 late Designation designation;

  Gregorian(
      {required this.date,
        required this.format,
        required this.day,
        required this.weekday,
        required this.month,
        required this.year,
        required this.designation});

  Gregorian.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday =
    (json['weekday'] != null ? new Weekday.fromJson(json['weekday']) : null)!;
    month = (json['month'] != null ? new Month.fromJson(json['month']) : null)!;
    year = json['year'];
    designation = (json['designation'] != null
        ? new Designation.fromJson(json['designation'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['format'] = this.format;
    data['day'] = this.day;
    // ignore: unnecessary_null_comparison
    if (this.weekday != null) {
      data['weekday'] = this.weekday.toJson();
    }
    // ignore: unnecessary_null_comparison
    if (this.month != null) {
      data['month'] = this.month.toJson();
    }
    data['year'] = this.year;
    // ignore: unnecessary_null_comparison
    if (this.designation != null) {
      data['designation'] = this.designation.toJson();
    }
    return data;
  }
}


class Meta {
  late double latitude;
  late double longitude;
  late String timezone;
  late Method method;
  late String latitudeAdjustmentMethod;
  late String midnightMode;
  late String school;
  late Offset offset;

  Meta(
      { required this.latitude,
        required this.longitude,
        required this.timezone,
        required this.method,
        required this.latitudeAdjustmentMethod,
        required this.midnightMode,
        required this.school,
        required this.offset});

  Meta.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    timezone = json['timezone'];
    method =
    (json['method'] != null ? new Method.fromJson(json['method']) : null)!;
    latitudeAdjustmentMethod = json['latitudeAdjustmentMethod'];
    midnightMode = json['midnightMode'];
    school = json['school'];
    offset =
    (json['offset'] != null ? new Offset.fromJson(json['offset']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['timezone'] = this.timezone;
    // ignore: unnecessary_null_comparison
    if (this.method != null) {
      data['method'] = this.method.toJson();
    }
    data['latitudeAdjustmentMethod'] = this.latitudeAdjustmentMethod;
    data['midnightMode'] = this.midnightMode;
    data['school'] = this.school;
    // ignore: unnecessary_null_comparison
    if (this.offset != null) {
      data['offset'] = this.offset.toJson();
    }
    return data;
  }
}

class Method {
 late int id;
 late  String name;
 late  Params params;

  Method({required this.id, required this.name, required this.params});

  Method.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    params =
    (json['params'] != null ? new Params.fromJson(json['params']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    // ignore: unnecessary_null_comparison
    if (this.params != null) {
      data['params'] = this.params.toJson();
    }
    return data;
  }
}

class Params {
 late int? fajr;
 late int? isha;

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
 late int imsak;
 late int fajr;
 late  int sunrise;
 late int dhuhr;
 late int asr;
 late  int maghrib;
 late int sunset;
 late int isha;
 late int midnight;

  Offset(
      {required this.imsak,
        required this.fajr,
        required this.sunrise,
        required this.dhuhr,
        required this.asr,
        required this.maghrib,
        required this.sunset,
        required this.isha,
        required this.midnight});

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
