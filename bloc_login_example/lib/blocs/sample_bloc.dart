import 'dart:async';

class SampleBloc extends Object {
  final _message = StreamController<String>.broadcast();

  Stream<String> get message => _message.stream;

  Function(String) get setMessage => _message.sink.add;

  SampleBloc() {
    init();
    setMessage('test');
  }

  init() {
//    print('init');
//    await Future.delayed(Duration(seconds: 2));
//    setMessage('message');
  }

  dispose() {
    _message.close();
  }
}