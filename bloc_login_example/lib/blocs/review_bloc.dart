import 'dart:async';

class ReviewBloc extends Object {
  final _userId = StreamController<String>();
  final _message = StreamController<String>();

  Stream<String> get userId => _userId.stream;
  Stream<String> get message => _message.stream;

  Function(String) get setUserId => _userId.sink.add;
  Function(String) get setMessage => _message.sink.add;

  ReviewBloc() {
    setUserId('001');
    setMessage('test');
  }

  dispose() {
    _message.close();
    _userId.close();
  }
}
