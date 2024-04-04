import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/presentation/state%20mang/weather%20bloc/weather_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is SuccessState) {
            return Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.purple, Colors.black])),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.weather.name!,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Good Morning",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: _getIcon(200),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        "${(state.weather.temperature! - 273.15).round()} \u00B0C",
                        style: const TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        state.weather.main!,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        "df",
                        // "${DateFormat().add_MMMd().format(state.weather.dt!)} ,${DateFormat().add_EEEE().format(state.weather.dt!)}   ${DateFormat().add_jm().format(state.weather.dt!)}  ",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/images/icons8-rainfall-96.png",
                              width: 50,
                              height: 50,
                            ),
                            Column(
                              children: [
                                const Text(
                                  "Sunrise",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                Text(
                                  DateFormat.jm()
                                      .format(state.weather.sunrise!),
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/images/icons8-rainfall-96.png",
                              width: 50,
                              height: 50,
                            ),
                            Column(
                              children: [
                                const Text(
                                  "Sunset",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                Text(
                                  DateFormat.jm().format(state.weather.sunset!),
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/images/icons8-snow-96.png",
                              width: 50,
                              height: 50,
                            ),
                            Column(
                              children: [
                                const Text(
                                  "Termo Max",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                Text(
                                  "${(state.weather.termoMax! - 273.15).round()} \u00B0C",
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/images/icons8-rainfall-96.png",
                              width: 50,
                              height: 50,
                            ),
                            const Column(
                              children: [
                                Text(
                                  "Termo Min",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                Text(
                                  "min",
                                  // "${state.weather[0].tempMin!.celsius!.round().toString()} C",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _getIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset(
          "assets/images/icons8-rainfall-96.png",
          width: 180,
          height: 180,
          fit: BoxFit.fill,
        );
      case >= 300 && < 400:
        return Image.asset(
          "assets/images/icons8-rainfall-96.png",
          width: 180,
          height: 180,
          fit: BoxFit.fill,
        );
      case >= 500 && < 600:
        return Image.asset(
          "assets/images/icons8-rainfall-96.png",
          width: 180,
          height: 180,
          fit: BoxFit.fill,
        );
      case >= 600 && < 700:
        return Image.asset(
          "assets/images/icons8-rainfall-96.png",
          width: 180,
          height: 180,
          fit: BoxFit.fill,
        );
      case >= 700 && < 800:
        return Image.asset(
          "assets/images/icons8-rainfall-96.png",
          width: 180,
          height: 180,
          fit: BoxFit.fill,
        );
      case == 800:
        return Image.asset(
          "assets/images/icons8-rainfall-96.png",
          width: 180,
          height: 180,
          fit: BoxFit.fill,
        );
      case > 800 && <= 804:
        return Image.asset(
          "assets/images/icons8-rainfall-96.png",
          width: 180,
          height: 180,
          fit: BoxFit.fill,
        );

      default:
        return Image.asset(
          "assets/images/icons8-rainfall-96.png",
          width: 180,
          height: 180,
          fit: BoxFit.fill,
        );
    }
  }
}
