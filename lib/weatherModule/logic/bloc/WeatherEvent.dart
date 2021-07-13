import 'package:flutter/material.dart';

@immutable
abstract class WeatherEvent {}

class WeatherFetchEvent extends WeatherEvent {
  final String cityName;
  WeatherFetchEvent({required this.cityName});
}

class WeatherUpdateEvent extends WeatherEvent {
  final String cityName;
  WeatherUpdateEvent({required this.cityName});
}
