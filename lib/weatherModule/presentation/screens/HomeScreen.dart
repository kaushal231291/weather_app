import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/ThemeElements.dart';
import 'package:weather_app/weatherModule/logic/bloc/WeatherBloc.dart';
import 'package:weather_app/weatherModule/logic/bloc/WeatherEvent.dart';
import 'package:weather_app/weatherModule/logic/bloc/WeatherState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController cityNameController;
  final _searchFormKey = GlobalKey<FormState>();
  String _currentQueryValue = '';

  @override
  void initState() {
    super.initState();
    cityNameController = TextEditingController();
    Timer.periodic(const Duration(seconds: 20), (timer) async {
      WeatherState currentWeatherState = context.read<WeatherBloc>().state;
      if (currentWeatherState is WeatherSucessState) {
        context.read<WeatherBloc>().add(
              WeatherUpdateEvent(
                cityName: cityNameController.text,
              ),
            );
      }
    });
  }

  @override
  void dispose() {
    cityNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _searchFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: height * 0.05,
            ),
            Text(
              'Enter your city name',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required';
                  }
                },
                controller: cityNameController,
                decoration: InputDecoration(
                  hintText: 'City Name',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.blue,
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                List<Widget> widgets = [];
                widgets.add(
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (state is WeatherFetchingState) {
                        } else if (_searchFormKey.currentState!.validate()) {
                          String queryValue = cityNameController.text
                              .trim()
                              .replaceAll(RegExp(' '), '')
                              .toLowerCase();

                          if (this._currentQueryValue == '' ||
                              this._currentQueryValue.compareTo(queryValue) !=
                                  0) {
                            context.read<WeatherBloc>().add(
                                  WeatherFetchEvent(
                                    cityName: cityNameController.text,
                                  ),
                                );
                          }
                          this._currentQueryValue = queryValue;
                        }
                      },
                      child: Builder(
                        builder: (context) {
                          if (state is WeatherFetchingState) {
                            return Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              ),
                            );
                          }
                          return Text('Search');
                        },
                      ),
                    ),
                  ),
                );

                if (state is WeatherErrorState) {
                  widgets.add(Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      state.errorMessage,
                      style: ThemeElements.errorTextStyle,
                    ),
                  ));
                }

                if (state is WeatherSucessState) {
                  widgets.add(Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'Location:  ${state.weatherData.location.name} ',
                              style: ThemeElements.normalTextStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'Region:  ${state.weatherData.location.region} ',
                              style: ThemeElements.normalTextStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'Country:  ${state.weatherData.location.country} ',
                              style: ThemeElements.normalTextStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'Tempertaure: ${state.weatherData.current.temp_c} Celcius',
                              style: ThemeElements.normalTextStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'Humidity: ${state.weatherData.current.humidity} ',
                              style: ThemeElements.normalTextStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'Wind Speed: ${state.weatherData.current.wind_kph} ',
                              style: ThemeElements.normalTextStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'Overall Weather Condition: ${state.weatherData.current.condition.text} ',
                              style: ThemeElements.normalTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
                }

                return Column(
                  children: widgets,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
