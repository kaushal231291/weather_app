// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WeatherCurrentCondition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherCurrentCondition _$WeatherCurrentConditionFromJson(
    Map<String, dynamic> json) {
  return WeatherCurrentCondition(
    temp_c: (json['temp_c'] as num).toDouble(),
    humidity: (json['humidity'] as num).toDouble(),
    condition: WeatherOverallCondition.fromJson(
        json['condition'] as Map<String, dynamic>),
    wind_kph: (json['wind_kph'] as num).toDouble(),
  );
}

Map<String, dynamic> _$WeatherCurrentConditionToJson(
        WeatherCurrentCondition instance) =>
    <String, dynamic>{
      'temp_c': instance.temp_c,
      'wind_kph': instance.wind_kph,
      'condition': instance.condition,
      'humidity': instance.humidity,
    };
