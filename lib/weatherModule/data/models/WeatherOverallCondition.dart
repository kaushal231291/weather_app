import 'package:json_annotation/json_annotation.dart';

part 'WeatherOverallCondition.g.dart';

@JsonSerializable()
class WeatherOverallCondition {
  final String text;

  WeatherOverallCondition({
    required this.text,
  });

  factory WeatherOverallCondition.fromJson(Map<String, dynamic> json) =>
      _$WeatherOverallConditionFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherOverallConditionToJson(this);
}
