import 'dart:async';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../blocs/review_bloc.dart';

class Review extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<Review> {
  ReviewBloc reviewBloc = ReviewBloc();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: StreamZip([
        reviewBloc.userId, reviewBloc.message,
      ]),
      builder: (context, snapshot) {
        print('snapshot');
        print(snapshot);
        return Container(
          width: 200.0,
          color: Colors.white,
        );
      },
    );
  }
}