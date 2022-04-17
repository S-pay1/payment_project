// ignore_for_file: missing_required_param, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/Otpss/Otp.dart';

import 'package:flutter_application_1/shared/components/components.dart';

class Paywithwallet extends StatefulWidget {
  @override
  State<Paywithwallet> createState() => _PaywithwalletState();
}

class _PaywithwalletState extends State<Paywithwallet> {
  var phonecontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  get remote_Red_eye => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text(
          'Pay with Wallet',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: AssetImage("assets/images/Wavy_Tech-31_Single-01.jpg"),
                height: 300.0,
                width: 300.0,
              ),
              SizedBox(
                height: 50.0,
              ),
              defaultFormField(
                  controller: passwordcontroller,
                  type: TextInputType.visiblePassword,
                  label: 'Password',
                  prefix: Icons.lock,
                  suffix: remote_Red_eye),
              SizedBox(
                height: 30.0,
              ),
              defaultButton(
                function: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Otp()));
                },
                text: 'pay',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
