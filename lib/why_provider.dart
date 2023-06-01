import 'package:flutter/material.dart';
import 'dart:async';

class WhyProviderScreen extends StatefulWidget {
  const WhyProviderScreen({Key? key}) : super(key: key);

  @override
  State<WhyProviderScreen> createState() => _WhyProviderScreenState();
}

class _WhyProviderScreenState extends State<WhyProviderScreen> {

  int count=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(seconds: 1), (timer) {
      count++;
      print(count);
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscribe'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Center(
            child: Text(DateTime.now().hour.toString()+":"+DateTime.now().minute.toString()+":"+DateTime.now().second.toString(),
              style:TextStyle(fontSize: 50),),
          ),

          Center(
            child: Text(count.toString(),
            style:TextStyle(fontSize: 50),),
          )
        ],
      ),
    );
  }
}
