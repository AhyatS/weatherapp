import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wheater/weather.dart';

class DataService {
  Future<weather> fetchData(String cityName) async {
    try {
      //https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
      final queryParameters = {
        'q': cityName,
        'appid': '465b24d8e3ce2e4df1f3b83e3aad6d24',
        'units': 'imperial'
      };
      final uri = Uri.https(
          'api.openweathermap.org', '/data/2.5/weather', queryParameters);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return weather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('failed to load weather');
      }
    } catch (e) {
      rethrow;
    }
  }
}
