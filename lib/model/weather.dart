import 'package:climate_app/model/location.dart';
import 'package:climate_app/model/networking.dart';

const apiKey = '781d514f826a4645ef68aef9a6d0c993';

class Weather {
  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    Uri url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
      'appid': apiKey,
      'units': 'metric',
    });
    Networker networker = Networker(url);
    var weatherData = await networker.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeatherData(cityName) async {
    Uri url = Uri.https('api.openweathermap.org', '/data/2.5/weather',
        {'q': cityName, 'appid': apiKey, 'units': 'metric'});
    Networker networker = Networker(url);
    var weatherData = await networker.getData();
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
}
