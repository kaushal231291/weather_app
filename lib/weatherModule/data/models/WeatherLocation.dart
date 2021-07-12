import 'package:json_annotation/json_annotation.dart';

part 'WeatherLocation.g.dart';

@JsonSerializable()
class WeatherLocation {
  final String name;
  final String region;
  final String country;

  WeatherLocation(
      {required this.name, required this.country, required this.region});

  factory WeatherLocation.fromJson(Map<String, dynamic> json) =>
      _$WeatherLocationFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherLocationToJson(this);
}
