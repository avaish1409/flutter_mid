import 'dart:math';
import 'package:flutter/material.dart';

class alph extends StatefulWidget {
  const alph({Key key}) : super(key: key);

  @override
  _alphState createState() => _alphState();
}

class _alphState extends State<alph>
    with TickerProviderStateMixin {
  bool rot= false;
  bool rot2= false;
  bool rot3= false;
  AnimationController _controller;
  AnimationController _controller2;

  @override
  void initState() {
    super.initState();
    this._controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    this._controller2 =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
//    final translateAnimation = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    super.dispose();
    this._controller.dispose();
    this._controller2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    double height = MediaQuery. of(context). size. height;
    final rotateAnimation =
    Tween<double>(begin: 0, end: pi).animate(this._controller);
    final rotateAnimation2 =
    Tween<double>(begin: 0, end: pi).animate(this._controller2);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: <Widget>[
          SizedBox(height: 100,),
          RaisedButton(
            child: Text('Head Back'),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          SizedBox(height: height-250,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[

                  AnimatedBuilder(
                    animation: rotateAnimation,
//            child: FlutterLogo(size: 72.0),
                    child: Icon(Icons.all_inclusive, color: Colors.white,),
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: rotateAnimation.value,
                        child: child,
                      );
                    },
                  ),
//                  AnimatedBuilder(
//                    animation: translateAnimation,
////            child: FlutterLogo(size: 72.0),
//                    child: Icon(Icons.arrow_drop_up, color: Colors.white,),
//                    builder: (context, child) {
//                      return Transform.translate(
//                        child: child,
//                        offset: Offset(0,500),
//                      );
//                    },
//                  ),
//          RaisedButton(
//            child: Text('Forward animation'),
//            onPressed: () => _controller.forward(),
//          ),
//          RaisedButton(
//            child: Text('Reverse animation'),
//            onPressed: () => _controller.reverse(),
//          ),
                  RaisedButton(
                    child: Text('Fire'),
                    onPressed: (){
                      if(rot){
                        print('rev');

                        _controller.reverse();
                      }
                      else{
                        print('fwd');
                        _controller.forward();
                      }
                      rot = !rot;
                    },
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  AnimatedBuilder(
                    animation: rotateAnimation,
//            child: FlutterLogo(size: 72.0),
                    child: Icon(Icons.all_inclusive, color: Colors.white,),
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: rotateAnimation.value,
                        child: child,
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text('Fire2'),
                    onPressed: (){
                      if(rot2){
                        print('rev2');
                        _controller.reverse();
                      }
                      else{
                        print('fwd2');
                        _controller.forward();
                      }
                      rot2 = !rot2;
                    },
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  AnimatedBuilder(
                    animation: rotateAnimation,
//            child: FlutterLogo(size: 72.0),
                    child: Icon(Icons.all_inclusive, color: Colors.white,),
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: rotateAnimation.value,
                        child: child,
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text('Fire3'),
                    onPressed: (){
                      if(rot3){
                        print('rev3');
                        _controller.reverse();
                      }
                      else{
                        print('fwd3');
                        _controller.forward();
                      }
                      rot3 = !rot3;
                    },
                  ),
                ],
              ),
            ],
          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              RaisedButton(
//                child: Text('X'),
//                onPressed: (){
//                  print('x');
//                },
//              ),
//              RaisedButton(
//                child: Text('Y'),
//                onPressed: (){
//                  print('y');
//                },
//              ),
//              RaisedButton(
//                child: Text('Z'),
//                onPressed: (){
//                  print('z');
//                },
//              ),
//            ],
//          ),
        ],
      ),
    );
  }
}
