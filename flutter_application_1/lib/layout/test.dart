// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class AppHome extends StatelessWidget {
  final TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: new TextField(
                  controller: controller,
                  decoration: new InputDecoration(
                      hintText: "Password",
                      border:
                          new OutlineInputBorder(borderSide: BorderSide()))),
            ),
            new SizedBox(
              height: 5,
            ),
            new FlutterPwValidator(
              controller: controller,
              minLength: 8,
              uppercaseCharCount: 2,
              numericCharCount: 3,
              specialCharCount: 1,
              normalCharCount: 3,
              width: 400,
              height: 150,
              onSuccess: () {
                print("MATCHED");
                ScaffoldMessenger.of(context).showSnackBar(
                    new SnackBar(content: new Text("Password is matched")));
              },
              onFail: () {
                print("NOT MATCHED");
              },
            ),
          ],
        ),
      ),
    );
  }
}
