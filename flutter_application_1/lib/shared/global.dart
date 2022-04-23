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
  static String passwordgenerate;
  static List itemsOfDropDown = [];
}

class Global {
  static int indexOfServices;
}

class genratepass {}

Random _rnd = Random();

String getRandomString(String name, dynamic num, int length) {
  String char = name + num + "!@#%&*";

  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => char.codeUnitAt(
        _rnd.nextInt(char.length),
      ),
    ),
  );
}
