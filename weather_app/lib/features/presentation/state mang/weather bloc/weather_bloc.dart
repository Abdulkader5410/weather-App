import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/failure/failure.dart';
import 'package:weather_app/core/strings/failure_str.dart';
import 'package:weather_app/features/domain/entities/weather_entities.dart';
import 'package:weather_app/features/domain/usecase/featch_weather_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final FeatchWeathersUC featchWeathersUC;

  WeatherBloc({required this.featchWeathersUC}) : super(WeatherInitial()) {

 on<FeatchWeather>((event, emit) async {
     
        emit(LoadingState());

        final weatherOrFailure = await featchWeathersUC("aleppo");

        print(weatherOrFailure);
        
        weatherOrFailure.fold(
          (failure) {
            emit(FailureState());
          },
          (weather) {
            emit(SuccessState(weather: weather));
          },
        );
      
    });

   
  
}






  String _mapFailureType(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return SERVER_FAILURE_MESSAGE;

      default:
        return "Unexpcted Error";
    }
  }
}
