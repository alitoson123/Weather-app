import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_setup_main2/Cubit2/Weather_cubit/weather_cubit.dart';
import 'package:weather_app_setup_main2/Cubit2/Weather_cubit/weather_cubit_states.dart';

import 'package:weather_app_setup_main2/Screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit>(
      create: (context) => WeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<WeatherCubit, weatherStates>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme:  ThemeData(
                appBarTheme: AppBarTheme(
                  backgroundColor: getThemeColor(
                    BlocProvider.of<WeatherCubit>(context)
                        .serviceModelObject
                        ?.condition,
                  ),
                ),
              ),
              home: HomePage(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? weathercondition) {
  if (weathercondition == null) {
    return Colors.blue;
  }
  switch (weathercondition.toLowerCase()) {
    case 'sunny':
      return Colors.amber;
    case 'partly cloudy':
      return Colors.yellow;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
      return Colors.blueGrey;
    case 'mist':
      return Colors.lightBlue;
    case 'patchy rain possible':
    case 'light rain':
      return Colors.lightGreen;
    case 'moderate rain':
    case 'heavy rain':
      return Colors.green;
    case 'light snow':
    case 'moderate snow':
      return Colors.deepOrange;
    case 'fog':
      return Colors.brown;
    case 'blizzard':
      return Colors.blue;
    default:
      return Colors.blueGrey;
  }
}
