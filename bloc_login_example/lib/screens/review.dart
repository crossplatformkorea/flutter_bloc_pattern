import 'dart:async';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bloc_login_example/blocs/review_bloc.dart';
import 'package:bloc_login_example/blocs/bloc_provider.dart';

class Review extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<Review> {
  ReviewBloc reviewBloc = ReviewBloc();
  var _stream;

  @override
  void initState() {
    super.initState();
    _stream = StreamZip([
       reviewBloc.userId, reviewBloc.message,
    ]);
    // _stream = StreamGroup.merge([reviewBloc.userId, reviewBloc.message]);
  }

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of(context);
    return StreamBuilder(
      stream: _stream,
      builder: (context, snapshot) {
        print('snapshot');
        print(snapshot);
        return Container(
          width: 200.0,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Text('myUserId: ${snapshot.data[0]}'),
              Text('message: ${snapshot.data[1]}'),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    reviewBloc.dispose();
    super.dispose();
  }
}