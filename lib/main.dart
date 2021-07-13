import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weatherModule/logic/bloc/InternetCubit/InternetCubit.dart';
import 'package:weather_app/weatherModule/logic/bloc/WeatherBloc/WeatherBloc.dart';
import 'weatherModule/presentation/screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(create: (context) => WeatherBloc()),
        BlocProvider<InternetCubit>(
            create: (context) =>
                InternetCubit(connectivity: new Connectivity())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(title: 'Weather App'),
      ),
    );
  }
}
