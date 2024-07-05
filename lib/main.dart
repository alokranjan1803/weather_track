import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weather_track/providers/theme_provider.dart';
import 'package:weather_track/providers/weather_provider.dart';
import 'package:weather_track/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WeatherProvider()),
        ChangeNotifierProvider(
            create: (context) => ThemeProvider()), // Add the theme provider
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Weather App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.dark,
            ),
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode, // Use themeMode from provider
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
