class WeatherModel {
  final String cityName;
  final String date;
  final String? image;
  final double avgTemp;
  final double minTemp;
  final double maxTemp;
  final String condition;

  WeatherModel(
      {this.image,
      required this.cityName,
      required this.date,
      required this.avgTemp,
      required this.minTemp,
      required this.maxTemp,
      required this.condition});

  factory WeatherModel.fromJason(jason) {
    return WeatherModel(
      image: jason['forecast']['forecastday'][0]['day']['condition']['icon'],
      cityName: jason['location']['name'],
      date: jason['current']['last_updated'],
      avgTemp: jason['forecast']['forecastday'][0]['day']['avgtemp_c'],
      minTemp: jason['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemp: jason['forecast']['forecastday'][0]['day']['maxtemp_c'],
      condition: jason['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
