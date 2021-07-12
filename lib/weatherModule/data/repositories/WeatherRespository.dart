import 'package:weather_app/weatherModule/errorHandling/WeatherModuleException.dart';

import '../dataProviders/WeatherApi.dart';
import '../models/WeatherData.dart';

class WeatherRepository {
  final WeatherApi weatherApi = WeatherApi();

  Future<WeatherData> getWeatherData(String cityName) async {
    try {
      final Map<String, dynamic> data =
          await weatherApi.getWeatherFromNet(cityName);

      if (data.keys.contains('error')) {
        switch (data['error']['code']) {
          case 1006:
            throw WeatherModuleException(
                message:
                    'No matching location found. Please enter a valid city name',
                code: 1006);
          default:
            throw WeatherModuleException(
              message: 'Something went wrong. We will fix this soon.',
              code: 0,
            );
        }
      }
      return WeatherData.fromJson(data);
    } catch (exception) {
      if (exception is WeatherModuleException) {
        throw exception;
      }
      throw WeatherModuleException(
        message: 'Something went wrong. We will fix this soon.',
        code: 0,
      );
    }
  }
}
