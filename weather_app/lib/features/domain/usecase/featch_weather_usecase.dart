import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failure/failure.dart';
import 'package:weather_app/features/domain/dom%20repo/dom_repo.dart';
import 'package:weather_app/features/domain/entities/weather_entities.dart';

class FeatchWeathersUC {
  late final DomRepo weatherDomRepo;

  FeatchWeathersUC(this.weatherDomRepo);

  Future<Either<Failure, WeatherEntity>> call(String city) async{
    return await weatherDomRepo.featchWeather(city);
  }

}
