// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WeatherData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) {
  return WeatherData(
    current: WeatherCurrentCondition.fromJson(
        json['current'] as Map<String, dynamic>),
    location:
        WeatherLocation.fromJson(json['location'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'current': instance.current,
      'location': instance.location,
    };
