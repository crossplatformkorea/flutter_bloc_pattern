import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../screens/login.dart';
import '../screens/sample.dart';
import '../shared/btn.dart';
import '../utils/theme.dart' as Theme;
import '../blocs/bloc_provider.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => new _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  @override
  void dispose() {
    BlocProvider.of(context).authBloc.dispose();
    super.dispose();
  }

 @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: BlocProvider.of(context).authBloc.loggedIn,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            color: Theme.Colors.blue,
            width: double.infinity,
            height: double.infinity,
            child: Center(child: Text(
              'Loading',
              style: TextStyle(
                fontSize: 32.0,
                color: Colors.white,
                decorationStyle: TextDecorationStyle.solid,
              ),
            )),
          );
        } else if (snapshot.data) {
          return Sample();
        } else {
          return Login();
        }
      },
    );
  }

  _checkAuth() async {
    await Future.delayed(Duration(seconds: 3));
    BlocProvider.of(context).authBloc.setLoggedIn(true);
  }
}