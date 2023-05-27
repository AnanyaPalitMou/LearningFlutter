import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  //String time='loading';

  // void getTime() async{
  //   Response response=await get(Uri.parse('http://worldtimeapi.org/api/timezone/Europe/London')) ;
  //   Map data=jsonDecode(response.body);
  //   //print(data);
  //
  //   String datetime=data['datetime'];
  //   String offset=data['utc_offset'].subString(1,3);
  //   // print(datetime);
  //   // print(offset);
  //
  //   DateTime now=DateTime.parse(datetime);
  //   now.add(Duration(hours: int.parse(offset)));
  //   print(now);
  //
  // }

  void setupWorldTime() async {
    WorldTime instance=WorldTime(location: 'Bangladesh', flag: 'bangladesh.png', url: 'Etc/GMT+6');
    await instance.getTime();

    if(!mounted) return;
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    });
    //print(instance.time);
    // setState(() {
    //   time=instance.time;
    // });
  }

  @override
  void initState() {
    super.initState();
    //getTime();
    setupWorldTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      // body: Padding(
      //   padding: EdgeInsets.all(50.0),
      //   child: Text('loading'),
      // )
      body: Center(
        child: SpinKitSpinningLines(
          color:Colors.blueGrey,
          size:100.0,
        ),
      ),
    );
  }
}
