class WeatherModuleException implements Exception {
  final String message;
  final int code;

  WeatherModuleException({required this.message, required this.code});
}
