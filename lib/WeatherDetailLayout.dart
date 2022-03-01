import 'package:flutter/material.dart';
import 'package:weather_app/Styles.dart';
import 'package:weather_app/WeatherModel.dart';

class WeatherDetailLayout extends StatelessWidget {
  Styles styles = Styles();
  WeatherModel weatherModel;
  WeatherDetailLayout({Key? key, required this.weatherModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var temp = double.parse(weatherModel.temp).toInt();
    var tempMin = double.parse(weatherModel.tempMin).toInt();
    var tempMax = double.parse(weatherModel.tempMax).toInt();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Karachi",
              style: styles.pageTitleStyle,
            ),
          ),
          Image.asset(
            "assets/images/cloud_curve.png",
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                temp.toString(),
                style: styles.tempStyle,
              ),
              Text(
                "O",
                style: styles.degreeStyle,
              ),
            ],
          ),
          Text(
            weatherModel.weatherName.toString(),
            style: styles.weatherNameStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Expanded(
                flex: 1,
                child: Center(
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.green,
                    size: 35,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Icon(
                    Icons.arrow_drop_up,
                    color: Colors.red,
                    size: 35,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    tempMin.toString(),
                    style: styles.tempStyle2,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    tempMax.toString(),
                    style: styles.tempStyle2,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    'Min',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    'Max',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
