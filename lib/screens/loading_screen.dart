import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';
// import 'package:http/http.dart' as http;   ----------->we can use by its short name by using "as" keyword
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
//throw method is used to create your own exception

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    //we can add await to only thoses function which return Future
    await location.getCurrentLocation();
    print(location.longitude);
    print(location.latitude);
  }

  Future<void> getData() async {
    Response response = await get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=ebe40922610017bb96421256fe31f8b6"));
    //way to be in a secure line
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
        body: Center(

            //   child: MaterialButton(
            //     onPressed: () {
            //       getLocation();
            //     },
            //     child: Text("Get Location"),
            //     color: Colors.blueGrey,
            //   ),
            // ),
            ));
  }
}
