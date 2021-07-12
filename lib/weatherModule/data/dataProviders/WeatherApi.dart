import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/weatherModule/errorHandling/WeatherModuleException.dart';

class WeatherApi {
  Future<Map<String, dynamic>> getWeatherFromNet(String cityName) async {
    try {
      String url =
          'http://api.weatherapi.com/v1/current.json?key=8e8e3d3cd8534d8f958162402211007&q=${cityName}';

      http.Response response = await http.get(Uri.parse(url));

      return jsonDecode(response.body);
    } catch (exception) {
      String exceptionMessage = 'Something went wrong.';
      int code = 0;
      var connectivityResult = await (Connectivity().checkConnectivity());
      switch (connectivityResult) {
        case ConnectivityResult.wifi:
          break;
        case ConnectivityResult.mobile:
          break;
        case ConnectivityResult.none:
          code = 1;
          exceptionMessage =
              'Unable to reach network. Please check internet connectivity.';
          break;
      }
      throw WeatherModuleException(message: exceptionMessage, code: code);
    }
  }
}
