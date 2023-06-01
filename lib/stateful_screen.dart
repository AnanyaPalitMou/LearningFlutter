import 'package:flutter/material.dart';

class statefulWidget extends StatefulWidget {
  const statefulWidget({Key? key}) : super(key: key);

  @override
  State<statefulWidget> createState() => _statefulWidgetState();
}

class _statefulWidgetState extends State<statefulWidget> {
  int x=0;
  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscribe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(DateTime.now().toString()),
Container(

  child: Center(
    child: Text(x.toString(),
      style:TextStyle(fontSize: 50),),
  ),
)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        x++;
        print(x++);
        setState(() {

        });
        },
        child: Icon(Icons.add),

      ),
    );
  }
}
