import 'package:flutter/material.dart';
import 'home_cell.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Home extends StatefulWidget {

  @override
  _Home createState(){
    return new _Home();
  }
}

class _Home extends State<Home>{



  var _isLoading = false;
  var _videos; 

  _fetchData() async {
    setState((){_isLoading = true;});
    final data = await http.get('http://api.letsbuildthatapp.com/youtube/home_feed');
    if (data.statusCode == 200){
      final d = json.decode(data.body);
      
      setState((){
        _isLoading = false;
        this._videos = d['videos'];
      });
    }
    
  }

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _fetchData();
    }
  
    @override
    Widget build(BuildContext context){
      return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.refresh),onPressed: (){
            _fetchData();
          })
        ],
      ),
      body: _isLoading ? new Center(child : new CircularProgressIndicator()) :  ListView.builder(
        itemCount: this._videos != null ? this._videos.length : 0,
        itemBuilder: (context, i ){
          return new HomeCell(this._videos[i], i == this._videos.length - 1);
        }
      )
    );
    }
  }

  


  