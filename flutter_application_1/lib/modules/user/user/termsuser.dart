// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/user/user/signup/Signup.dart';
import 'package:flutter_application_1/modules/user/user/term_Aruser.dart';

import '../../../shared/components/components.dart';

class termsUser extends StatefulWidget {
  @override
  State<termsUser> createState() => _termsUserState();
}

class _termsUserState extends State<termsUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => usertermAr()));
                },
                child: Text(
                  'AR',
                  style: TextStyle(color: Colors.blue[800]),
                ))
          ],
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          title: Text(
            'Terms and Policies  ',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Container(
                    width: 400,
                    height: 180,
                    child: Text(
                        "  The service procedures are an integral part of the terms and conditions. By registering to use the Service, you agree to follow the Service Procedures, use the Service only for bona fide purposes that are lawful and permitted by the Terms and policies  ",
                        style: TextStyle(fontSize: 20)),
                    decoration: BoxDecoration(
                        //color: Colors.cyan[50],
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Service charges: S-Pay sets the service charges for each transaction, provided that you add these charges to the total amount to be paid and then deduct the total amount. S-Pay provides a notification of the total amount after adding the service charges before each transaction so that you can accept or reject To complete the payment process ,and by agreeing to complete the process, this is your approval to deduct the service expenses in addition to the amount to be paid from your account.",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "paid from your Reasons for a payment error:",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff003B75),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "1- If the balance is insufficient to complete the payment process, and this is not due to our fault",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "2-If the payment exceeds the available credit limit",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "3-Non-compliance with the terms and conditions of use, including service procedures",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  defaultButton(
                      text: 'Agree',
                      function: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      })
                ]))));
  }
}
