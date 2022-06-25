// ignore_for_file: unused_import, avoid_print, deprecated_member_use

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/choose%20type%20of%20user/choosetypeofuser.dart';
import 'package:flutter_application_1/modules/company/company/cubit/company_register_cubit.dart';
import 'package:flutter_application_1/modules/company/company/cubit/company_register_state.dart';
import 'package:flutter_application_1/modules/user/user/signup/cubit/register_cubit.dart';

import 'package:flutter_application_1/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/rejex.dart';

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
  var servicetype = TextEditingController();
  final rejexfullname = fullNameValidator;
  final emailrejex = EmailAdrresValidator;

  String dropdownvalue = 'Item 1';
  var items = [
    'gas',
    'water',
    'Electronic',
    'phone',
    'landing',
    'wifi',
    'other services',
  ];
  // var password = TextEditingController();
  bool ispassword = true;
  var _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompanySingUpCubit(),
      child: BlocConsumer<CompanySingUpCubit, CompanySingUpState>(
        // ignore: void_checks
        listener: (context, state) {
          if (state is CompanySingUpsuccess) {
            if (state.model.status) {
              print(state.model.message);
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
                                      builder: (context) => TypeOfUser()));
                            },
                            child: Text(
                              'ok',
                              style: TextStyle(fontSize: 20),
                            ))
                      ],
                    );
                  });
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => genrate()));
            } else {
              print(state.model.message);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
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
                          validate: rejexfullname),
                      SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                          controller: emailadress,
                          type: TextInputType.emailAddress,
                          label: 'email',
                          prefix: Icons.email_outlined,
                          validate: emailrejex),
                      SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                          length: 9,
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
                          length: 9,
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
                          length: 14,
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
                          length: 29,
                          controller: IBANnumber,
                          type: TextInputType.number,
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
                      DropdownButtonFormField(
                        hint: Text('Select Company'),
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                        menuMaxHeight: 250,
                        items: items.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            child: Text(value),
                            value: value,
                          );
                        }).toList(),
                        onChanged: (index) {
                          setState(() {
                            dropdownvalue = index;
                          });
                        },
                      ),
                      // defaultFormField(
                      //     controller: servicetype,
                      //     type: TextInputType.text,
                      //     label: 'Service',
                      //     prefix: Icons.lock,
                      //     validate: (String value) {
                      //       if (value.isEmpty) {
                      //         return 'Please Enter service';
                      //       }
                      //       return null;
                      //     }),
                      SizedBox(
                        height: 30,
                      ),
                      ConditionalBuilder(
                        condition: State is! CompanySingUploading,
                        builder: (context) => defaultButton(
                          text: 'submit',
                          function: () {
                            if (_formkey.currentState.validate()) {
                              CompanySingUpCubit.get(context).Companysignup(
                                bank_account: bankAccount.text,
                                name: username.text,
                                commercial: commercialNum.text,
                                email: emailadress.text,
                                tax_number: taxNumber.text,
                                personal_id: pirsonalID.text,
                                // Service: servicetype.text,
                                Service: dropdownvalue,
                              );
                            }
                            fallback:
                            (context) => CircularProgressIndicator();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
