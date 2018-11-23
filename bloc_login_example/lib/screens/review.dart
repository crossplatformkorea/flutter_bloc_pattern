import 'dart:async';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:bloc_login_example/blocs/review_bloc.dart';

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
    return Container(
      child: StreamBuilder(
      stream: _stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        return SizedBox(
          width: 800.0,
          height: 600.0,
          child: Column(
            children: <Widget>[
              Text('userId: ', textDirection: TextDirection.ltr),
              Text('${snapshot.data[0]}', textDirection: TextDirection.ltr),
              Text('message: ', textDirection: TextDirection.ltr),
              Text('${snapshot.data[1]}', textDirection: TextDirection.ltr),
            ],
          ),
        );
      },
    ));
  }

  @override
  void dispose() {
    reviewBloc.dispose();
    super.dispose();
  }
}