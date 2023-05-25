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

body:Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Text('Hello World!'),
    TextButton(
        onPressed: (){},
        child: Text('CLick Me!'),
    ),

    Container(

      color: Colors.purple[50],
      padding: EdgeInsets.all(30.0),
      child: Text('Inside Container'),
    )

  ],
),

      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Text('Click!'),
        backgroundColor: Colors.purple[700],

      ),
    );
  }
}