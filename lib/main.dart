import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speedometer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SpeedometerPage(),
    );
  }
}

class SpeedometerPage extends StatefulWidget {
  @override
  _SpeedometerPageState createState() => _SpeedometerPageState();
}

class _SpeedometerPageState extends State<SpeedometerPage> {
  Location location = Location();
  double _speed = 0.0;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    location.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.speed != null) {
        setState(() {
          _speed = currentLocation.speed!;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speedometer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Speed:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$_speed m/s',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
