import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:weather_track/models/weather_model.dart';

class WeatherService {
  static Future<WeatherModel> fetchWeather(String city) async {
    const apiKey = <your_apikey>;
    final requestUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

    try {
      final response = await http.get(Uri.parse(requestUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return WeatherModel(
          cityName: data['name'],
          temperature: data['main']['temp'],
          condition: data['weather'][0]['description'],
          icon: data['weather'][0]['icon'],
          humidity: data['main']['humidity'],
          windSpeed: data['wind']['speed'],
        );
      } else if (response.statusCode == 404) {
        throw const HttpException('City not found');
      } else if (response.statusCode == 503) {
        throw const HttpException(
            'Service unavailable. Please try again later.');
      } else {
        throw const HttpException('Failed to load weather data');
      }
    } on SocketException {
      throw const HttpException(
          'No Internet connection. Please check your connection and try again.');
    } catch (e) {
      // Log the error or handle it further if needed
      rethrow; // Rethrow the exception to be handled by the caller
    }
  }
}
