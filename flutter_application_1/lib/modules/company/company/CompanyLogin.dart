// ignore_for_file: missing_required_param, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/shared/components/components.dart';

import 'companyRecipts.dart';
import 'termsAndPoliceis.dart';

class companyScreen extends StatefulWidget {
  @override
  State<companyScreen> createState() => companyLogin();
}

class companyLogin extends State<companyScreen> {
  var phoneController = TextEditingController();
  var emailadress = TextEditingController();
  var passwordController = TextEditingController();
  var username = TextEditingController();
  //final regexEmail = EmailValidator;

  var _formkey = GlobalKey<FormState>();

  bool ispassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          'Company Login ',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(children: [
              Image(
                image: AssetImage("assets/images/Wavy_REst-03_Single-11.jpg"),
                height: 300.0,
                width: 300.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              defaultFormField(
                controller: emailadress,
                type: TextInputType.emailAddress,
                label: 'email',
                prefix: Icons.email_outlined,
                //validate: regexEmail
              ),
              SizedBox(
                height: 20.0,
              ),
              defaultFormField(
                controller: passwordController,
                type: TextInputType.visiblePassword,
                validate: (String Value) {
                  if (Value.isEmpty) {
                    return 'Please Enter Your Password';
                  }
                  return null;
                },
                label: 'Password  ',
                prefix: Icons.lock,
                suffix: ispassword ? Icons.visibility : Icons.visibility_off,
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Forget Password?',
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Reset Now',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              defaultButton(
                  text: 'login',
                  function: () {
                    if (_formkey.currentState.validate()) {
                      print(phoneController.text);
                      print(passwordController.text);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => companyRecipts()));
                    }
                  }),
              SizedBox(
                height: 50,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.fingerprint),
                iconSize: 60,
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => termsAndPoliceis()));
                    },
                    child: Text(
                      'Register Now',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
