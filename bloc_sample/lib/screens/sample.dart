import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../blocs/bloc_provider.dart';
import '../blocs/sample_bloc.dart';

class Sample extends StatelessWidget {
//  final SampleBloc bloc = SampleBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sample'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(height: 12.0),
              Text('SampleChild1'),
              SampleChild1(),
              Container(height: 12.0),
              Text('SampleChild2'),
              SampleChild2(),
              Container(height: 12.0),
              Text('SampleChild3'),
              SampleChild3(),
            ],
          ),
        ),
      ),
    );
  }
}

class SampleChild1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: BlocProvider.of(context).sampleBloc.message,
      builder: (context, snapshot) {
        return Container(
          child: Text(snapshot.data ?? ''),
        );
      },
    );
  }
}

class SampleChild2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: BlocProvider.of(context).sampleBloc.message,
      builder: (context, snapshot) {
        return Container(
          child: Text(snapshot.data ?? ''),
        );
      },
    );
  }
}

class SampleChild3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: BlocProvider.of(context).sampleBloc.message,
      builder: (context, snapshot) {
        return Container(
          width: 200.0,
          child: TextField(
            onChanged: (String str) => BlocProvider.of(context).sampleBloc.setMessage(str),
          ),
        );
      },
    );
  }
}
