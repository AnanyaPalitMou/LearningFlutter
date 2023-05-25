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
        backgroundColor: Colors.purple[100],
      ),
      body: Center(
        child: IconButton(
          onPressed: (){
            print('You Clicked!');
          },
          icon: Icon(Icons.alternate_email),
          color: Colors.amber
        ),

        // child:ElevatedButton.icon(
        //   onPressed: () {  },
        //   icon: Icon(
        //     Icons.mail
        //   ),
        //   label: Text('Mail Me!'),
        //
        //
        //
        // ),

        //icon set
        // child: Icon(
        //   Icons.airport_shuttle,
        //   color: Colors.blue,
        //   size: 50.0,
        // ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Text('Click!'),
        backgroundColor: Colors.purple[700],
      ),
    );
  }
}
