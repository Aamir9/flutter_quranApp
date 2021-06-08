import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:quran/AppConstants/AppContants.dart';

class PrayerTimeApi
{
  getPrayerTime(parms) async {

    var url = Uri.https(prayerTimeApiBaseUrl, prayerTimeSubUrl + "/calendarByCity",parms);
    print(url.toString());
    Response response = await http.get(url);
    print(response.body);
    return response;

  }

  getTodayPrayerTime(parms) async {

    var url = Uri.https(prayerTimeApiBaseUrl, prayerTimeSubUrl + "/timingsByCity",parms);
    print(url.toString());
    Response response = await http.get(url);
    print(response.body);
    return response;

  }
}