part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FeatchWeather extends WeatherEvent {
  final Position pos;

  const FeatchWeather({required this.pos});

  @override
  List<Object> get props => [pos];
}
