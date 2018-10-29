import 'package:flutter/material.dart';
import './sample_bloc.dart' show SampleBloc;

class BlocProvider extends InheritedWidget {
  final blocState = new _BlocState(
    sampleBloc: SampleBloc(),
  );

  BlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static _BlocState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider)
        .blocState;
  }
}

class _BlocState {
  final SampleBloc sampleBloc;

  _BlocState({
    this.sampleBloc,
  });
}
