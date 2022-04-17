// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/choose%20type%20of%20user/ChooseTypeOfUser.dart';

import 'package:flutter_application_1/shared/components/components.dart';

class CompanySignUp extends StatefulWidget {
  @override
  State<CompanySignUp> createState() => _CompanySignUpState();
}

class _CompanySignUpState extends State<CompanySignUp> {
  @override
  var phoneController = TextEditingController();
  var emailadress = TextEditingController();
  var passwordController = TextEditingController();
  var username = TextEditingController();
  var commercialNum = TextEditingController();
  var taxNumber = TextEditingController();
  var bankAccount = TextEditingController();
  var pirsonalID = TextEditingController();
  var IBANnumber = TextEditingController();
  var password = TextEditingController();
  bool ispassword = true;
  var _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text(
          'Company SignUp ',
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
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                defaultFormField(
                    controller: username,
                    type: TextInputType.name,
                    label: 'Full Name',
                    prefix: Icons.person,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Name';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 15,
                ),
                defaultFormField(
                    controller: emailadress,
                    type: TextInputType.emailAddress,
                    label: 'email',
                    prefix: Icons.email_outlined,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your email';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 15,
                ),
                defaultFormField(
                    controller: commercialNum,
                    type: TextInputType.number,
                    label: 'commercial register',
                    prefix: Icons.library_books_outlined,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Please Enter correct commercial number';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 15,
                ),
                defaultFormField(
                    controller: taxNumber,
                    type: TextInputType.number,
                    label: 'Tax Card',
                    prefix: Icons.account_balance_wallet_outlined,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Please Enter correct commercial number';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 15,
                ),
                defaultFormField(
                    controller: bankAccount,
                    type: TextInputType.number,
                    label: 'bank Account',
                    prefix: Icons.credit_card,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Please Enter your bank account correct';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 15,
                ),
                defaultFormField(
                    controller: pirsonalID,
                    type: TextInputType.number,
                    label: 'personal ID',
                    prefix: Icons.perm_identity,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Please Enter correct ID';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 15,
                ),
                defaultFormField(
                    controller: IBANnumber,
                    type: TextInputType.emailAddress,
                    label: 'IBAN number',
                    prefix: Icons.perm_identity,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Please Enter correct IBAN number';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 15,
                ),
                defaultFormField(
                    controller: password,
                    type: TextInputType.visiblePassword,
                    label: 'Password',
                    prefix: Icons.lock,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Please Enter password atleast 8 numbers and characters';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 30,
                ),
                defaultButton(
                  text: 'submit',
                  function: () {
                    if (_formkey.currentState.validate()) {
                      print(username.text);
                      print(emailadress.text);
                      print(commercialNum.text);
                      print(taxNumber.text);
                      print(bankAccount.text);
                      print(pirsonalID.text);
                      print(IBANnumber.text);
                      print(password.text);

                      /* Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TypeOfUser()));*/
                      return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Great',
                                style: TextStyle(color: Colors.red),
                              ),
                              actions: [
                                FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    'You will get Access after reviewing the data on your account After 48hr',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TypeOfUser()));
                                    },
                                    child: Text(
                                      'ok',
                                      style: TextStyle(fontSize: 20),
                                    ))
                              ],
                            );
                          });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
