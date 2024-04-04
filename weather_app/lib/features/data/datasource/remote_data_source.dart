import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/core/exception/exception.dart';
import 'package:weather_app/features/data/model/weather._model.dart';
import 'package:weather_app/features/data/strings.dart';

abstract class RemoteDataSource {
  Future<WeatherModel> featchWeather(String city);
}

const BASE_URL = "https://api.openweathermap.org/data/2.5/weather";
// https://api.openweathermap.org/data/2.5/weather?q=aleppo&appid=0e1aa3c666a02e388acc7806570b90f5

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> featchWeather(String city) async {
    final response =
        await client.get(Uri.parse('$BASE_URL?q=$city&appid=$API_KEY'));

    if (response.statusCode == 200) {

      Map<String, dynamic> decodedJson = json.decode(response.body);
      WeatherModel weatherModel = WeatherModel.fromJson(decodedJson);
      print(weatherModel);
      return weatherModel;
    } else {
      throw ServerException();
    }

    // if (response.statusCode == 200) {
    //   print("before");
    //   List decodedJson = json.decode(response.body) as List;
    //   print("after");
    //   List<WeatherModel> weatherModels = decodedJson
    //       .map<WeatherModel>((weatherModel) => WeatherModel.fromJson(weatherModel))
    //       .toList();
    //   return weatherModels;
    // } else {
    //   throw ServerException();
    // }
  }
}
