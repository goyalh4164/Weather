import 'package:http/http.dart'
    as http; //----------->we can use by its short name by using "as" keyword
// import 'package:http/http.dart';
import 'dart:convert'; //this package is used to decode the JSON as of now from my knowledge

class NetworkHelper {
  final String url;
  NetworkHelper({required this.url}) {}

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
