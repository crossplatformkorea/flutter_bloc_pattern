import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../blocs/bloc_provider.dart';
import '../screens/sample.dart';
import '../shared/btn.dart';
import '../utils/theme.dart' as Theme;

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String _email;
  String _password;


  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarIconBrightness: Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child:
      Form(
        key: formKey,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    Row(
                      children: <Widget>[
                        Container(child:
                        Icon(
                          Icons.insert_comment,
                          size: 60.0,
                        ),
                          margin: const EdgeInsets.only(top: 120.0, bottom: 8.0),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    Row(
                      children: <Widget>[
                        Container(child:
                        Text(
                          'App Name',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          ),
                        ),
                          margin: EdgeInsets.only(left: 12.0),
                        ),
                      ],
                    ),
                    Container(child:
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        hintText: 'Write your email address',
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(4.0),
                        ),
                      ),
                      autocorrect: false,
                      onSaved: (val) => _email = val,
                      validator: (val) {
                        if (val.length == 0) {
                          return 'Please type in your password.';
                        }
                      },
                    ),
                      margin: const EdgeInsets.only(top: 112.0),
                    ),
                    Container(child:
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        hintText: '******',
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(4.0),
                        ),
                      ),
                      validator: (val) {
                        if (val.length == 0) {
                          return 'Please type in your password.';
                        }
                      },
                      autocorrect: false,
                      onSaved: (val) => _password = val,
                      obscureText: true,
                    ),
                      margin: const EdgeInsets.only(top: 10.0),
                    ),
                    Container(child:
                    Row(children: <Widget>[
                      Expanded(child:
                      Btn(
                        text: 'SIGN UP',
                        onPress: () {},
                        height: 60.0,
                        fontSize: 16.0,
                        color: Theme.Colors.accent,
                        textColor: Theme.Colors.accent,
                        margin: const EdgeInsets.only(left: 0.0, right: 6.0),
                      ),
                      ),
                      Expanded(child:
                      Container(child:
                      RaisedButton(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () => _setLoggedIn(),
                        // onPressed: () { _submit(context); },
                        color: Theme.Colors.primary,
                      ),
                        height: 60.0,
                      ),
                      ),
                    ]),
                      margin: const EdgeInsets.only(top: 20.0),
                    ),
                    Container(child:
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                          fontSize: 14.0,
                          decoration: TextDecoration.combine([
                            TextDecoration.underline
                          ]),
                        ),
                      ),
                    ),
                      margin: const EdgeInsets.only(top: 12.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
        constraints: BoxConstraints.expand(
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }

  void _setLoggedIn() {
    BlocProvider.of(context).authBloc.setLoggedIn(true);
  }

  void _submit(BuildContext context) {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      print('login');
    }

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return Sample();
      }),
    );
  }
}
