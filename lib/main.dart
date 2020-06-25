import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var gpsLocation = "GPS LOCATION";

  void getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    gpsLocation = position.toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar(
            title: Text("Geolocator"),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(100.0),
                child: MaterialButton(
                  color: Colors.grey,
                  child: Text("GET LOCATION"),
                  onPressed: () {
                    setState(() {
                      getLocation();
                    });
                  },
                ),
              ),
              Text(gpsLocation)
            ],
          ),
        ));
  }
}
