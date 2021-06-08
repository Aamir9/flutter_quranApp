class AudioFilesApiResponse {
  late List<AudioFiles> audioFiles;
  late Meta meta;

  AudioFilesApiResponse({required this.audioFiles, required this.meta});

  AudioFilesApiResponse.fromJson(Map<String, dynamic> json) {
    if (json['audio_files'] != null) {
      // audioFiles = new List<AudioFiles>();
      audioFiles = [];
      json['audio_files'].forEach((v) {
        audioFiles.add(new AudioFiles.fromJson(v));
      });
    }
    meta = (json['meta'] != null ? new Meta.fromJson(json['meta']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_null_comparison
    if (this.audioFiles != null) {
      data['audio_files'] = this.audioFiles.map((v) => v.toJson()).toList();
    }
    // ignore: unnecessary_null_comparison
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    return data;
  }
}

class AudioFiles {
  String? verseKey;
  String? url;

  AudioFiles({this.verseKey, this.url});

  AudioFiles.fromJson(Map<String, dynamic> json) {
    verseKey = json['verse_key'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['verse_key'] = this.verseKey;
    data['url'] = this.url;
    return data;
  }
}

class Meta {
  String? reciterName;
  String? recitationStyle;

  Meta({this.reciterName, this.recitationStyle});

  Meta.fromJson(Map<String, dynamic> json) {
    reciterName = json['reciter_name'];
    recitationStyle = json['recitation_style'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reciter_name'] = this.reciterName;
    data['recitation_style'] = this.recitationStyle;
    return data;
  }
}
