import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();

}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations=[
    WorldTime(location: 'India', flag: 'india.png', url: 'Etc/GMT+5'),
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'New York', flag: 'usa.png', url: 'America/New_York'),
    WorldTime(location: 'Bangladesh', flag: 'bangladesh.png', url: 'Etc/GMT+6'),
    WorldTime(location: 'Germany', flag: 'germany.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Seoul', flag: 'south_korea.png', url: 'Asia/Seoul'),

  ];

  void updateTime(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();

    if(!mounted) return;
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    });
  }

  //int counter=0;

  // void getData(){
  //   Future.delayed(Duration(seconds: 3), (){
  //     print('Ananya');
  //   });
  //   print('Mou');
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  // }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),

      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);

                },
                title: Text(
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  locations[index].location,
                ),
                  leading:CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
        },
      ),
    );
  }
}
