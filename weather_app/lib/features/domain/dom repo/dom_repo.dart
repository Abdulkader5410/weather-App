import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failure/failure.dart';
import 'package:weather_app/features/domain/entities/weather_entities.dart';


abstract class DomRepo {
  Future<Either<Failure, WeatherEntity>> featchWeather(String city);
}