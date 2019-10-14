import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey = '79fc76073579ea76d9054d3f6fa0d469';
const String owmURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getWeatherData() async {
    Location myLocation = Location();
    await myLocation.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$owmURL?lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=$apiKey&units=imperial');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 85) {
      return 'It\'s 🍦 time';
    } else if (temp > 80) {
      return 'Time for shorts and 👕';
    } else if (temp < 40) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
