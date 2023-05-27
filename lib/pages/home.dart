import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {

    data=data.isNotEmpty?data:ModalRoute.of(context)?.settings?.arguments as Map;

    String? bgImage=(data?['isDayTime']?? false)?'night.png':'day.png';
    Color? bgColor=(data?['isDayTime']??false)?Colors.black:Colors.blueAccent;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 250, 0, 0),
          child: Column(
            children: <Widget>[
              TextButton.icon(
                  onPressed: () async{
                    dynamic result=await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data={
                        'time':result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag'],
                      };
                    });
              },
                icon: Icon(Icons.edit_location,
                color: Colors.blue,
                size: 30,
                ),

                label: Text(
                  'Edit Location',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),

                SizedBox(height: 20.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),

              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                  color: Colors.white,
                ),
              )

            ],
          ),
        ),
      ),

      ),
    );
  }
}

