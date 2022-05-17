class WeatherException implements Exception {
  String message;

  WeatherException([this.message = "something weht wrong"]) {
    message = 'Weather Exception: $message';
  }

  @override
  String toString() => 'WeatherException(message: $message)';
}
