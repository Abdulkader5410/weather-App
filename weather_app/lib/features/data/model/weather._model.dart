// ignore_for_file: must_be_immutable

import 'package:weather_app/features/domain/entities/weather_entities.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    String? country,
    String? name,
    String? main,
    double? temperature,
    termoMin,
    termoMax,
    // int? dt,
    sunrise,
    sunset,
    // double? windSpeed,
    // windDegree,
    // humidity,
    // int? id
  }) : super(
            country: country,
            main: main,
            name: name,
            // dt: dt,
            sunrise: sunrise,
            sunset: sunset,
            temperature: temperature , termoMax: termoMax ,termoMin: termoMin);
  

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      country: json['sys']['country'],
      name: json['name'],
      // dt: json['dt'],
      // humidity: json['main']['humidity'],
      sunrise:
          DateTime.fromMillisecondsSinceEpoch(json['sys']['sunrise'] * 1000),
      sunset: DateTime.fromMillisecondsSinceEpoch(json['sys']['sunset'] * 1000),
      // id: json['weather']['id'],
      main: json['weather'][0]['main'],
      // windDegree: json['windDegree'],
      // windSpeed: json['windSpeed'],
      termoMax: json['main']['temp_max'],
      temperature: json['main']['temp'],
      termoMin: json['main']['temp_min']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country ': country,
      'name': name,
      // 'dt': dt,
      // 'humidity': humidity,
      'sunrise': sunrise,
      'sunset': sunset,
      // 'id': id,
      'main': main,
      // 'windDegree': windDegree,
      // 'windSpeed': windSpeed,
      'temp_min': termoMax,
      'temp_max': termoMin,
      'temperature': temperature,
      // 'tempMin': tempMin
    };
  }
}
