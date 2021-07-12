import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weatherModule/errorHandling/WeatherModuleException.dart';
import '../../data/models/WeatherData.dart';
import '../../data/repositories/WeatherRespository.dart';

@immutable
abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherFetchingState extends WeatherState {}

class WeatherErrorState extends WeatherState {
  final String errorMessage;

  WeatherErrorState({required this.errorMessage});
}

class WeatherSucessState extends WeatherState {
  final WeatherData weatherData;

  WeatherSucessState({required this.weatherData});
}

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository = WeatherRepository();

  WeatherCubit() : super(WeatherInitialState());

  Future<void> fetchWeather(String cityName) async {
    try {
      emit(WeatherFetchingState());
      WeatherData weatherData =
          await weatherRepository.getWeatherData(cityName);
      emit(WeatherSucessState(weatherData: weatherData));
    } on WeatherModuleException catch (exception) {
      emit(WeatherErrorState(errorMessage: exception.message));
    }
  }
}
