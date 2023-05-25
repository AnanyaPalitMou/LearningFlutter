import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Home()
));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
        centerTitle: true,
        backgroundColor: Colors.purple[300],
      ),

      body: Padding(
        padding: EdgeInsets.all(90.0),
        child: Text('Hello'),
      ),

      // body: Container(
      //   padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      //   margin: EdgeInsets.all(30.0),
      //   color: Colors.purple[50],
      //   child: Text('Hello!'),
      // ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Text('Click!'),
        backgroundColor: Colors.purple[700],
      ),
    );
  }
}
