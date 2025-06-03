import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_setup_main2/Cubit2/Weather_cubit/weather_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  backgroundColor: Colors.blue,
        title: Text(
          'Search for a city',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              labelText: 'search',
              hintText: 'Enter the city name...',
              prefixIcon: Icon(Icons.search),
            ),
            onSubmitted: (value) async {
              await BlocProvider.of<WeatherCubit>(context)
                  .weatherCubitMethod(cityName: value);

              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
/*
     var weathercubit = BlocProvider.of<WeatherCubit>(context);
              weathercubit.wetherLogic(cityName: value);
              Navigator.pop(context);
*/
