//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

//void main() => runApp(setn());

class editTT extends StatelessWidget{

//  vx

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Table"),
      ),
      body: FlatButton(
        child: Text('Developer?'),
        onPressed: (){
          _showDev(context);
        },
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

void _showDev(context){
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
        return Center(
          child: Column(
            children: <Widget>[
              Container(
//                color: Colors.blue,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey,
                ),
                child: Center(child: Text('Developed By',style: TextStyle(fontSize: 18, color: Colors.white,),)),
              ),
              Image.asset('assets/img/aov.png', height: 100, alignment: Alignment.center,),
              Text('Arena of Visuals', style: TextStyle(fontSize: 25),),
              ListTile(
                leading: Icon(Icons.open_in_new),
                title: Text('aovisuals.ml'),
                onTap: (){
                  print('Redirecting to wevsite');
                },
              ),
              ListTile(
                leading: Icon(Icons.local_post_office),
                title: Text('aovisuals247@gmail.com'),
                onTap: (){
                  print('Redirecting to company e-mail ');
                },
              ),
              ListTile(
                leading: Icon(Icons.contacts),
                title: Text('Anirudh Vaish'),
                subtitle: Text('Owner'),
                onTap: (){
                  print('Owner info');
                },
              ),
              Text('\nWeb and App devvelopment just a few steps away!\nJoin us for a kick-start',textAlign: TextAlign.center, style: TextStyle(color: Colors.grey),),
//              SizedBox(height: 500,),
            ],
          ),
        );
      }
  );
}