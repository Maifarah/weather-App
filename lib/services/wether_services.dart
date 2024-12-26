import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'b62bf19e83d8434b871204213242312';

  WeatherService({required this.dio});

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName');
      WeatherModel weatherModel = WeatherModel.fromJason(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'OOPS There Was An Error Please Try Again Later!';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('OOPS There Was An Error Please Try Again Later!');
    }
  }
}
