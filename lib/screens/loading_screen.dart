import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';

const apiKey = 'ebe40922610017bb96421256fe31f8b6';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
//throw method is used to create your own exception
  double latitude = 0;
  double longitude = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    //we can add await to only thoses function which return Future
    await location.getCurrentLocation();
    longitude = location.longitude;
    latitude = location.latitude;
    NetworkHelper networkHelper = await NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
