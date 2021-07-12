// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WeatherLocation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherLocation _$WeatherLocationFromJson(Map<String, dynamic> json) {
  return WeatherLocation(
    name: json['name'] as String,
    country: json['country'] as String,
    region: json['region'] as String,
  );
}

Map<String, dynamic> _$WeatherLocationToJson(WeatherLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
    };
