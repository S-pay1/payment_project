// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/Otpss/Otp.dart';
import 'package:flutter_application_1/modules/user/user/reset%20password/NewPassword.dart';
import 'package:flutter_application_1/modules/user/user/signup/cubit/register_cubit.dart';
import 'package:flutter_application_1/shared/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/components/components.dart';

class ResetPassword extends StatelessWidget {
  var phone = TextEditingController();
  var _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {},
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
                          controller: phone,
                          type: TextInputType.number,
                          label: 'Your Phone',
                          prefix: Icons.phone,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Please Enter a Correct Phone Number';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 50,
                      ),
                      defaultButton(
                          function: () {
                            if (_formkey.currentState.validate()) {
                              RegisterCubit.get(context)
                                  .CheakPassword(phone: phone.text);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Otp()));
                            }
                          },
                          text: 'Send')
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
