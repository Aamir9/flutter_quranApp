import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:quran/AppConstants/AppContants.dart';

class MainScreenApi {

  getDataList() async {

    var url = Uri.parse(getDataApiUrl);

    print(url.toString());
    Response response = await http.get(url);
    print(response.body);
    return response;
  }

}
