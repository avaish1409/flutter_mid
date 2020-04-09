//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'main.dart';

//void main() => runApp(setn());

class dev extends StatelessWidget{
//
//  void back(){
//    print("heading home");
//    main();
//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      appBar: SliverAppBar()
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("aNI",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Image.asset(
                      "assets/img/Deep_Cosmos.jpg",
                      fit: BoxFit.cover,
                    )
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                    [
                      Icon(Icons.brightness_auto)
                    ]
                ),
              )
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
//              Text('Anirudh Vaish\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                Text('Just type in some stuff bro to make it look good and lets check if it works fine with lengthy ones\n', textAlign: TextAlign.center,),
                RaisedButton(
                  child: Text('Edit'),
                  onPressed: (){
                    print('profile -> edit');
                  },
                ),
//              GridView.count(
//                  crossAxisCount: 3,
//                  padding: const EdgeInsets.only(left: 10, right: 10),
//                  mainAxisSpacing: 0.0,
//                  crossAxisSpacing: 4.0,
//                  children: <Widget>[
//                    Text('B180048CS'),
//                    Text('CSE'),
//                    Text('2nd Yr.'),
//                    Text('B180048CS'),
//                    Text('CSE'),
//                    Text('2nd Yr.'),
//                  ],
//              )
//              Row(
//                children: <Widget>[
//                  Text('B180048CS'),
//                  Text('CSE'),
//                  Text('2nd Yr.'),
//                ],
//              ),
//              Row(
//                children: <Widget>[
//                  Text('B180048CS'),
//                  Text('CSE'),
//                  Text('2nd Yr.'),
//                ],
//              ),
//                SliverList(
//                  delegate: SliverChildListDelegate(
//                    [
//                    Text('B180048CS'),
//                    Text('CSE'),
//                    Text('2nd Yr.'),
//
//                    ],
//                  ),
//                ),
//                SliverGrid(
//                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//                  delegate: SliverChildListDelegate(
//                    [
//                      BodyWidget(Colors.blue),
//                      BodyWidget(Colors.green),
//                      BodyWidget(Colors.yellow),
//                      BodyWidget(Colors.orange),
//                      BodyWidget(Colors.blue),
//                      BodyWidget(Colors.red),
//                    ],
//                  ),
//                ),
              ],
            ),
          )
      ),

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