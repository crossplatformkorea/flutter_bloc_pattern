import 'dart:async';

enum Gender {
  male, female
}

class AuthBloc extends Object {
  final _loggedIn = StreamController<bool>.broadcast();
  final _doneLoading = StreamController<bool>.broadcast();

  Stream<bool> get loggedIn => _loggedIn.stream;
  Stream<bool> get doneLoading => _doneLoading.stream;

  Function(bool) get setLoggedIn => _loggedIn.sink.add;
  Function(bool) get setLoading => _doneLoading.sink.add;

  AuthBloc() {
    init();
  }

  init() async {
    print('init');
    await Future.delayed(Duration(seconds: 2));
    setLoading(true);
  }

  dispose() {
    _loggedIn.close();
    _doneLoading.close();
  }
}