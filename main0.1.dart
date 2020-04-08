import 'package:flutter/material.dart';
import 'settings.dart';
import 'profile.dart';
import 'editAttendance.dart';
import 'editTimeTable.dart';
import 'dart:math' as math;


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mark it Down 0',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

//  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with TickerProviderStateMixin {
  int _counter = 0;
  AnimationController _controller;

  static const List<IconData> icons = const [ Icons.sms, Icons.mail, Icons.phone ];

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _launchFromMenu(int x){
    print("launch initiated");
    Navigator.push(context,MaterialPageRoute(builder: (context) => setn()));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('Mark It Down 2'),
            actions: <Widget>[
              PopupMenuButton<String>(
                onSelected: (r){
                  print("launch redirected " + r);
                  if(r=='1'){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => setn()));
                  }
                  else if(r=='2'){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => editTT()));
                  }
                  else if(r=='3'){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => editAtt()));
                  }
                  else if(r=='4'){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => prfl()));
                  }
                  else {
                    print("Unexprected Bro!");
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: "1",
                    child: Text('Settings'),
                  ),
                  const PopupMenuItem<String>(
                    value: "2",
                    child: Text('Edit Time Table'),
                  ),
                  const PopupMenuItem<String>(
                    value: "3",
                    child: Text('Edit Attendance'),
                  ),
                  const PopupMenuItem<String>(
                    value: "4",
                    child: Text('Profile'),
                  ),
                ],
              )
            ],
          ),
          body: TabBarView(
            children: [
              home(),
              attSheet(),
              timeTable(),
            ],
          ),
        ),
      ),
//      floatingActionButton:  new Column(
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
////                backgroundColor: backgroundColor,
//                mini: true,
//                child: new Icon(icons[index]),
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
//                  child: new Icon(_controller.isDismissed ? Icons.share : Icons.close),
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
//      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class home extends StatelessWidget{

//  @override
//  Widget build(BuildContext context) {
//
//    var size_h = MediaQuery.of(context).size;
//
//    /*24 is for notification bar on Android*/
//    double itemHeight_h = (size_h.height - kToolbarHeight - 24) / 2;
//    final double itemWidth_h = size_h.width / 2;
//    if (itemHeight_h> 300){
//      itemHeight_h = 100;
//    }
//    final children = <Widget>[
//      Text('Time'),
//      Text('Subject'),
//      Text('Att'),
//      Text('P/Ab'),
//    ];
//    for (var i = 0; i < 10; i++) {
//      children.add(new Text('chk'+i.toString()));
//    }
//    return Scaffold(
//      body: Column(
//        children: <Widget>[
//          GridView.count(
//          crossAxisCount: 4,
//              childAspectRatio: (itemWidth_h / itemHeight_h),
//              padding: const EdgeInsets.all(10.0),
//              mainAxisSpacing: 0.0,
//              crossAxisSpacing: 4.0,
//              children: children
//          ),
//        ],
//      ),
//    );
//  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    if (itemHeight> 300){
      itemHeight = 100;
    }
    final children = <Widget>[
      Text('Time'),
      Text('Subject'),
      Text('Att'),
      Text('P/Ab'),
    ];
    bool chkBox = false;
    void mark(chB){
      setState(){
        chkBox = chB;
      }
    }
    for (var i = 0; i < 6; i++) {
      children.add(new Text('\n9:3'+i.toString() , textAlign: TextAlign.center,));
      children.add(new Text('\nCSE'+i.toString() , textAlign: TextAlign.center,));
      children.add(new Text('\n7'+i.toString() , textAlign: TextAlign.center,));
      children.add(
        Align(
          alignment: Alignment.topCenter, // Align however you like (i.e .centerRight, centerLeft)
          child: new Checkbox(value: chkBox, onChanged: mark),
        ),
      );
//      children.add(
//          new Checkbox(
//              value: chkBox,
//              onChanged: (bool value){
//                setState((){
//                  chkBox = value;
//                });
//              }
//          )
//      );
//      children.add(
//        new Checkbox(
//            value: null,
//            onChanged: null
//        )
//      );
    }
    return GridView.count(
        crossAxisCount: 4,
        childAspectRatio: (itemWidth / itemHeight),
        padding: const EdgeInsets.only(left: 10, right: 10),
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 4.0,
        children: children
    );
//    return Table(
//      children: [
//        TableRow(
//          children: [
//            Text('Subject', style: TextStyle(decoration: TextDecoration.underline, fontSize: 20),),
//            Text('Total Cls'),
//            Text('Att cls'),
//            Text('Att'),
//          ]
//        )
//      ],
//    );
  }

}

class attSheet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    if (itemHeight> 300){
      itemHeight = 100;
    }
    final children = <Widget>[
      Text('Subject'),
      Text('Att Class'),
      Text('Total Class'),
      Text('Attendance'),
    ];
    for (var i = 0; i < 10; i++) {
      children.add(new Text('chk'+i.toString()));
    }
    return GridView.count(
        crossAxisCount: 4,
        childAspectRatio: (itemWidth / itemHeight),
        padding: const EdgeInsets.all(10.0),
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 4.0,
        children: children
    );
//    return Table(
//      children: [
//        TableRow(
//          children: [
//            Text('Subject', style: TextStyle(decoration: TextDecoration.underline, fontSize: 20),),
//            Text('Total Cls'),
//            Text('Att cls'),
//            Text('Att'),
//          ]
//        )
//      ],
//    );
  }

}


class timeTable extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            ExpansionTile(
              title: Text("Monday"),
              children: <Widget>[
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
              ],

            ),
            ExpansionTile(
              title: Text("Tuesday"),
              children: <Widget>[
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
              ],

            ),
            ExpansionTile(
              title: Text("Wednesday"),
              children: <Widget>[
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
              ],

            ),
            ExpansionTile(
              title: Text("Thursday"),
              children: <Widget>[
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
                Text("1-oo-  "),
              ],

            ),
          ],
        )
    );
  }

}
