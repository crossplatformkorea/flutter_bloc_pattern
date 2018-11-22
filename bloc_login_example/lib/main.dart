import 'package:flutter/material.dart';

import 'package:bloc_login_example/blocs/bloc_provider.dart' show BlocProvider;
import 'package:bloc_login_example/screens/auth.dart' show Auth;
import 'package:bloc_login_example/screens/review.dart' show Review;

void main() => runApp(BlocProvider(child: new MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Auth(),
      routes: {
        '/review': (BuildContext context) => Review(),
      }
    );
  }
}


