//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:math' as math;
import 'profile.dart';
import 'editAttendance.dart';
import 'editTimeTable.dart';

//void main() => runApp(setn());

class setn extends StatelessWidget{

//  void back(){
//    print("heading home");
//    main();
//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback"),
      ),
      body: Text("fbk_chk"),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.home),
      ),
    );
  }

}

//class setn extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      theme: ThemeData(
//        primarySwatch: Colors.green,
//      ),
//      home: new MyHomePage(),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  @override
//  State createState() => new MyHomePageState();
//}
//
//class MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
//  AnimationController _controller;
//
//  static const List<IconData> icons = const [ Icons.sms, Icons.mail, Icons.phone ];
//
//  @override
//  void initState() {
//    _controller = new AnimationController(
//      vsync: this,
//      duration: const Duration(milliseconds: 500),
//    );
//  }
//
//  Widget build(BuildContext context) {
//    Color backgroundColor = Theme.of(context).cardColor;
//    Color foregroundColor = Theme.of(context).accentColor;
//    return new Scaffold(
////      appBar: new AppBar(title: new Text('Speed Dial Example')),
//      body: DefaultTabController(
//        length: 3,
//        child: Scaffold(
//          appBar: AppBar(
//            bottom: TabBar(
//              tabs: [
//                Tab(icon: Icon(Icons.directions_car)),
//                Tab(icon: Icon(Icons.directions_transit)),
//                Tab(icon: Icon(Icons.directions_bike)),
//              ],
//            ),
//            title: Text('Mark It Down 2'),
//            actions: <Widget>[
//              PopupMenuButton<String>(
//                onSelected: (r){
//                  print("launch redirected " + r);
//                  if(r=='1'){
//                    Navigator.push(context,MaterialPageRoute(builder: (context) => setn()));
//                  }
//                  else if(r=='2'){
//                    Navigator.push(context,MaterialPageRoute(builder: (context) => editTT()));
//                  }
//                  else if(r=='3'){
//                    Navigator.push(context,MaterialPageRoute(builder: (context) => editAtt()));
//                  }
//                  else if(r=='4'){
//                    Navigator.push(context,MaterialPageRoute(builder: (context) => prfl()));
//                  }
//                  else {
//                    print("Unexprected Bro!");
//                  }
//                },
//                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//                  const PopupMenuItem<String>(
//                    value: "1",
//                    child: Text('Settings'),
//                  ),
//                  const PopupMenuItem<String>(
//                    value: "2",
//                    child: Text('Edit Time Table'),
//                  ),
//                  const PopupMenuItem<String>(
//                    value: "3",
//                    child: Text('Edit Attendance'),
//                  ),
//                  const PopupMenuItem<String>(
//                    value: "4",
//                    child: Text('Profile'),
//                  ),
//                ],
//              )
//            ],
//          ),
//          body: TabBarView(
//            children: [
//              home(),
//              attSheet(),
//              timeTable(),
////              Icon(Icons.directions_car),
////              Icon(Icons.directions_transit),
////              Icon(Icons.directions_bike),
//
//            ],
//          ),
//        ),
//      ),
//      floatingActionButton: new Column(
//        mainAxisSize: MainAxisSize.min,
//        children: new List.generate(icons.length, (int index) {
//          Widget child = new Container(
//            height: 70.0,
//            width: 56.0,
//            alignment: FractionalOffset.topCenter,
//            child: new ScaleTransition(
//              scale: new CurvedAnimation(
//                parent: _controller,
//                curve: new Interval(
//                    0.0,
//                    1.0 - index / icons.length / 2.0,
//                    curve: Curves.easeOut
//                ),
//              ),
//              child: new FloatingActionButton(
//                heroTag: null,
//                backgroundColor: backgroundColor,
//                mini: true,
//                child: new Icon(icons[index], color: foregroundColor),
//                onPressed: () {},
//              ),
//            ),
//          );
//          return child;
//        }).toList()..add(
//          new FloatingActionButton(
//            heroTag: null,
//            child: new AnimatedBuilder(
//              animation: _controller,
//              builder: (BuildContext context, Widget child) {
//                return new Transform(
//                  transform: new Matrix4.rotationZ(_controller.value * 0.5 * math.pi),
//                  alignment: FractionalOffset.center,
//                  child: new Icon(_controller.isDismissed ? Icons.add : Icons.close),
//                );
//              },
//            ),
//            onPressed: () {
//              if (_controller.isDismissed) {
//                _controller.forward();
//              } else {
//                _controller.reverse();
//              }
//            },
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class home extends StatelessWidget{
//
////  @override
////  Widget build(BuildContext context) {
////
////    var size_h = MediaQuery.of(context).size;
////
////    /*24 is for notification bar on Android*/
////    double itemHeight_h = (size_h.height - kToolbarHeight - 24) / 2;
////    final double itemWidth_h = size_h.width / 2;
////    if (itemHeight_h> 300){
////      itemHeight_h = 100;
////    }
////    final children = <Widget>[
////      Text('Time'),
////      Text('Subject'),
////      Text('Att'),
////      Text('P/Ab'),
////    ];
////    for (var i = 0; i < 10; i++) {
////      children.add(new Text('chk'+i.toString()));
////    }
////    return Scaffold(
////      body: Column(
////        children: <Widget>[
////          GridView.count(
////          crossAxisCount: 4,
////              childAspectRatio: (itemWidth_h / itemHeight_h),
////              padding: const EdgeInsets.all(10.0),
////              mainAxisSpacing: 0.0,
////              crossAxisSpacing: 4.0,
////              children: children
////          ),
////        ],
////      ),
////    );
////  }
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    var size = MediaQuery.of(context).size;
//
//    /*24 is for notification bar on Android*/
//    double itemHeight = (size.height - kToolbarHeight - 24) / 2;
//    final double itemWidth = size.width / 2;
//    if (itemHeight> 300){
//      itemHeight = 100;
//    }
//    final children = <Widget>[
//      Text('Time'),
//      Text('Subject'),
//      Text('Att'),
//      Text('P/Ab'),
//    ];
//    bool chkBox = false;
//    void mark(chB){
//      setState(){
//        chkBox = chB;
//      }
//    }
//    for (var i = 0; i < 6; i++) {
//      children.add(new Text('\n9:3'+i.toString() , textAlign: TextAlign.center,));
//      children.add(new Text('\nCSE'+i.toString() , textAlign: TextAlign.center,));
//      children.add(new Text('\n7'+i.toString() , textAlign: TextAlign.center,));
//      children.add(
//        Align(
//          alignment: Alignment.topCenter, // Align however you like (i.e .centerRight, centerLeft)
//          child: new Checkbox(value: chkBox, onChanged: mark),
//        ),
//      );
////      children.add(
////          new Checkbox(
////              value: chkBox,
////              onChanged: (bool value){
////                setState((){
////                  chkBox = value;
////                });
////              }
////          )
////      );
////      children.add(
////        new Checkbox(
////            value: null,
////            onChanged: null
////        )
////      );
//    }
//    return GridView.count(
//        crossAxisCount: 4,
//        childAspectRatio: (itemWidth / itemHeight),
//        padding: const EdgeInsets.only(left: 10, right: 10),
//        mainAxisSpacing: 0.0,
//        crossAxisSpacing: 4.0,
//        children: children
//    );
////    return Table(
////      children: [
////        TableRow(
////          children: [
////            Text('Subject', style: TextStyle(decoration: TextDecoration.underline, fontSize: 20),),
////            Text('Total Cls'),
////            Text('Att cls'),
////            Text('Att'),
////          ]
////        )
////      ],
////    );
//  }
//
//}
//
//class attSheet extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    var size = MediaQuery.of(context).size;
//
//    /*24 is for notification bar on Android*/
//    double itemHeight = (size.height - kToolbarHeight - 24) / 2;
//    final double itemWidth = size.width / 2;
//    if (itemHeight> 300){
//      itemHeight = 100;
//    }
//    final children = <Widget>[
//      Text('Subject'),
//      Text('Att Class'),
//      Text('Total Class'),
//      Text('Attendance'),
//    ];
//    for (var i = 0; i < 10; i++) {
//      children.add(new Text('chk'+i.toString()));
//    }
//    return GridView.count(
//        crossAxisCount: 4,
//        childAspectRatio: (itemWidth / itemHeight),
//        padding: const EdgeInsets.all(10.0),
//        mainAxisSpacing: 0.0,
//        crossAxisSpacing: 4.0,
//        children: children
//    );
////    return Table(
////      children: [
////        TableRow(
////          children: [
////            Text('Subject', style: TextStyle(decoration: TextDecoration.underline, fontSize: 20),),
////            Text('Total Cls'),
////            Text('Att cls'),
////            Text('Att'),
////          ]
////        )
////      ],
////    );
//  }
//
//}
//
//
//class timeTable extends StatelessWidget{
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        body: Column(
//          children: <Widget>[
//            ExpansionTile(
//              title: Text("Monday"),
//              children: <Widget>[
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//              ],
//
//            ),
//            ExpansionTile(
//              title: Text("Tuesday"),
//              children: <Widget>[
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//              ],
//
//            ),
//            ExpansionTile(
//              title: Text("Wednesday"),
//              children: <Widget>[
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//              ],
//
//            ),
//            ExpansionTile(
//              title: Text("Thursday"),
//              children: <Widget>[
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//                Text("1-oo-  "),
//              ],
//
//            ),
//          ],
//        )
//    );
//  }
//
//}
