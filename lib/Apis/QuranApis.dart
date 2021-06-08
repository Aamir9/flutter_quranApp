import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:quran/AppConstants/AppContants.dart';

class QuranApis {

  getAllSurahList() async {

    var url = Uri.https(apiBaseUrl, subUrl + "/surah");
    print(url.toString());
    Response response = await http.get(url);
    print(response.body);
    return response;

  }

  getSurahDetails(number) async {
    // en.asad,en.pickthall
    var url = Uri.https(apiBaseUrl, subUrl + "/surah/"+number.toString()+"/quran-uthmani");
    print(url.toString());
    Response response = await http.get(url);
    print(response.body);
    return response;
  }

  getCompleteQuran() async {

    var url = Uri.https(apiBaseUrl, subUrl + "/quran/er.asad");
    print(url.toString());
    Response response = await http.get(url);
    print(response.body);
    return response;

  }


  getRecitationsList()
  async {
    var url = Uri.https(quranApiBaseUrl, quranSubUrl + "/resources/recitations");
    print(url.toString());
    Response response = await http.get(url);
    print(response.body);
    return response;
  }

  getTafsirsList()
  async {
    var url = Uri.https(quranApiBaseUrl, quranSubUrl + "/resources/tafsirs");
    print(url.toString());
    Response response = await http.get(url);
    print(response.body);
    return response;
  }

  getLanguageList()
  async {
    var url = Uri.https(quranApiBaseUrl, quranSubUrl + "/resources/languages");
    print(url.toString());
    Response response = await http.get(url);
    print(response.body);
    return response;
  }

  getRandomAyah()
  async {
    var url = Uri.https(quranApiBaseUrl, quranSubUrl + "/resources/random",{"words":true,'language':'en'});
    print(url.toString());
    Response response = await http.get(url);
    print(response.body);
    return response;
  }


  getSingleRecitationAudio(recId)
  async {
    var url = Uri.https(quranApiBaseUrl, quranSubUrl + "/quran/recitations/"+recId.toString());

    print(url.toString());
    Response response = await http.get(url);
    print(response.body);

    return response;
  }
}