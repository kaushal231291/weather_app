import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/weatherModule/data/models/WeatherCurrentCondition.dart';
import 'package:weather_app/weatherModule/data/models/WeatherLocation.dart';

import 'WeatherOverallCondition.dart';

part 'WeatherData.g.dart';

@JsonSerializable()
class WeatherData {
  final WeatherCurrentCondition current;
  final WeatherLocation location;
  WeatherData({
    required this.current,
    required this.location,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}
