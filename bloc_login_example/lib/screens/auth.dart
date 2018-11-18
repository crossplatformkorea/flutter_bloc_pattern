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
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: BlocProvider.of(context).authBloc.doneLoading,
      builder: (context, snapshot) {
        if (!snapshot.hasData || !snapshot.data) {
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
        }
        return Container(
          color: Theme.Colors.blue,
          width: double.infinity,
          height: double.infinity,
          child: Center(child: Text(
            'You should not see this.',
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.white,
              decorationStyle: TextDecorationStyle.solid,
            ),
          )),
        );
      },
    );
  }

  _checkAuth() {
    Future.delayed(Duration.zero, () async {
      BlocProvider.of(context).authBloc.setContext(context);
      await Future.delayed(Duration(seconds: 3));
      BlocProvider.of(context).authBloc.setLoggedIn(true);
    });
  }
}