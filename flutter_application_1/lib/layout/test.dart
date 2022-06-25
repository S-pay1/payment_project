// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

import '../shared/components/components.dart';

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
              height: 30,
            ),
            defaultButton(
                function: () {
                  print('$controller');
                },
                text: 'tetd')
          ],
        ),
      ),
    );
  }
}
