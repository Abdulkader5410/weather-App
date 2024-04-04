// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';


class WeatherEntity extends Equatable {
  String? country, name, main;
  double? temperature , termoMin ,termoMax;
  DateTime?  sunrise, sunset ;
  // double?  humidity;
  // int? id;


  WeatherEntity(
      {required this.country,
      required this.name,
      required this.main,
      required this.temperature,
      required this.termoMax,
      required this.termoMin,
      // required this.dt,
      required this.sunrise,
      required this.sunset,
      // required this.windSpeed,
      // required this.windDegree,
      // required this.humidity,
      // required this.id
      });

  @override
  List<Object?> get props => [name , country ,main ];
}
