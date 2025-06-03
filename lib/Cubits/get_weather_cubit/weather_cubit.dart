import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_setup_main2/Cubits/get_weather_cubit/weather_states.dart';
import 'package:weather_app_setup_main2/Models/service_model.dart';
import 'package:weather_app_setup_main2/Services/service_func.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitialState());

   ServiceModel? ServiceModelObject;
  Future<void> wetherLogic({required String cityName}) async {
    try {
      ServiceModelObject =
          await ServiceFunc(dio: Dio()).getWeather(cityName: cityName);
      emit(HasWeatherState());
    } catch (e) {
      emit(WeatherErrorState());
    }
  }
}
