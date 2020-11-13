import 'dart:convert';

import 'package:http/http.dart';
import 'package:poker/data/core/api_constants.dart';

class ApiClient {
  final Client _client;
  ApiClient(this._client);

  dynamic get(String path) async {
    final response = await _client.get('${ApiConstants.BASE_URL}$path');
    print(response.statusCode);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic post(String path, data) async {
    print(data);
    return "eklendi";
  }
}
