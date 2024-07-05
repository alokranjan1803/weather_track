import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_track/providers/theme_provider.dart';
import 'package:weather_track/providers/weather_provider.dart';
import 'package:weather_track/screens/weather_details_screen.dart';
import 'package:weather_track/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  String _lastSearchedCity = ''; // Assuming this exists

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Weather Track'),
            const Spacer(),
            Switch(
              value: Provider.of<ThemeProvider>(context).isDarkMode,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme(value);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0, top: 40),
              child: Image.asset(
                'assets/weather-app.png',
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 30),
            if (_lastSearchedCity.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'Welcome back! Last searched city: $_lastSearchedCity',
                    style: const TextStyle(fontSize: 16)),
              ),
            _isLoading
                ? const CircularProgressIndicator()
                : SearchScreenBar(
                    onSearch: (String value) async {
                      setState(() {
                        _isLoading = true;
                      });
                      try {
                        await Provider.of<WeatherProvider>(context,
                                listen: false)
                            .fetchWeather(value);
                        _saveLastSearchedCity(
                            value); // Save the last searched city
                        if (context.mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const WeatherDetailsScreen(),
                            ),
                          );
                        }
                      } catch (e) {
                        // Handle the error
                      } finally {
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                    placeholder: _lastSearchedCity.isNotEmpty
                        ? 'Search another city (last was $_lastSearchedCity)'
                        : 'Search a city',
                  ),
          ],
        ),
      ),
    );
  }

  void _saveLastSearchedCity(String city) {
    setState(() {
      _lastSearchedCity = city;
    });
    // Save the city to persistent storage if needed
  }
}
