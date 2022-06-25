// ignore_for_file: avoid_print

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/Otpss/Otp.dart';
import 'package:flutter_application_1/modules/generate/paswword_generate.dart';

import 'package:flutter_application_1/modules/user/user/signup/cubit/register_cubit.dart';
import 'package:flutter_application_1/shared/global.dart';
import 'package:flutter_application_1/shared/rejex.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../shared/components/components.dart';

class ResetPassword extends StatelessWidget {
  var phone = TextEditingController();
  var email = TextEditingController();
  var _formkey = GlobalKey<FormState>();
  final regexEmail = EmailAdrresValidator;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is Checksuccess) {
            if (state.remodel.status) {
              Fluttertoast.showToast(
                  msg: state.remodel.message,
                  backgroundColor: Colors.red,
                  fontSize: 16,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 40);
            } else {
              Fluttertoast.showToast(
                  msg: state.remodel.message,
                  backgroundColor: Colors.red,
                  fontSize: 16,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 20);
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
                'Reset Your Password',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage("assets/images/reset-password.png"),
                        height: 200.0,
                        width: 200.0,
                      ),
                      SizedBox(
                        height: 80.0,
                      ),
                      defaultFormField(
                          controller: email,
                          type: TextInputType.emailAddress,
                          label: 'Your Email',
                          prefix: Icons.email,
                          validate: regexEmail),
                      SizedBox(
                        height: 50,
                      ),
                      ConditionalBuilder(
                        condition: state is! Registerloading,
                        builder: (context) => defaultButton(
                            function: () {
                              if (_formkey.currentState.validate()) {
                                RegisterCubit.get(context)
                                    .SendOtp(email: email.text);
                                Gloablvar.Email = email.text;
                                print(Gloablvar.Email);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Otp()));
                              }
                            },
                            text: 'Send'),
                      )
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
