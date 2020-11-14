import 'dart:convert';

import 'package:http/http.dart';
import 'package:poker/data/core/api_constants.dart';

class ApiClient {
  final Client _client;
  ApiClient(this._client);

  dynamic get(String path) async {
    final response = await _client.get(
      '${ApiConstants.BASE_URL}$path',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic post(String path, data) async {
    final roundResponse = await _client.post(
      '${ApiConstants.BASE_URL}round/',
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(
        <String, String>{
          'access_key': data["access_key"],
        },
      ),
    );

    if (roundResponse.statusCode == 200 || roundResponse.statusCode == 201) {
      int roundId = json.decode(roundResponse.body)["id"];

      for (int i = 0; i < data["users"].length; i++) {
        final itemResponse = await _client.post(
          '${ApiConstants.BASE_URL}rounditem/',
          headers: <String, String>{"Content-Type": "application/json"},
          body: jsonEncode(
            <String, dynamic>{
              'name': data["users"][i]["name"],
              'money': data["users"][i]["money"],
              'item': roundId
            },
          ),
        );

        print(json.decode(itemResponse.body));
      }
    } else {
      print("Oluşmadı: " + roundResponse.body.toString());
    }

    return "eklendi";
  }
}
