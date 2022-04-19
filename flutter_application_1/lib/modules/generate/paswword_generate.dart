// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/modules/user/user/signup/Signup.dart';
import 'package:flutter_application_1/shared/components/components.dart';
import 'package:flutter_application_1/shared/global.dart';

class genrate extends StatelessWidget {
  const genrate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var phoneController = TextEditingController();
    var text = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('generate'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Please follow the instructions to create your password.Instructions :- Please do not share your PIN with anyone.- Please do not disclose your password on any untrusted websites or any social media.- Do not use your PIN here in anything external.',
                    style: TextStyle(),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  defaultFormField(
                      controller: phoneController,
                      type: TextInputType.number,
                      label: 'Enter your Special number',
                      prefix: Icons.phone,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Please Enter number';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultFormField(
                      controller: text,
                      type: TextInputType.text,
                      label: 'Enter your Special char',
                      prefix: Icons.phone,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Please Enter char';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 5.0,
                  ),
                  defaultButton(
                      function: () {
                        if (_formKey.currentState.validate()) {
                          // print(phoneController.text);
                          // print(text.text);
                          // genratepass().generatePassword(
                          //     text.toString(), phoneController.toString())
                          // print(genratepass().generatePassword(
                          //     text.toString(), phoneController));

                          print(genratepass().generatePassword(
                              text.toString(), phoneController.toString()));

                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Recive()));
                        }
                      },
                      text: 'submit'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
