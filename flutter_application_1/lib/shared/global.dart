// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:math';

class Gloablvar {
  static String id;
  static String Paymentid;
  static String phone;
  static String name;
  static String Email;
  static var total;
  static var service_code;
  static var price;
  static var feeds;
  static var date;
  static var otp;
  static String passwordgenerate;
  static String Numbergenerate;
  static List itemsOfDropDown = [];
  static String dropdownitem = "";
  static bool registerScreen = false;
  static bool resetpasswordScreen = false;
  static bool walletScreen = false;
  static var balance;
}

class Global {
  static int indexOfServices;
}

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
