import 'networking.dart';
import 'location.dart';

const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const String APIkey = '77d643c30f60000047e65116bee158af';

class WeatherModel {
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
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$APIkey&units=metric');

    dynamic weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String city) async {
    NetworkHelper networkHelper =
        NetworkHelper('$openWeatherMapURL?q=$city&appid=$APIkey&units=metric');
    print(city);
    var weatherData = await networkHelper.getData();
    print(weatherData);
    return weatherData;
  }
}
