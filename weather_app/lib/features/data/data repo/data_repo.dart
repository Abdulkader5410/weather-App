import 'package:dartz/dartz.dart';
import 'package:weather_app/core/exception/exception.dart';
import 'package:weather_app/core/failure/failure.dart';
import 'package:weather_app/core/network/network.dart';
import 'package:weather_app/features/data/datasource/remote_data_source.dart';
import 'package:weather_app/features/data/model/weather._model.dart';
import 'package:weather_app/features/domain/dom%20repo/dom_repo.dart';

class WeatherDataRepo extends DomRepo {
  final RemoteDataSource remoteDataSource;
  final Networkinfo networkinfo;

  WeatherDataRepo({required this.networkinfo, required this.remoteDataSource});

  @override
  Future<Either<Failure, WeatherModel>> featchWeather(String city) async {
    if (await networkinfo.isConnected) {
      try {
        final weather = await remoteDataSource.featchWeather(city);
        return Right(weather);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      throw OfflineException();
    }
  }


}
