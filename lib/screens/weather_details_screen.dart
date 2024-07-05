import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_track/providers/weather_provider.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherDetailsScreen extends StatelessWidget {
  const WeatherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);
    final weather = provider.weather;

    return Scaffold(
      appBar: AppBar(
        title: Text(weather?.cityName ?? 'Weather Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              if (weather != null) {
                provider.fetchWeather(weather.cityName);
              }
            },
          ),
        ],
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : weather != null
              ? SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color(0xFFDDDFE4)
                                              .withOpacity(0.5)),
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Image.network(
                                              'https://openweathermap.org/img/wn/${weather.icon}@2x.png'),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                weather.condition,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                " In ${weather.cityName}",
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: const Color(0xFFDDDFE4)
                                            .withOpacity(0.5),
                                      ),
                                      padding: const EdgeInsets.all(25),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Icon(WeatherIcons.thermometer),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${weather.temperature}',
                                                style: const TextStyle(
                                                    fontSize: 80),
                                              ),
                                              const Text(
                                                "°C",
                                                style: TextStyle(fontSize: 80),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 170,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: const Color(0xFFDDDFE4)
                                            .withOpacity(0.5),
                                      ),
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(WeatherIcons.day_windy),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            '${weather.windSpeed}',
                                            style: const TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Text(
                                            "Km/hr",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 170,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: const Color(0xFFDDDFE4)
                                            .withOpacity(0.5),
                                      ),
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(WeatherIcons.humidity),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            '${weather.humidity}%',
                                            style: const TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Text(
                                            "Percent",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 95,
                              ),
                              Container(
                                padding: const EdgeInsets.all(30),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("Made By Alok Ranjan"),
                                    Text("Data Provided By Openweathermap.org"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: Text(
                    provider.errorMessage ??
                        'Invalid city name. Please try again.',
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16,
                    ),
                  ),
                ),
    );
  }
}
