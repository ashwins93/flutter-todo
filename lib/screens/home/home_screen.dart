import 'package:flutter/material.dart';
import 'package:todo_list/screens/home/components/body.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
          color: Colors.grey,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search), onPressed: () {}, color: Colors.grey),
          IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
              color: Colors.grey),
        ],
      ),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[600],
      ),
    );
  }
}