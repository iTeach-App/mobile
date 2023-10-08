import 'package:http/http.dart' as http;

class API {
  API._privateConstructor();

  static final API instance = API._privateConstructor();

  factory API() {
    return instance;
  }

  static const String baseUrl = 'http://iteach.local:8000';

  Future<http.Response> sendRequest(String url, Function method) async {
    var uri = Uri.parse(url[0] == '/' ? baseUrl + url : url);
    return await method(uri);
  }

  Future<http.Response> get(String url) async {
    return sendRequest(url, http.get);
  }

  Future<http.Response> post(String url) async {
    return sendRequest(url, http.post);
  }
}
