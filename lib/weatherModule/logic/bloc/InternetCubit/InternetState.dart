import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class InternetState {}

class InternetCheckingState extends InternetState {}

class InternetConnectedState extends InternetState with EquatableMixin {
  final ConnectivityResult result;

  InternetConnectedState({required this.result});

  @override
  List<Object?> get props => [];
}

class InternetDisconnectedState extends InternetState with EquatableMixin {
  @override
  List<Object?> get props => [];
}
