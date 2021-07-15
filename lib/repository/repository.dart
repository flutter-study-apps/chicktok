import 'package:http/http.dart' as http;

class Repository {
  // String _BaseUrl = "http://chicktok.com/api/";
  // String _BaseUrl = "http://chicktok.com/api/";
  String _BaseUrl = "http://192.168.100.68/chicktok/public/";

  httpGet({String api}) async {
    return await http.get(Uri.parse(_BaseUrl + "api/" + api));
    // return await http.get(http://chicktok.com/api/);
  }

  getBaseUrl() {
    return _BaseUrl;
  }
}
