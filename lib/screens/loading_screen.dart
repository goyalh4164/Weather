import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(position);
    } catch (exception) {
      print(
          exception); //printing the exception in the console without stoping the execution of the program
    }
  }

//throw method is used to create your own exception
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
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
