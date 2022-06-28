// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/company/company/companylogin.dart';
import 'package:flutter_application_1/modules/user/user/login/login_screen.dart';

class TypeOfUser extends StatefulWidget {
  @override
  State<TypeOfUser> createState() => ChooseTypeOfUser();
}

class ChooseTypeOfUser extends State<TypeOfUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        // ),
        title: Text(
          'Choose Operator',
          style: TextStyle(
            color: Color(0xff003B75),
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
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
                            builder: (context) => CompanyScreen()));
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
