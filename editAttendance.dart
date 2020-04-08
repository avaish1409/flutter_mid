//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

//void main() => runApp(setn());

class editAtt extends StatelessWidget{

//  vx

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Table"),
      ),
      body: Text("att_chk"),
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