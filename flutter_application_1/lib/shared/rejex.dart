// ignore_for_file: missing_return, unused_local_variable

String phoneNumberValidator(String value) {
  Pattern pattern = r'^01[0125][0-9]{8}$';

  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Enter Valid Phone Numer';
  } else {
    return null;
  }
}

String fullNameValidator(String value) {
  Pattern pattern = r'^(?![ .]+$)[a-zA-Z .]*$';

  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Enter Valid Name';
  } else {
    return null;
  }
}

// ^(?=[\s\S]{1,30}$)([^\r\n]{0,10}(\r?\n|$)){5}$
String EmailAdrresValidator(String value) {
  Pattern pattern = r'[A-z0-9.\]+@[A-z0-9]+\.(com)';

  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Enter Valid Email';
  } else {
    return null;
  }
}

String tax(String value) {
  Pattern pattern = r'^(?=[\s\S]{1,30}$)([^\r\n]{0,10}(\r?\n|$)){5}$';

  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Enter Valid Phone Numer';
  } else {
    return null;
  }
}
