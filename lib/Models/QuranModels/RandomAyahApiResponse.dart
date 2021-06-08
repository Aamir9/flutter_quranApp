class RandomAyahApiResponse {
 late Verse verse;

  RandomAyahApiResponse({required this.verse});

  RandomAyahApiResponse.fromJson(Map<String, dynamic> json) {
    verse = (json['verse'] != null ? new Verse.fromJson(json['verse']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_null_comparison
    if (this.verse != null) {
      data['verse'] = this.verse.toJson();
    }
    return data;
  }
}

class Verse {
  late int id;
  late int verseNumber;
  late String? verseKey;
  late int juzNumber;
  late int hizbNumber;
  late int rubNumber;
  late Null sajdahType;
  late Null sajdahNumber;
  late List<Words> words;

  Verse(
      {required this.id,
        required this.verseNumber,
        required this.verseKey,
        required this.juzNumber,
        required this.hizbNumber,
        required this.rubNumber,
        this.sajdahType,
        this.sajdahNumber,
        required this.words});

  Verse.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    verseNumber = json['verse_number'];
    verseKey = json['verse_key'];
    juzNumber = json['juz_number'];
    hizbNumber = json['hizb_number'];
    rubNumber = json['rub_number'];
    sajdahType = json['sajdah_type'];
    sajdahNumber = json['sajdah_number'];
    if (json['words'] != null) {
      // words = new List<Words>();
      words = [];
      json['words'].forEach((v) {
        words.add(new Words.fromJson(v));
      });
    }
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['verse_number'] = this.verseNumber;
    data['verse_key'] = this.verseKey;
    data['juz_number'] = this.juzNumber;
    data['hizb_number'] = this.hizbNumber;
    data['rub_number'] = this.rubNumber;
    data['sajdah_type'] = this.sajdahType;
    data['sajdah_number'] = this.sajdahNumber;
    // ignore: unnecessary_null_comparison
    if (this.words != null) {
      data['words'] = this.words.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Words {
 late int id;
 late int position;
 late  String audioUrl;
 late String charTypeName;
 late int lineNumber;
 late  String codeV1;
 late Translation translation;
 late Translation transliteration;

  Words(
      {required this.id,
        required this.position,
        required this.audioUrl,
        required this.charTypeName,
        required this.lineNumber,
        required this.codeV1,
        required this.translation,
        required this.transliteration});

  Words.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    position = json['position'];
    audioUrl = json['audio_url'];
    charTypeName = json['char_type_name'];
    lineNumber = json['line_number'];
    codeV1 = json['code_v1'];
    translation = (json['translation'] != null
        ? new Translation.fromJson(json['translation'])
        : null)!;
    transliteration = (json['transliteration'] != null
        ? new Translation.fromJson(json['transliteration'])
        : null)!;
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['position'] = this.position;
    data['audio_url'] = this.audioUrl;
    data['char_type_name'] = this.charTypeName;
    data['line_number'] = this.lineNumber;
    data['code_v1'] = this.codeV1;
    // ignore: unnecessary_null_comparison
    if (this.translation != null) {
      data['translation'] = this.translation.toJson();
    }
    // ignore: unnecessary_null_comparison
    if (this.transliteration != null) {
      data['transliteration'] = this.transliteration.toJson();
    }
    return data;
  }
}

class Translation {
  late String text;
  late String languageName;

  Translation({required this.text, required this.languageName});

  Translation.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    languageName = json['language_name'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['language_name'] = this.languageName;
    return data;
  }
}
