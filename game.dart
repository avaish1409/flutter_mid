//import 'dart:async';
//import 'package:flutter/material.dart';
//import 'package:sensors/sensors.dart';
//
////import 'snake.dart';
//
////void main() {
////  runApp(MyApp());
////}
//
//class MyGame extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Sensors Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  @override
//  void initState() {
//    super.initState();
//    var _streamSubscriptions;
////    _streamSubscriptions
////        .add(accelerometerEvents.listen((AccelerometerEvent event) {
////      setState(() {
////        _accelerometerValues = <double>[event.x, event.y, event.z];
////      });
////    }));
//    _streamSubscriptions.add(gyroscopeEvents.listen((GyroscopeEvent event) {
//      setState(() {
//        print('detected');
//        var _gyroscopeValues = <double>[event.x, event.y, event.z];
//      });
//    }));
////    _streamSubscriptions
////        .add(userAccelerometerEvents.listen((UserAccelerometerEvent event) {
////      setState(() {
////        _userAccelerometerValues = <double>[event.x, event.y, event.z];
////      });
////    }));
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Center(
//      child: Container(
//        color: Colors.redAccent,
//      ),
//    );
//  }
//
//}
//
//
//
////class _MyHomePageState extends State<MyHomePage> {
////  static const int _snakeRows = 20;
////  static const int _snakeColumns = 20;
////  static const double _snakeCellSize = 10.0;
////
////  List<double> _accelerometerValues;
////  List<double> _userAccelerometerValues;
////  List<double> _gyroscopeValues;
////  List<StreamSubscription<dynamic>> _streamSubscriptions =
////  <StreamSubscription<dynamic>>[];
////
////  @override
////  Widget build(BuildContext context) {
////    final List<String> accelerometer =
////    _accelerometerValues?.map((double v) => v.toStringAsFixed(1))?.toList();
////    final List<String> gyroscope =
////    _gyroscopeValues?.map((double v) => v.toStringAsFixed(1))?.toList();
////    final List<String> userAccelerometer = _userAccelerometerValues
////        ?.map((double v) => v.toStringAsFixed(1))
////        ?.toList();
////
////    return Scaffold(
////      appBar: AppBar(
////        title: const Text('Sensor Example'),
////      ),
////      body: Column(
////        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////        children: <Widget>[
////          Center(
////            child: DecoratedBox(
////              decoration: BoxDecoration(
////                border: Border.all(width: 1.0, color: Colors.black38),
////              ),
////              child: SizedBox(
////                height: _snakeRows * _snakeCellSize,
////                width: _snakeColumns * _snakeCellSize,
////                child: Snake(
////                  rows: _snakeRows,
////                  columns: _snakeColumns,
////                  cellSize: _snakeCellSize,
////                ),
////              ),
////            ),
////          ),
////          Padding(
////            child: Row(
////              mainAxisAlignment: MainAxisAlignment.spaceBetween,
////              children: <Widget>[
////                Text('Accelerometer: $accelerometer'),
////              ],
////            ),
////            padding: const EdgeInsets.all(16.0),
////          ),
////          Padding(
////            child: Row(
////              mainAxisAlignment: MainAxisAlignment.spaceBetween,
////              children: <Widget>[
////                Text('UserAccelerometer: $userAccelerometer'),
////              ],
////            ),
////            padding: const EdgeInsets.all(16.0),
////          ),
////          Padding(
////            child: Row(
////              mainAxisAlignment: MainAxisAlignment.spaceBetween,
////              children: <Widget>[
////                Text('Gyroscope: $gyroscope'),
////              ],
////            ),
////            padding: const EdgeInsets.all(16.0),
////          ),
////        ],
////      ),
////    );
////  }
////
////  @override
////  void dispose() {
////    super.dispose();
////    for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
////      subscription.cancel();
////    }
////  }
////
////  @override
////  void initState() {
////    super.initState();
////    _streamSubscriptions
////        .add(accelerometerEvents.listen((AccelerometerEvent event) {
////      setState(() {
////        _accelerometerValues = <double>[event.x, event.y, event.z];
////      });
////    }));
////    _streamSubscriptions.add(gyroscopeEvents.listen((GyroscopeEvent event) {
////      setState(() {
////        _gyroscopeValues = <double>[event.x, event.y, event.z];
////      });
////    }));
////    _streamSubscriptions
////        .add(userAccelerometerEvents.listen((UserAccelerometerEvent event) {
////      setState(() {
////        _userAccelerometerValues = <double>[event.x, event.y, event.z];
////      });
////    }));
////  }
////}



import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
//void main() => runApp(MyApp());
class MyGame extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  double x=20.032, y=10.012, z=10.0213;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;
        print(x);
        print(y);
        print(z);
      });
    }); //get the sensor data and set then to the data types
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Sensor Library"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "An Example How on Flutter Sensor library is used",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900),
                ),
              ),
              Table(
                border: TableBorder.all(
                    width: 2.0,
                    color: Colors.blueAccent,
                    style: BorderStyle.solid),
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "X Asis : ",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(x.toString(), //trim the asis value to 2 digit after decimal point
                            style: TextStyle(fontSize: 20.0)),
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Y Asis : ",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(y.toString(),  //trim the asis value to 2 digit after decimal point
                            style: TextStyle(fontSize: 20.0)),
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Z Asis : ",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(z.toString(),   //trim the asis value to 2 digit after decimal point
                            style: TextStyle(fontSize: 20.0)),
                      )
                    ],
                  ),
                ],
              ),
              RaisedButton(
                child: Text('Print'),
                onPressed: (){
                  print('pressed');
                  print(x.toString());
                  print('ab');
                  print(y);
                  print('c');
                  print(z);
                  print('d');
                },
              ),
            ],
          ),
        ));
  }
}