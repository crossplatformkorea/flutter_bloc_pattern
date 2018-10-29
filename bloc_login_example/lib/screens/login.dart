import 'dart:async';
import 'package:flutter/material.dart';

import '../blocs/bloc_provider.dart';
import '../blocs/auth_bloc.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  AuthBloc authBloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: authBloc.doneLoading,
        initialData: false,
        builder: (context, snapshot) {
          print(snapshot.connectionState);
          print(snapshot.data);
          if (!snapshot.data ?? false) {
            return Text('loading');
          }
          return Text('done');
        },
      ),
    );
  }
}
