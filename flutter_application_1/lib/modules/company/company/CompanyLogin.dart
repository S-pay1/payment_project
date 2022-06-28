// ignore_for_file: missing_required_param, file_names

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/company/company/cubit/company_cubit.dart';

import 'package:flutter_application_1/shared/components/components.dart';
import 'package:flutter_application_1/shared/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../shared/rejex.dart';
import 'companyRecipts.dart';
import 'termsAndPoliceis.dart';

class CompanyScreen extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailadress = TextEditingController();
    var passwordController = TextEditingController();
    var regexEmail = EmailAdrresValidator;
    return BlocProvider(
      create: (context) => CompanyCubit(),
      child: BlocConsumer<CompanyCubit, CompanyState>(
        listener: (context, state) {
          if (state is Companysuccess) {
            if (state.model.status) {
              Gloablvar.id = state.model.data.id;
              if (kDebugMode) {
                print(state.model.message);
              }
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => CompanyRecipts()));
            } else {
              if (kDebugMode) {
                print(state.model.message);
              }
              Fluttertoast.showToast(
                msg: state.model.message,
                backgroundColor: Colors.red,
                fontSize: 16,
                gravity: ToastGravity.BOTTOM,
              );
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
                      image: AssetImage(
                          "assets/images/Wavy_REst-03_Single-11.jpg"),
                      height: 200.0,
                      width: 200.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    defaultFormField(
                        controller: emailadress,
                        type: TextInputType.emailAddress,
                        label: 'email',
                        prefix: Icons.email_outlined,
                        validate: regexEmail),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      suffix: CompanyCubit.get(context).suffix,
                      onSubmit: (value) {
                        if (_formkey.currentState.validate()) {
                          CompanyCubit.get(context).Companylogin(
                            email: emailadress.text,
                            password: passwordController.text,
                          );
                        }
                      },
                      isPassword: CompanyCubit.get(context).isPassword,
                      suffixPressed: () {
                        CompanyCubit.get(context).changePasswordVisibility();
                      },
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'password is too short';
                        }
                      },
                      label: 'Password',
                      prefix: Icons.lock_outline,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ConditionalBuilder(
                      condition: state is! Companyloading,
                      builder: (context) => defaultButton(
                          text: 'login',
                          function: () {
                            if (_formkey.currentState.validate()) {
                              CompanyCubit.get(context).Companylogin(
                                email: emailadress.text,
                                password: passwordController.text,
                              );
                            }
                          }),
                      fallback: (context) => CircularProgressIndicator(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 30.0,
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
        },
      ),
    );
  }
}
