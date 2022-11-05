import 'dart:math';

import 'package:compassapp/qrview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

import 'compassview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compass APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double? _bearing;
  var locationMessage = "";
  var distanceMessage = "";
  num lat = 0.0;
  num long = 0.0;
  bool reachedTheGoal = false;

  void _setBearing(double heading) {
    setState(() {
      _bearing = heading;
    });
  }

  void getAngle(double objLat, double objLong) {
    double x = cos(objLat) * sin((long - objLong));
    double y =
        cos(lat) * sin(objLat) - sin(lat) * cos(objLat) * cos((long - objLong));
    double angle = degrees(atan2(x, y));
    if (angle < 0) {
      angle = angle + 360;
    }
    print(angle);
    setState(() {
      _bearing = angle;
    });
  }

  double calculateDistance(objLat, objLong) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((objLat - lat) * p) / 2 +
        cos(lat * p) * cos(objLat * p) * (1 - cos((objLong - long) * p)) / 2;
    return 12742 * asin(sqrt(a)) * 1000;
  }

  void getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      Geolocator.openLocationSettings();
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    setState(() {
      lat = position.latitude;
      long = position.longitude;
      locationMessage = "$lat  " + "  $long";
      double distance = calculateDistance(40.6330811091, -8.65880500925);
      if(distance < 8 && reachedTheGoal == false){
        print("TOU AQUI 1");
        reachedTheGoal = true;
         
      }
      distanceMessage = distance.toStringAsFixed(0);
      distanceMessage = distanceMessage + " m";
      getAngle(40.6330811091, -8.65880500925);
      
    }
    );
   
    if(reachedTheGoal == true){
       print("TOU AQUI 2"); 
        Navigator.push(context,
        MaterialPageRoute(
              builder: (context) => QRViewExample(),
            ));
        
            
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50, left: 300),
          child: FullScreenWidget(
            child: ClipRRect(
              child: Image.network(
                "https://api-assets.ua.pt/files/imgs/000/000/380/original.jpg",
                fit: BoxFit.scaleDown,
                height: 90,
                width: 60,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        StreamBuilder<CompassEvent>(
          stream: FlutterCompass.events,
          builder: (context, snapshot) {
            final heading = snapshot.data?.heading ?? 0;
            getCurrentLocation();
            return CompassView(
              bearing: _bearing,
              heading: heading,
            );
          },
        ),
        SizedBox(
          height: 100,
        ),
        Text(
          distanceMessage,
          style: GoogleFonts.blackOpsOne(
            textStyle: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          "________           ________",
          style: GoogleFonts.blackOpsOne(
            textStyle: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
        Text(
          "LAT                       LON",
          style: GoogleFonts.blackOpsOne(
            textStyle: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
        Text(
          locationMessage,
          style: GoogleFonts.blackOpsOne(
            textStyle: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}
