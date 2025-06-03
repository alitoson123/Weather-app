import 'dart:async';
import 'package:dio/dio.dart';
import 'package:weather_app_setup_main2/Models/service_model.dart';

class ServiceFunc {
  final Dio dio;

  ServiceFunc({required this.dio});

  Future<ServiceModel> getWeather({required String cityName}) async {
    try {
      var response = await dio.get(
          'http://api.weatherapi.com/v1/forecast.json?key=c900475d6a114931aa2211010240309&q=$cityName&days=1&aqi=no&alerts=no');

      // Map<String, dynamic> jsonData = response.data;
// ServiceModel serviceModelObject = ServiceModel.fromJson(jsonData);
      Map<String, dynamic> jsonData = response.data;
      ServiceModel serviceModelObject = ServiceModel.fromJson(jsonData);

      return serviceModelObject;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Opps, there was an error . try later';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('Opps, there was an error . try later');
    }
  }
}
