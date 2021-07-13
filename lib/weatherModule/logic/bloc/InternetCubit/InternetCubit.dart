import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weatherModule/logic/bloc/InternetCubit/InternetState.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  InternetCubit({required this.connectivity}) : super(InternetCheckingState()) {
    this.connectivity.onConnectivityChanged.listen((event) {
      switch (event) {
        case ConnectivityResult.wifi:
          emit(InternetConnectedState(result: event));
          break;
        case ConnectivityResult.mobile:
          emit(InternetConnectedState(result: event));
          break;
        case ConnectivityResult.none:
          emit(InternetDisconnectedState());
          break;
      }
    });
  }
}
