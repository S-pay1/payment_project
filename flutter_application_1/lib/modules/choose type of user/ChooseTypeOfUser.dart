// ignore_for_file: unnecessary_import, unused_import, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modules/user/user/login/login_screen.dart';
import '../../shared/styles/colors.dart';
import '../company/company/CompanyLogin.dart';

class TypeOfUser extends StatefulWidget {
  @override
  State<TypeOfUser> createState() => chooseTypeOfUser();
}

class chooseTypeOfUser extends State<TypeOfUser> {
  var phoneController = TextEditingController();
  var emailadress = TextEditingController();
  var passwordController = TextEditingController();
  var username = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                'Choose Operator',
                style: TextStyle(
                  color: Color(0xff003B75),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Ink.image(
                image: AssetImage("assets/images/Wavy_REst-03_Single-11.jpg"),
                fit: BoxFit.cover,
                width: 200,
                height: 200,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => companyScreen()));
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Company',
                    style: TextStyle(fontSize: 18, color: Color(0xff003B75)),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Ink.image(
                image: AssetImage("assets/images/Data_security_05.jpg"),
                fit: BoxFit.cover,
                width: 200,
                height: 200,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Personal',
                    style: TextStyle(fontSize: 18, color: Color(0xff003B75)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
