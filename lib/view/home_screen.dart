import 'package:flutter/material.dart';
import 'package:mvvm/view_model/user_view-model.dart';
import 'package:provider/provider.dart';

import '../utils/routes/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreferences=Provider.of<UserViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
                onTap: (){
                  userPreferences.remove().then((value){
                    Navigator.pushNamed(context, RoutesName.login);
                  });
                },
                child: Text('Logout'))

          ],
        ),
      ),
    );
  }
}
