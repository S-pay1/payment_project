// ignore_for_file: unused_local_variable, camel_case_types, non_constant_identifier_names, avoid_print

// main() {
//   var userid = state.model.data.id;
// }
import 'dart:math';

class Gloablvar {
  static String id;
  static String phone;
  static String name;
  static double total;
  static int service_code;
  static int price;
  static double feeds;
  static String date;
}

class Global {
  static int indexOfServices;
}

class genratepass {
  // ignore: avoid_types_as_parameter_names
  Function generatePassword(String char, String nummm) {
    // var _chars = char + nummm;

    // List<String> _chars = [char.toString(), nummm.toString()];
    // List<String> RAD = [char, nummm];
    // final xx = <String>[char.toString(), nummm.toString()];
    // xx.shuffle();
    const _chars = 'ezzahmed0101215';
    // var _chars = RAD.shuffle();
    // RAD.shuffle();

    var hhh = getRandomString(_chars, 16);
    print(hhh);
    print(_chars);
  }

  Random _rnd = Random();
  // Random rnd = new Random(new DateTime.now().millisecondsSinceEpoch);

  String getRandomString(String _chars, int length) =>
      String.fromCharCodes(Iterable.generate(
          length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}

// static String  generateRandomString(String char, nummm, int length) {
//   final _random = Random();
//   var _availableChars = char.toString() + nummm.toString();
//   final randomString = List.generate(length,
//           (index) => _availableChars[_random.nextInt(_availableChars.length)])
//       .join();

//   return randomString;
// }
