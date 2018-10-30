
import 'package:flutter/material.dart';
import '../blocs/auth_bloc.dart' show AuthBloc;
import '../blocs/sample_bloc.dart' show SampleBloc;

class BlocProvider extends InheritedWidget {
  final blocState = new _BlocState(
    authBloc: AuthBloc(),
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
  final AuthBloc authBloc;
  final SampleBloc sampleBloc;

  _BlocState({
    this.authBloc,
    this.sampleBloc,
  });
}
