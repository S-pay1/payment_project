// ignore_for_file: missing_required_param, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/components/components.dart';

class Account extends StatefulWidget {
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  var emailcontroller = TextEditingController();
  var locationcontroller = TextEditingController();

  get remote_Red_eye => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text(
          'My Account',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
            ),
            defaultFormField(
                controller: emailcontroller,
                label: 'First Name',
                prefix: Icons.verified_user),
            SizedBox(
              height: 20.0,
            ),
            defaultFormField(
                controller: emailcontroller,
                label: 'User Name',
                prefix: Icons.verified_user),
            SizedBox(
              height: 20.0,
            ),
            defaultFormField(
                controller: locationcontroller,
                label: 'Location',
                prefix: Icons.location_on),
          ],
        ),
      ),
    );
  }
}
