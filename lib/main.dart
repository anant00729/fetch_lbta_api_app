import 'package:flutter/material.dart';
import 'package:brain_flutter_one/views/home.dart';

void main () => runApp(new MyApp());

class MyApp extends StatefulWidget{
  @override
  _MyApp createState(){
    return new _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  @override 
  Widget build(BuildContext context){
    return new MaterialApp(
       title : "Getting Started",
       theme: new ThemeData.dark(),
       home: new Home(),
       debugShowCheckedModeBanner: false,
    );
  }
}

