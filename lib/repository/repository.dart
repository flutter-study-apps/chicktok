import 'package:http/http.dart' as http;

class Repository {
  String _BaseUrl = "http://192.168.100.68/chicktok/public/";
  String _BaseUrl2 =
      "https://gist.githubusercontent.com/ialexies/9f93810596f512878579e84ce6133545/raw/b0c9dca2b289a3eca7ef5e36d4a439b06c976716/gistfile1.json";

  httpGet({String api}) async {
    return await http.get(Uri.parse(_BaseUrl + "api/" + api));
  }

  getBaseUrl() {
    return _BaseUrl;
  }

  httpGet2() async {
    return await http.get(Uri.parse(_BaseUrl2));
  }
}
