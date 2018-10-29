import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../blocs/sample_bloc.dart';

class Sample extends StatelessWidget {
  final SampleBloc bloc = SampleBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(height: 12.0),
            Text('SampleChild1'),
            SampleChild1(bloc),
            Container(height: 12.0),
            Text('SampleChild2'),
            SampleChild2(bloc),
            Container(height: 12.0),
            Text('SampleChild3'),
            SampleChild3(bloc),
          ],
        ),
      ),
    );
  }
}

class SampleChild1 extends StatelessWidget {
  SampleChild1(this.bloc);
  final SampleBloc bloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.message,
      builder: (context, snapshot) {
        return Container(
          child: Text(snapshot.data ?? ''),
        );
      },
    );
  }
}

class SampleChild2 extends StatelessWidget {
  SampleChild2(this.bloc);
  final SampleBloc bloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.message,
      builder: (context, snapshot) {
        return Container(
          child: Text(snapshot.data ?? ''),
        );
      },
    );
  }
}

class SampleChild3 extends StatelessWidget {
  SampleChild3(this.bloc);
  final SampleBloc bloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.message,
      builder: (context, snapshot) {
        return Container(
          width: 200.0,
          child: TextField(
            onChanged: (String str) => bloc.setMessage(str),
          ),
        );
      },
    );
  }
}
