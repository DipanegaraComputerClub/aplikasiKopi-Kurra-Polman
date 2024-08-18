import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = ''; // Ganti dengan API key Anda

  Future<Map<String, dynamic>> getWeather(double lat, double lon) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=$apiKey'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
