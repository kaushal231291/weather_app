import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/weatherModule/data/models/WeatherData.dart';

@immutable
abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherFetchingState extends WeatherState {}

class WeatherErrorState extends WeatherState {
  final String errorMessage;

  WeatherErrorState({required this.errorMessage});
}

class WeatherSucessState extends WeatherState with EquatableMixin {
  final WeatherData weatherData;

  WeatherSucessState({
    required this.weatherData,
  });

  @override
  List<Object?> get props => [
        this.weatherData.current.temp_c,
        this.weatherData.current.humidity,
        this.weatherData.current.wind_kph
      ];
}
