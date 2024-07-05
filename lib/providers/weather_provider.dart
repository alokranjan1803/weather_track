import 'dart:io';
import 'package:flutter/material.dart';
import 'package:weather_track/models/weather_model.dart';
import 'package:weather_track/services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  WeatherModel? _weather;
  bool _isLoading = false;
  String? _errorMessage;

  WeatherModel? get weather => _weather;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchWeather(String city) async {
    if (!_isCityNameValid(city)) {
      _errorMessage = "Invalid city name. Please try again.";
      _weather = null; // Reset weather data for invalid city names
      notifyListeners();
      return;
    }

    _isLoading = true;
    _weather = null; // Reset weather data before fetching new data
    _errorMessage = null; // Clear previous error message
    notifyListeners();
    try {
      _weather = await WeatherService.fetchWeather(city);
    } on SocketException {
      _errorMessage =
          "No Internet connection. Please check your connection and try again.";
      _weather =
          null; // Ensure weather data is cleared if there's a connection issue
    } catch (e) {
      _errorMessage = "An error occurred. Please try again later.";
      _weather = null; // Ensure weather data is cleared on other errors
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Utility method to validate city names
  bool _isCityNameValid(String cityName) {
    // Simple validation: check if the city name is not empty and contains only letters and spaces
    return cityName.isNotEmpty && RegExp(r"^[a-zA-Z\s]+$").hasMatch(cityName);
  }
}
