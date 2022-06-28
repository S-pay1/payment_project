// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';
import 'CompanySignUp.dart';

class termsAndPoliceis extends StatefulWidget {
  @override
  State<termsAndPoliceis> createState() => _termsAndPoliceisState();
}

class _termsAndPoliceisState extends State<termsAndPoliceis> {
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
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                    width: 400,
                    height: 210,
                    child: Text(
                        " The application provides the service of paying electricity, water, gas, landline and charging bills for mobile phones at any time and anywhere through the application within the Arab Republic of Egypt. \n S-PAY provides easy, simple and secure payment services 24 hours a day  ",
                        style: TextStyle(fontSize: 20)),
                    decoration: BoxDecoration(
                        //color: Colors.cyan[50],
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                SizedBox(
                  height: 30,
                ),
                Text(
                    " 1- Transferring money to the account is done every week on the company's account ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    )),
                SizedBox(
                  height: 30,
                ),
                Text(
                    " 2- The company must send their APIs to the S-PAY account ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    )),
                SizedBox(
                  height: 30,
                ),
                Text(
                    " 3- The company must write the commercial register and its tax card  ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    )),
                SizedBox(
                  height: 30,
                ),
                Text(
                    " 4- The company can know its bills by entering the application by obtaining the Email adreess and password after S-pay send their After 48hr  ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    )),
                SizedBox(
                  height: 30,
                ),
                Text(
                    " 5- The company must commit to me a fixed 2% rate on each payment",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    )),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 30,
                ),
                defaultButton(
                    text: 'Agree',
                    function: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompanySignUp()));
                    }),
              ],
            )),
      ),
    );
  }
}
