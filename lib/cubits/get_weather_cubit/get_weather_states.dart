class WeatherState {}

class WeatherInitialState extends WeatherState {} // no weather data

class WeatherLoadedState extends WeatherState {
  // final WeatherModel weatherModel;
  // WeatherLoadedState({required this.weatherModel});
}

class WeatherFailure extends WeatherState {}
