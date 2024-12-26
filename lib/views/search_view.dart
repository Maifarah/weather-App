import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 36, 131, 226),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onSubmitted: (valu) {
              // // object of tybe GetWeatherCubit to acces the method getWether
              var weatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              weatherCubit.getWether(cityName: valu);
              Navigator.pop(context);

              // weatherModel = await WetherService(dio: Dio())
              //     .getCurrentWeather(cityName: valu);
              // Navigator.pop(context);

              // log(weatherModel.cityName);
              // log(weatherModel.avgTemp.toString());
              // log(weatherModel.condition);
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              labelText: 'Search',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 48, 138, 228),
                ),
              ),
              hintText: 'Enter city name',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
