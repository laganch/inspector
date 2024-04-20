import 'dart:convert';

import 'package:http/http.dart' as http;

// const String baseUrl = 'https://ivasapp.services.an.gov.ng/api/public/';
const String baseUrl = 'https://ivasapp.services.an.gov.ng/api/public/';

class BaseClient {
  var client = http.Client();

  //GET
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  Future<dynamic> post(String api, Object body) async {
    var url = Uri.parse(baseUrl + api);

    var res =
        await client.post(url, headers: {'Content-Type': 'application/json'}, body: json.encode(body),
        );

    if (res.statusCode == 200) {
      return res.body;
    } else {
      // throw exception and catch it in UI
    } 
  }

  Future<dynamic> validateVehicle(String api) async {
    var url = Uri.parse(baseUrl + api);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }
}
