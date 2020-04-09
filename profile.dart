//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'main.dart';
import 'login.dart';

//void main() => runApp(setn());

class prfl extends StatelessWidget{
//
//  void back(){
//    print("heading home");
//    main();
//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              child: FittedBox(
                child: FloatingActionButton(
                  heroTag: null,
                  tooltip: 'Edit Image',
                  child: Icon(Icons.adb),
                  backgroundColor: Colors.grey,
                  onPressed: (){
                    print('Change profile img');
                  },
                ),
              ),
            ),
            Text('\nAnirudh Vaish\n', style: TextStyle(fontSize: 30),),

            Text('We know this stuff about the user and process it syntactically throug nlp and other ml algo\n',textAlign: TextAlign.center, style: TextStyle(color: Colors.grey),),
            ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('National Institute of Technology'),
              subtitle: Text('Sikkim'),
              onTap: (){
                print('Edit Institute');
              },
              trailing: Text('2nd Yr'),
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text('9999099534'),
              subtitle: Text('India'),
              onTap: (){
                print('Edit Number');
              },
            ),
            ListTile(
              leading: Icon(Icons.local_post_office),
              title: Text('anirudhvaish147@gmail.com'),
              subtitle: Text('b180048@nitsikkim.ac.in'),
              onTap: (){
                print('Edit e-mail');
              },
            ),
            ListTile(
              leading: Icon(Icons.wc),
              title: Text('Male'),
//              subtitle: Text('b180048@nitsikkim.ac.in'),
              onTap: (){
                print('Edit gender');
              },
            ),
            RaisedButton(
              onPressed: (){
                print('Logout');
                Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: ListTile(
                title: Text('LogOut'),
                trailing: Icon(Icons.exit_to_app),
              ),
            ),
          ],

        ),
      ),

      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: (){
          Navigator.pop(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.home),
      ),
    );
  }

}