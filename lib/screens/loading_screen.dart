import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';
import 'package:http/http.dart'
    as http; //----------->we can use by its short name by using "as" keyword
// import 'package:http/http.dart';
import 'dart:convert'; //this package is used to decode the JSON as of now from my knowledge

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
    http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=ebe40922610017bb96421256fe31f8b6"));
    //way to be in a secure line
    if (response.statusCode == 200) {
      String data = response.body;
      //--------------------just for learning-------------------
      // print(data);
      //decoding the JSON
      //we are traveeling inside the JSON by using the keys as a path
      // var longitude = jsonDecode(data)['coord']['lon'];
      //this is how you access elements indide the list
      // var weatherDescription = jsonDecode(data)['weather'][0]['description'];
      // print(longitude);
      //you can find the below path from the extension of the JSON and use it in your own way
      //weather[0].description
      // print(weatherDescription);
      //-------------------just for learning----------------
      //---------------challenge----------------------
      var decodedData = jsonDecode(data);
      //using the above shorthand notation
      int condition = decodedData['weather'][0]['id'];
      double temp = decodedData['main']['temp'];
      String cityName = decodedData['name'];
      print(condition);
      print(temp);
      print(cityName);
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
