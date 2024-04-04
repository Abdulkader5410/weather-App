part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();
  
  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}



class LoadingState extends WeatherState {}

class SuccessState extends WeatherState {
  final WeatherEntity weather;

  const SuccessState({required this.weather});

  @override
  List<Object> get props => [weather];
}

class FailureState extends WeatherState {


  @override
  List<Object> get props => [];
}

