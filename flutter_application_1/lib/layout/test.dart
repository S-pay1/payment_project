// /*import 'dart:math';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:udemy_flutter/shared/components/components.dart';
// import 'package:uuid/uuid.dart';
// import 'package:flutter/src/widgets/text.dart';

// import 'package:uuid/uuid_util.dart';

// class Test extends StatefulWidget {
//   const Test({Key key}) : super(key: key);

//   @override
//   State<Test> createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   @override
//   Widget build(BuildContext context) {
//     var textControllor = TextEditingController();
//     var numcontrollor = TextEditingController();
//     final _formKey = GlobalKey<FormState>();
//     var e = 0;
//     var uuid = Uuid();

//     return Scaffold(
//         appBar: AppBar(
//           leading: Icon(Icons.arrow_back),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 defaultFormField(
//                     controller: numcontrollor,
//                     type: TextInputType.number,
//                     label: 'number',
//                     validate: (String value) {
//                       if (value.isEmpty) {
//                         return 'Please Enter your phone';
//                       }
//                       return null;
//                     }),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 defaultFormField(
//                     controller: textControllor,
//                     length: 10,
//                     type: TextInputType.text,
//                     label: 'text',
//                     validate: (String value) {
//                       if (value.isEmpty) {
//                         return 'Please Enter your phone';
//                       }
//                       return null;
//                     }),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 defaultButton(
//                     function: () {
//                       if (_formKey.currentState.validate()) {}
//                     },
//                     text: 'yyyy'),
//                 ElevatedButton(
//                   child: Text('UUID'),
//                   onPressed: () {
//                     setState(() {
//                       var e = uuid.v1();
//                       print(e);
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }*/

// import 'package:otp/otp.dart';

// void main() {
//   final code = OTP.generateTOTPCodeString(
//       'JBSWY3DPEHPK3PXP', DateTime.now().millisecondsSinceEpoch);
//   print(code);

//   final code2 = OTP.generateTOTPCodeString(
//       'JBSWY3DPEHPK3PXP', DateTime.now().millisecondsSinceEpoch,
//       interval: 10);
//   print(code2);

//   final code3 = OTP.generateTOTPCodeString(
//       'JBSWY3DPEHPK3PXP', DateTime.now().millisecondsSinceEpoch,
//       interval: 20, algorithm: Algorithm.SHA512);
//   print(code3);

//   final code4 =
//       OTP.generateHOTPCodeString('OBRWE5CEFNFWQQJRMZRGM4LZMZIGKKZU', 1);
//   print(code4);

//   final code5 = OTP.generateTOTPCodeString('JBSWY3DPEHPK3PXP', 1362302550000);
//   print(code5);

//   final code6 = OTP.generateTOTPCodeString(
//       'JBSWY3DPEHPK3PXP', DateTime.now().millisecondsSinceEpoch,
//       interval: 60);
//   print(code6);
//   print(OTP.remainingSeconds(interval: 60));

//   final code7 = OTP.generateTOTPCodeString(
//       'JBSWY3DPEHPK3PXP', DateTime.now().millisecondsSinceEpoch);
//   print(code7);
//   print(OTP.remainingSeconds());
// }
