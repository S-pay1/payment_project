// ignore_for_file: unused_local_variable, camel_case_types, non_constant_identifier_names

// main() {
//   var userid = state.model.data.id;
// }
import 'dart:math';

import 'package:flutter/material.dart';

class Gloablvar {
  static String id;
  static String phone;
  static String name;
}

class Global {
  static int indexOfServices;
}

class genratepass {
  // ignore: avoid_types_as_parameter_names
  Function generatePassword(String char, nummm) {
    var _chars = char.toString() + nummm.toString();
    var hhh = getRandomString(_chars, 16);
    print(hhh);
    print(_chars);
  }

  Random _rnd = Random();
  Random rnd = new Random(new DateTime.now().millisecondsSinceEpoch);

  String getRandomString(String _chars, int length) =>
      String.fromCharCodes(Iterable.generate(
          length, (_) => _chars.codeUnitAt(rnd.nextInt(_chars.length))));
}
