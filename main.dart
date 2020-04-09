// ver 0.2

//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mid/game.dart';
import 'package:flutter_mid/game2.dart';
import 'main.dart';
import 'dart:math' as math;
import 'profile.dart';
import 'editAttendance.dart';
import 'editTimeTable.dart';
import 'settings.dart';
import 'game2.dart';
import 'package:url_launcher/url_launcher.dart';

//void main() => runApp(setn());

//class setn extends StatelessWidget{
//
//  void back(){
//    print("heading home");
//    main();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Settings"),
//      ),
//      body: Text("stng_chk"),
//      floatingActionButton: FloatingActionButton(
//        onPressed: (){
//          Navigator.pop(context);
//        },
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ),
//    );
//  }
//
//}
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  AnimationController _controller;

  static const List<IconData> icons = const [ Icons.sms, Icons.mail, Icons.extension ];
  static const List<String> icon_name = const ['Extra Class', 'Cancel Class', 'Games'];

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).cardColor;
    Color foregroundColor = Theme.of(context).accentColor;
    return new Scaffold(
//      appBar: new AppBar(title: new Text('Speed Dial Example')),
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
            title: Text('Mark It Down ..2'),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.turned_in_not,
                  color: Colors.white,
                ),
                onPressed: () {
                  print('bottom sheet');
                  _settingModalBottomSheet(context);
                },
              ),
              PopupMenuButton<String>(
                onSelected: (r){
                  print("launch redirected " + r);
                  if(r=='1'){
//                    Navigator.push(context,MaterialPageRoute(builder: (context) => setn()));
                    print('launching e-mail');
                    _launchURL('aovisuals247@gmail.com', 'Feedback for MID app', 'Dear Developer,');
                    print('e-mailing done');
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
                    child: Text('Feedback'),
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
//              Icon(Icons.directions_car),
//              Icon(Icons.directions_transit),
//              Icon(Icons.directions_bike),

            ],
          ),
        ),
      ),
      floatingActionButton: new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: new List.generate(icons.length, (int index) {
          Widget child = new Container(
            height: 70.0,
            width: 130.0,
            alignment: FractionalOffset.topCenter,
            child: new ScaleTransition(
              scale: new CurvedAnimation(
                parent: _controller,
                curve: new Interval(
                    0.0,
                    1.0 - index / icons.length / 2.0,
                    curve: Curves.easeOut
                ),
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(icon_name[index]),
                  FloatingActionButton(
                    heroTag: null,
                    backgroundColor: backgroundColor,
                    mini: true,
                    child: new Icon(icons[index], color: foregroundColor),
                    onPressed: () {
                      if(index == 0){
//                        Navigator.push(context,MaterialPageRoute(builder: (context) => setn()));
//                        _settingModalBottomSheet(context);
                        extraCls(context);
                      }
                      else if(index == 1){
//                        Navigator.push(context,MaterialPageRoute(builder: (context) => editTT()));
                        cancelCls(context);

                      }
                      else if(index == 2){
                        print('here');
                        Navigator.push(context,MaterialPageRoute(builder: (context) => alph()));
//                        Navigator.push(context,MaterialPageRoute(builder: (context) => editAtt()));
                      }
                      else {
                        print("Unknown Fab!" + index.toString());
                      }
                    },
                  ),
                ],
              )
            ),
          );
          return child;
        }).toList()..add(
          new FloatingActionButton(
            heroTag: null,
            child: new AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return new Transform(
                  transform: new Matrix4.rotationZ(_controller.value * 0.5 * math.pi),
                  alignment: FractionalOffset.center,
                  child: new Icon(_controller.isDismissed ? Icons.add : Icons.close),
                );
              },
            ),
            onPressed: () {
              if (_controller.isDismissed) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            },
          ),
        ),
      ),
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

void extraCls(context){
  String dropdownValue = 'One';
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Add Extra Class'),
          content: Container(
            height: 150,
            child: Column(
              children: <Widget>[
                Text('This shall be added to todays schedule'),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Format: HH : MM'
                  ),
                ),
                DropdownButton<String>(
                value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(
                  color: Colors.deepPurple
                  ),
                  underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                  dropdownValue = newValue;
                  },
                  items: <String>['One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                  );
                  })
                  .toList(),
                  )
              ],
                    ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: (){
                print('Added class by dialog');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
  );
}

void cancelCls(context){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Cancel Class'),
          content: Text('This shall be removed from todays schedule'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: (){
                print('Removed class by dialog');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
  );
}

void _settingModalBottomSheet(context){
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      context: context,
      builder: (BuildContext bc){
//        GlobalKey<MyHomePageState> inputTime;
        GlobalKey<FormState> inputTime;
        var inputSubj;
        var _value;
        return Container(
          child: new Wrap(
            children: <Widget>[
              Container(
//                color: Colors.blue,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.blue,
                ),
                child: Center(child: Text('Add to today\'s schedule',style: TextStyle(fontSize: 18, color: Colors.white,),)),
              ),
              new ListTile(
                  leading: new Icon(Icons.access_time),
                  title: new Text('Time'),
                  onTap: () => {}
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 30),
                child: Center(
                  child: TextFormField(
                        key: inputTime,
                        decoration: InputDecoration(
                          labelText: 'Format: HH : MM'
                        ),
//                      onSaved: (value){
//                        setState((){
//                          inputTime = GlobalKey()value
//                        }
//                        );
//                      },
                  ),
                ),
              ),
              new ListTile(
                leading: new Icon(Icons.assignment),
                title: new Text('Subject'),
                onTap: () => {},
              ),
              Center(
                child: DropdownButton(
                  value: inputSubj,
                  hint: Text('Choose Subject'),
                  onChanged: (value){
                    inputSubj = value;
                    print('add subject $value');
                  },
                  items: [
                    DropdownMenuItem<String>(
                      value: "1",
                      child: Text(
                        "First",
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: "2",
                      child: Text(
                        "Second",
                      ),
                    ),
                  ],
                ),
              ),
//                DropdownButton<String>(
//                      items: [
//                      DropdownMenuItem<String>(
//                      value: "1",
//                      child: Text(
//                      "First",
//                      ),
//                      ),
//                      DropdownMenuItem<String>(
//                      value: "2",
//                      child: Text(
//                      "Second",
//                      ),
//                      ),
//                      ],
//                      onChanged: (value) {
//                      setState(() {
//                      _value = value;
//                      });
//                      },
//                      value: _value,
//                      elevation: 2,
//                      style: TextStyle(color: Colors.purple, fontSize: 30),
//              isDense: true,
//              iconSize: 40.0,
//              ),
              SizedBox(height: 100,),
              Center(child: Text('These changes shall be considered temporary.\nFor permanent editing click here',style: TextStyle(color: Colors.grey,),textAlign: TextAlign.center,)),
              Center(
                child: RaisedButton(
                  child: Text('Apply'),
                  onPressed: (){
                    print(inputTime);
                  },
                ),
              )
            ],
          ),
        );
      }
  );
}