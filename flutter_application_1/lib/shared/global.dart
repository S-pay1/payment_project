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

// class genratepass {
//   // ignore: avoid_types_as_parameter_names
//   Function generatePassword(String char, nummm) {
//     var _chars = char.toString() + nummm.toString();

//     // List<String> RAD = [char.toString(), nummm.toString()];
//     // List<String> RAD = ['EZZ', '10'];
//     // const _chars = 'ezzahmed0101215';
//     // var _chars = RAD.join().toString();
//     // RAD.shuffle();

//     var hhh = getRandomString(_chars, 16);
//     print(hhh);
//     print(_chars);
//   }

//   Random _rnd = Random();
//   // Random rnd = new Random(new DateTime.now().millisecondsSinceEpoch);

//   String getRandomString(String _chars, int length) =>
//       String.fromCharCodes(Iterable.generate(
//           length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
// }

String generateRandomString(String char, nummm, int length) {
  final _random = Random();
  var _availableChars = char.toString() + nummm.toString();
  final randomString = List.generate(length,
          (index) => _availableChars[_random.nextInt(_availableChars.length)])
      .join();

  return randomString;
}
