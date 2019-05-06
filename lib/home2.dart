import 'package:flutter/material.dart';

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => new _Home2State();
 }
class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('First Screen'),
        ),
        body: new Container(
            height: 200.0,
            color: Colors.blue,
            child: new ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 10,
                // itemExtent: 10.0,
                // reverse: true, //makes the list appear in descending order
                itemBuilder: (BuildContext context, int index) {
                  return _buildItems(index);
                })));
  }

  Widget _buildItems(int index) {
  return new Container(
    width: 220,
    child: GestureDetector(
      child: Card(
    color: Colors.yellow,
    margin: const EdgeInsets.all(10),
    child: new Row(
      children: [
        new Row(children: [
          new RaisedButton(
            child: new Text("Hii"),
            onPressed: () {},
          ),
        ])
      ],
    ),
  ),
  onTap: () => print('Hola'),
    )
  );
}


}

