import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: HomeScreen()
    );
  }
}



//
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: Colors.grey[900],
//         appBar: _appBar(),
//         body: _buildUI(),
//       ),
//     );
//   }
//
//   Widget _appBar() {
//     return AppBar(
//       backgroundColor: Colors.purple[800],
//       elevation: 0.0,
//       title: Text(
//         'My App',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 30.0,
//         ),
//       ),
//       automaticallyImplyLeading: false,
//     );
//   }
//
//   Widget _buildUI() {
//     return Container(
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             children: <Widget>[
//               Wrap(
//                 spacing: 30.0, // gap between sections
//                 runSpacing: 30.0, // gap between lines
//                 alignment: WrapAlignment.spaceAround,
//                 children: <Widget>[
//                   Divider(color: Colors.white, height: 20),
//                   _buildSpeedSection(),
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }
//
//   Widget _buildSpeedSection() {
//     return Container(
//       height: 150,
//       width: 170,
//       child: Column(
//         children: <Widget>[
//           Text(
//             'SPEED',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 30,
//             ),
//           ),
//           PermissionStatusWidget(),
//           ServiceEnabledWidget(),
//           GetLocationWidget(),
//           ListenLocationWidget(),
//         ],
//       ),
//     );
//   }
// }
//
//
// class ListenLocationWidget extends StatefulWidget {
//   const ListenLocationWidget({Key key}) : super(key: key);
//
//   @override
//   _ListenLocationState createState() => _ListenLocationState();
// }
//
// class _ListenLocationState extends State<ListenLocationWidget> {
//   final Location location = Location();
//
//   LocationData _location;
//   StreamSubscription<LocationData> _locationSubscription;
//   String _error;
//
//   @override
//   void initState() {
//     super.initState();
//     _listenLocation();
//   }
//
//   Future<void> _listenLocation() async {
//     _locationSubscription =
//         location.onLocationChanged.handleError((dynamic err) {
//           setState(() {
//             _error = err.code;
//           });
//           _locationSubscription.cancel();
//         }).listen((LocationData currentLocation) {
//           setState(() {
//             _error = null;
//             _location = currentLocation;
//           });
//         });
//   }
//
//   Future<void> _stopListen() async {
//     _locationSubscription.cancel();
//   }
//
//   Widget _calculateSpeedBetweenLocations() {
//     return Text(
//       '${_location.speed != null && _location.speed * 3600 / 1000 > 0 ? (_location.speed * 3600 / 1000).toStringAsFixed(2) : 0} KM/h',
//       style: TextStyle(
//         color: Colors.lightGreen[500],
//         fontSize: 20,
//         letterSpacing: 4,
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         _calculateSpeedBetweenLocations(),
//       ],
//     );
//   }
// }