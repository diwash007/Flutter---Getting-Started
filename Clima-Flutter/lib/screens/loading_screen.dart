import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import '../services/networking.dart';
import '../services/location.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();
  double lon;
  double lat;
  @override
  void initState() {
    super.initState();
  }

  void getLocationData() async {
    await location.getCurrentLocation();
    double lat = location.latitude;
    double lon = location.longitude;
    String APIkey = '77d643c30f60000047e65116bee158af';

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$APIkey');

    var weatherData = networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    getLocationData();
    return Scaffold(
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
