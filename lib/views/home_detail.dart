import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HomeDetail extends StatefulWidget {
    final id; 
    final title;

    HomeDetail({Key key, this.id, this.title}) : super(key : key);

    _HomeDetail createState(){
      return _HomeDetail();
    }

}

class _HomeDetail extends State<HomeDetail>{
    
    var detail = [];
    var _isLoading = false;

    @override
      void initState() {
        // TODO: implement initState
        super.initState();
        _fetchDetailData(); 
      }

    @override
    Widget build(BuildContext context){
      return new Scaffold(
         appBar: new AppBar(
           title : new Text(widget.title != null ? widget.title : ""),
           actions: <Widget>[
             new IconButton(icon: new Icon(Icons.refresh),onPressed: (){
              _fetchDetailData(); 
             })
           ],
         ),
         body: _isLoading ? new Center(child: new CircularProgressIndicator(),) : ListView.builder(
           itemCount: this.detail != null ? this.detail.length : 10,
           itemBuilder: (context, i) {
              return this.detail != null ? new Column(
                children: <Widget>[
                  new Divider(
                    height: 10.0,
                  ),
                  new ListTile(
                    leading: new Image.network(this.detail[i]['imageUrl'], width: 80.0, height: 60.0),
                    title: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(this.detail[i]['name'], style: new TextStyle(fontSize: 12.0),)
                      ],

                    ),
                    subtitle: new Container(
                      padding: const EdgeInsets.only(top : 5.0),
                      child : new Text(this.detail[i]['duration'])
                    ),
                  )
                ],
              ) : new Container();
           }
         )
      );
    }
    
    _fetchDetailData() async {
      setState(() {this._isLoading = true;});      

      final main = widget.id;
      var res = await http.get('http://api.letsbuildthatapp.com/youtube/course_detail?id=$main');

      final d = json.decode(res.body);
      print(d);
      if(this.mounted){
        setState(() {this.detail = d;this._isLoading = false;});
      }
    }
}


  
