// ignore_for_file: missing_return, unused_local_variable

String phoneNumberValidator(String value) {
  Pattern pattern = r'^01[0125][0-9]{8}$';

  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Phone Numer';
  else
    return null;
}

String fullNameValidator(String value) {
  Pattern pattern = r'^(?![ .]+$)[a-zA-Z .]*$';

  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Phone Numer';
  else
    return null;
}

String EmailAdrresValidator(String value) {
  Pattern pattern = r'^01[0125][0-9]{8}$';

  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Phone Numer';
  else
    return null;
}
