import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weatherModule/errorHandling/WeatherModuleException.dart';
import 'package:weather_app/weatherModule/logic/bloc/WeatherBloc/WeatherEvent.dart';
import 'package:weather_app/weatherModule/logic/bloc/WeatherBloc/WeatherState.dart';
import '../../../data/models/WeatherData.dart';
import '../../../data/repositories/WeatherRespository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository = WeatherRepository();
  late WeatherState _currentState;

  WeatherBloc() : super(WeatherInitialState()) {
    this._currentState = WeatherInitialState();
  }

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherFetchEvent) {
      try {
        yield WeatherFetchingState();
        WeatherData weatherData =
            await _weatherRepository.getWeatherData(event.cityName);
        WeatherSucessState weatherSucessState =
            WeatherSucessState(weatherData: weatherData);
        yield weatherSucessState;
        this._currentState = weatherSucessState;
      } on WeatherModuleException catch (exception) {
        yield WeatherErrorState(errorMessage: exception.message);
      }
    }

    if (event is WeatherUpdateEvent) {
      try {
        WeatherData weatherData =
            await _weatherRepository.getWeatherData(event.cityName);
        WeatherSucessState newWeatherSucessState =
            WeatherSucessState(weatherData: weatherData);
        if (this._currentState is WeatherSucessState &&
            newWeatherSucessState != this._currentState) {
          print('new state yeilded');
          yield newWeatherSucessState;
          this._currentState = newWeatherSucessState;
        }
      } on WeatherModuleException catch (exception) {}
    }
  }
}
