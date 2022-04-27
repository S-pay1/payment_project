// ignore_for_file: unused_local_variable, camel_case_types, non_constant_identifier_names, avoid_print, prefer_typing_uninitialized_variables

// main() {
//   var userid = state.model.data.id;
// }
import 'dart:math';

class Gloablvar {
  static String id;
  static String phone;
  static String name;
  static var total;
  static var service_code;
  static var price;
  static var feeds;
  static var date;
  static String passwordgenerate;
  static List itemsOfDropDown = [];
  static String dropdownitem = "";
  static dynamic registerScreen;
  static dynamic resetpasswordScreen;
  static dynamic walletScreen;
  static var balance;
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
