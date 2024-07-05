# WeatherTrack App

WeatherTrack is a cutting-edge Flutter application designed to provide users with real-time weather updates for cities across the globe. Leveraging the power of the OpenWeatherMap API, it offers detailed weather forecasts including temperature, humidity, wind speed, and more, all wrapped in a user-friendly interface.

## Features

- **Real-time Weather Data**: Fetch and display current weather conditions for any city worldwide.
- **Detailed Forecasts**: Access detailed information such as temperature, humidity, wind speed, and weather conditions.
- **User-friendly Interface**: Easy-to-navigate interface with clear, readable fonts and icons.
- **Error Handling**: Robust error handling to guide users when something goes wrong.

## Tech Stack

- **Flutter**: Used for creating the UI and logic of the app, Flutter allows for a smooth and efficient cross-platform app development experience.
- **Dart**: The programming language used alongside Flutter to build the app's functionality.
- **OpenWeatherMap API**: Provides the weather data that powers the app.
- **Provider Package**: For state management within the app, ensuring a responsive and interactive user experience.
- **HTTP Package**: Facilitates network requests to the OpenWeatherMap API.
- **Flutter Dotenv**: Used for managing environment variables, such as the API key for OpenWeatherMap.
- **Shared Preferences**: For local storage of user settings and preferences.
- **Flutter Spinkit**: Offers loading indicators to enhance the user experience during data fetching.
- **Weather Icons**: Provides a wide range of weather-related icons to visually represent different weather conditions.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- Flutter installed on your machine (for installation instructions, visit [Flutter's official site](https://flutter.dev/docs/get-started/install)).
- An IDE with Flutter support (e.g., Android Studio, VS Code).
- An active internet connection for fetching weather data.

## Getting Started

To get a local copy up and running, follow these simple steps:

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your-username/weather_track.git
   cd weather_track

2. **Install dependencies:**

   ```bash
   flutter pub get

3. **Set up the OpenWeatherMap API Key:**
   
   Sign up at OpenWeatherMap to get your API key.

   Create a .env file in the root of the project and add your API key as follows:

   ```bash
   OPENWEATHERMAP_API_KEY=your_api_key_here

4. **Run the app:**
   Ensure you have an emulator running or a device connected, then execute:
   ```bash
   flutter run

## Dependencies

   ```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.1
  flutter_spinkit: ^5.2.1
  weather_icons: 3.0.0
  provider: ^6.0.0
  flutter_dotenv: ^5.0.2
  shared_preferences: ^2.2.3
  cupertino_icons: ^1.0.6

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
   ```

## Additional Notes
   The app is designed for educational purposes and showcases basic Flutter app development and API integration.
   For any issues or feature requests, please open an issue on the GitHub repository.


## Contributing
      
   Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any         contributions you make are greatly appreciated.
   
   Fork the Project
   Create your Feature Branch (git checkout -b feature/AmazingFeature)
   Commit your Changes (git commit -m 'Add some AmazingFeature')
   Push to the Branch (git push origin feature/AmazingFeature)
   Open a Pull Request

## Acknowledgments
   OpenWeatherMap for providing the weather data API.
   
   Flutter for the amazing framework.
   
   

   
   





