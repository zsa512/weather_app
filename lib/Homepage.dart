import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:weather_app/AddCityLayout.dart';
import 'package:weather_app/GeneralUtils.dart';
import 'package:weather_app/LoadingIndicator.dart';
import 'package:weather_app/WeatherDetailLayout.dart';
import 'package:weather_app/WeatherModel.dart';
import 'package:weather_app/Webservice.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double width, height;
  WeatherApiController weatherApiController = WeatherApiController();
  late WeatherModel weatherModel;
  bool showWeatherDetails = false;
  bool showIndicator = false;

  Future<void> initConnectivity() async {
    var result = await GeneralUtils().checkInternetConnection();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      // Hit Weather Api
      weatherModel = await weatherApiController.weatherApi();
    }
    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      showIndicator = false;
    });
  }

  void addCityBtnPress() {
    setState(() {
      showWeatherDetails = true;
      showIndicator = true;
      initConnectivity();
    });
  }

  void actionBtnPress() {
    setState(() {
      showIndicator = true;
    });
    initConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => actionBtnPress(),
          ),
        ],
      ),
      body: !showWeatherDetails
          ? AddCityLayout(
              onBtnPress: () => addCityBtnPress(),
            )
          : showIndicator
              ? const LoadingIndicator()
              : WeatherDetailLayout(weatherModel: weatherModel),
    );
  }
}
