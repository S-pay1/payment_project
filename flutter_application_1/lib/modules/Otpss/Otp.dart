// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/home/homePageLayout.dart';

import 'package:flutter_application_1/modules/user/user/signup/Signup.dart';

import 'package:flutter_application_1/shared/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../user/user/reset password/NewPassword.dart';
import 'cubit/otp_cubit.dart';

class Otp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    var OTPcontroller = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => OtpCubit(),
      child: BlocConsumer<OtpCubit, OtpState>(
        // ignore: void_checks
        listener: (context, state) {
          if (state is Otpsuccess) {
            if (kDebugMode) {
              print(Gloablvar.id);
            }
            if (state.model.status) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Success created account'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homelayout()));
                          },
                          child: Text(
                            'ok',
                            style: TextStyle(color: Colors.blue, fontSize: 18),
                          ),
                        )
                      ],
                    );
                  });
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('error'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'ok',
                            style: TextStyle(color: Colors.blue, fontSize: 18),
                          ),
                        )
                      ],
                    );
                  });
            }
          }
        },

        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  icon: Icon(Icons.arrow_back)),
              title: Text('OTP Verification'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Verification',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Enter your OTP code number",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Image(
                        image: AssetImage("assets/images/2942004.jpg"),
                        height: 300.0,
                        width: 300.0,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      defaultFormField(
                          controller: OTPcontroller,
                          length: 4,
                          type: TextInputType.number,
                          label: 'otp',
                          prefix: Icons.phone,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your otp';
                            }

                            return null;
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      defaultButton(
                        function: () {
                          if (_formKey.currentState.validate()) {
                            if (Gloablvar.resetpasswordScreen == false) {
                              OtpCubit.get(context).userOtpCheak(
                                otp: OTPcontroller.text,
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Homelayout()));
                            } else {
                              Gloablvar.otp = OTPcontroller.text;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewPassword()));
                            }
                          }
                        },
                        text: 'verify',
                      ),
                      SizedBox(height: 5.0),
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
