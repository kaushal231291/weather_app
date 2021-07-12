import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/weatherModule/data/models/WeatherOverallCondition.dart';

import 'WeatherOverallCondition.dart';

part 'WeatherCurrentCondition.g.dart';

@JsonSerializable()
class WeatherCurrentCondition {
  final double temp_c;
  final double wind_kph;
  final WeatherOverallCondition condition;
  final double humidity;

  WeatherCurrentCondition({
    required this.temp_c,
    required this.humidity,
    required this.condition,
    required this.wind_kph,
  });

  factory WeatherCurrentCondition.fromJson(Map<String, dynamic> json) =>
      _$WeatherCurrentConditionFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherCurrentConditionToJson(this);
}
