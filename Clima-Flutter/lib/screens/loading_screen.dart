import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();
  @override
  void initState() {
    super.initState();
  }

  void getLocation() async {
    await location.getCurrentLocation();
    print(location.longitude);
    print(location.latitude);
  }

  void getData() async {
    double lat = location.latitude;
    double lon = location.longitude;
    String APIkey = '77d643c30f60000047e65116bee158af';
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$APIkey');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getLocation();
    getData();
    return Scaffold();
  }
}
