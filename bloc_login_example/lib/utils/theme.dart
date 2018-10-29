import 'package:flutter/material.dart';

class Data {
  Data._();
  static getTheme(BuildContext context) {
    return Theme.of(context);
  }
}

class Colors {
  Colors._(); // this basically makes it so you can instantiate this class
  static const black22 = Color.fromARGB(255, 22, 22, 22);
  static const black27 = Color.fromARGB(255, 27, 27, 27);
  static const black33 = Color.fromARGB(255, 33, 33, 33);
  static const black44 = Color.fromARGB(255, 44, 44, 44);
  static const black55 = Color.fromARGB(255, 55, 55, 55);
  static const hint = Color.fromARGB(255, 58, 115, 59);
  static const layer = Color.fromARGB(255, 31, 36, 51);
  static const disabled = Color.fromARGB(255, 97, 97, 97);
  static const accent = Color.fromRGBO(13, 156, 197, 1.0);
  static const primary = Color.fromRGBO(23, 28, 31, 1.0);
  static const background = Color.fromRGBO(28, 38, 42, 1.0);
  static const fontColor = Color.fromRGBO(111, 191, 183, 1.0);
  static const fontColorDisabled = Color.fromRGBO(74, 99, 113, 1.0);
  static const purple = Color.fromRGBO(166, 111, 205, 1.0);
  static const blue = Color.fromRGBO(91, 121, 201, 1.0);
  static const yellow = Color.fromRGBO(187, 147, 75, 1.0);
  static const red = Color.fromRGBO(222, 1114, 83, 1.0);
}

class Icons {
  Icons._();
}

