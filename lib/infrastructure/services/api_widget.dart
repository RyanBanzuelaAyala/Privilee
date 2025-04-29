import 'dart:convert';
import 'package:http/http.dart' as http;

class TApiService {
  Future<dynamic> httpApiPost(dynamic body, String url) async {
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            "Accept": "*/*",
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Methods":
                "POST, GET, OPTIONS, PUT, DELETE, HEAD",
          },
          body: json.encode(body));
      return json.decode(response.body);
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> httpApiPostJwt(dynamic body, String url, String token) async {
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            "Accept": "*/*",
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Methods":
                "POST, GET, OPTIONS, PUT, DELETE, HEAD",
            'Authorization': 'Bearer $token',
          },
          body: json.encode(body));
      return json.decode(response.body);
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> httpApiGet(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
        "Accept": "*/*",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
      });
      return json.decode(response.body);
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> httpApiGetJwt(String url, String token) async {
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
        "Accept": "*/*",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
        'Authorization': 'Bearer $token',
      });
      return json.decode(response.body);
    } catch (e) {
      return null;
    }
  }
}
