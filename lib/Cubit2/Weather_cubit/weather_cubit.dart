import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_setup_main2/Cubit2/Weather_cubit/weather_cubit_states.dart';
import 'package:weather_app_setup_main2/Models/service_model.dart';
import 'package:weather_app_setup_main2/Services/service_func.dart';

class WeatherCubit extends Cubit<weatherStates> {
  WeatherCubit() : super(weatherInitialState());
  ServiceModel? serviceModelObject;
  Future<void> weatherCubitMethod({required String cityName}) async {
    emit(weatherLoadingState());
    try {
      serviceModelObject =
          await ServiceFunc(dio: Dio()).getWeather(cityName: cityName);
      emit(weatherSuccessState());
    } catch (e) {
      emit(weatherFailedState(errMessage: '${e.toString()}'));
    }
  }
}
