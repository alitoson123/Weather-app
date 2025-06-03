import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_setup_main2/Cubit2/Weather_cubit/weather_cubit.dart';
import 'package:weather_app_setup_main2/Cubit2/Weather_cubit/weather_cubit_states.dart';
import 'package:weather_app_setup_main2/Screens/no_weather.dart';
import 'package:weather_app_setup_main2/Screens/search_page.dart';
import 'package:weather_app_setup_main2/Screens/weather_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchPage();
                    },
                  ),
                );
              },
              icon: Icon(Icons.search))
        ],
        title: Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<WeatherCubit, weatherStates>(
        builder: (context, state) {
          if (state is weatherInitialState) {
            return NoWeather();
          } else if (state is weatherLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is weatherSuccessState) {
            return WeatherInfo();
          } else {
            return Center(child: Text('There was an error'));
          }
        },
      ),
    );
  }
}


//  the steps to make a cubit
  
//  1. create states
//  2. create cubit
//  3. create function
//  4. provide cubit
//  5. build cubit and state
//  6. trigger cubit

/* 
 BlocBuilder<WeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return NoWeather();
          } else if (state is HasWeatherState) {
            return WeatherInfo();
          } else {
            return Text('opps,there was an error');
          }
        },
      ),
*/