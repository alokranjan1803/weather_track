class WeatherModel {
  final String cityName;
  final double temperature;
  final String condition;
  final String icon;
  final int humidity;
  final double windSpeed;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.icon,
    required this.humidity,
    required this.windSpeed,
  });
}
