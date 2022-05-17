import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/services/http_error_handler.dart';

class WheatherApiService {
  final http.Client httpClient;

  WheatherApiService({
    required this.httpClient,
  });

  Future<int> getWoeid(String city) async {
    final Uri uri = Uri(
        scheme: "https",
        host: kHost,
        path: "/api/location/search/",
        queryParameters: {'query': city});

    try {
      final http.Response response = await http.get(uri);

      if (response.statusCode != 200) {
        throw httpErrorHandler(response);
      }

      final responseBody = json.decode(response.body);
    } catch (e) {}

    return 1;
  }
}
