import 'package:flutter/material.dart';
import 'package:opentalk/src/screen/chatPage.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: RaisedButton(onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
       })
    );
  }
}