import 'package:connectivity_plus/connectivity_plus.dart';

class GeneralUtils {
  // Checking Internet Connection
  checkInternetConnection() async {
    ConnectivityResult result;
    Connectivity _connectivity = Connectivity();

    try {
      result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        return result;
      } else {
        return ConnectivityResult.none;
      }
    } catch (e) {
      return ConnectivityResult.none;
    }
  }

  // Converting Temp in Celsius
  convertTempInCelsius(String tempInK) {
    var tempInCelsius = double.parse(tempInK) - 273.15;
    tempInCelsius = double.parse(tempInCelsius.toStringAsFixed(0));
    return tempInCelsius.toString();
  }
}
