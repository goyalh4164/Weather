import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';

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

  @override
  Widget build(BuildContext context) {
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
