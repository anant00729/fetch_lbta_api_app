import 'package:flutter/material.dart';
import 'home_detail.dart';

class HomeCell extends StatelessWidget {

  final _videos;
  final isLastLine;
  HomeCell(this._videos,this.isLastLine);

  @override
  Widget build(BuildContext context){
    return this._videos != null ? new Column(
            children: <Widget>[
                new FlatButton(
                  padding: const EdgeInsets.all(16.0),
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      new Image.network(this._videos != null ? this._videos['imageUrl'] : ""),
                      new Padding( padding: const EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 0.0)),
                      new Text(this._videos != null ? this._videos['name'] : "", style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w100)),
                 ],
               ),
               onPressed: (){
                 Navigator.push(context, new MaterialPageRoute(
                   builder: (context) {
                     return HomeDetail(id : this._videos['id'], title : this._videos['name']);
                   }
                 ));
               },
              ),
              this.isLastLine ? new Container() : new Divider(color: Colors.white) 
            ],
          ) : new Container();
  }
}
