import 'dart:async';
import 'package:flutter/material.dart';

import '../screens/login.dart';
import '../screens/sample.dart';

enum Gender {
  male, female
}

class AuthBloc extends Object {
  BuildContext _context;
  final _loggedIn = StreamController<bool>.broadcast();
  final _doneLoading = StreamController<bool>.broadcast();

  Stream<bool> get loggedIn => _loggedIn.stream;
  Stream<bool> get doneLoading => _doneLoading.stream;

  Function(bool) get setLoggedIn => _loggedIn.sink.add;
  Function(bool) get setLoading => _doneLoading.sink.add;

  AuthBloc() {
   loggedIn.listen((bool result) {
     print('loggedIn: $result');
     if (_context != null) {
       Navigator.pushReplacement(
       _context,
       PageRouteBuilder(
         pageBuilder: (_context1, animation1, animation2) {
           return !result ? Login() : Sample();
         },
         transitionsBuilder: (_context, animation, _, child) {
           return new SlideTransition(
             child: child,
             position: new Tween<Offset>(
               begin: !result ? const Offset(-1.0, 0.0) : const Offset(1.0, 0.0),
               end: Offset.zero,
             ).animate(animation),
           );
         },
         transitionDuration: Duration(milliseconds: 500),
       ),
      );
     }
   }, onError: (error) {
     Scaffold.of(_context).showSnackBar(new SnackBar(
       content: new Text(error.message),
     ));
   });
   setLoading(true);
  }

  setContext(BuildContext context) {
    _context = context;
  }

  dispose() {
    _loggedIn.close();
    _doneLoading.close();
  }
}