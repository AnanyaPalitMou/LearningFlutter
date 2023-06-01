import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider_stateless/HomeScreen.dart';
import 'package:state_provider_stateless/provider/auth_provider.dart';
import 'package:state_provider_stateless/provider/count_provider.dart';
import 'package:state_provider_stateless/provider/example_one_provider.dart';
import 'package:state_provider_stateless/provider/favourite_provider.dart';
import 'package:state_provider_stateless/provider/theme_changer_provider.dart';
import 'package:state_provider_stateless/screen/count_examples.dart';
import 'package:state_provider_stateless/screen/dark_theme.dart';
import 'package:state_provider_stateless/screen/example_one.dart';
import 'package:state_provider_stateless/screen/favourite/favourite_screen.dart';
import 'package:state_provider_stateless/screen/favourite/my_favourite.dart';
import 'package:state_provider_stateless/screen/login.dart';
import 'package:state_provider_stateless/screen/value_notify_listener.dart';
import 'package:state_provider_stateless/stateful_screen.dart';
import 'package:state_provider_stateless/why_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final themeChanger=Provider.of<ThemeChanger>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>CountProvider()),
        ChangeNotifierProvider(create: (_)=>ExampleOneProvider()),
        ChangeNotifierProvider(create: (_)=>FavouriteItemProvider()),
        ChangeNotifierProvider(create: (_)=>ThemeChanger()),
        ChangeNotifierProvider(create: (_)=> AuthProvider())
      ],

      child: Builder(
        builder: (context) {
          final themeChanger=Provider.of<ThemeChanger>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode:Provider.of<ThemeChanger>(context).themeMode ,
            theme:ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.green,
            ),

            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.red,
              primaryColor: Colors.red,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.red,
              )

            ),



            home:  LoginScreen(),
          );
        }
      ),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme:ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const CountExample(),
    );
  }
}




