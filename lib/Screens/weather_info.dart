import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_setup_main2/Cubit2/Weather_cubit/weather_cubit.dart';
import 'package:weather_app_setup_main2/Models/service_model.dart';
import 'package:weather_app_setup_main2/main.dart';


class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceModel serviceModelObject =
        BlocProvider.of<WeatherCubit>(context).serviceModelObject!;
    return Container(
         decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(serviceModelObject.condition).shade400,
            getThemeColor(serviceModelObject.condition).shade300,
            getThemeColor(serviceModelObject.condition).shade50,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            serviceModelObject.cityName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text(
            'updated at ${serviceModelObject.date.hour}:${serviceModelObject.date.minute}',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network('https:${serviceModelObject.image}'),
              SizedBox(
                width: 90,
              ),
              Text(
                serviceModelObject.avgTemp.round().toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                width: 90,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'maxtemp : ${serviceModelObject.maxTemp.round()}',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    'mintemp : ${serviceModelObject.minTemp.round()}',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            serviceModelObject.condition,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
          ),
        ],
      ),
    );
  }
}
