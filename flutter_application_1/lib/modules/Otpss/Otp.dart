// ignore_for_file: unused_element, missing_return, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/home/homePageLayout.dart';
import 'package:flutter_application_1/modules/generate/paswword_generate.dart';

import 'package:flutter_application_1/modules/home_screen/home.dart';
import 'package:flutter_application_1/modules/user/user/reset%20password/RsetPasswprd.dart';
import 'package:flutter_application_1/modules/user/user/signup/Signup.dart';
import 'package:flutter_application_1/modules/user/user/signup/cubit/register_cubit.dart';
import 'package:flutter_application_1/shared/cach_helper.dart';
import 'package:flutter_application_1/shared/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import 'cubit/otp_cubit.dart';

class Otp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var phoneController = TextEditingController();
    var OTPcontroller = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => OtpCubit(),
      child: BlocConsumer<OtpCubit, OtpState>(
        // ignore: void_checks
        listener: (context, state) {
          if (state is Otpsuccess) {
            print(Gloablvar.id);
            if (state.model.status) {
              if (Gloablvar.registerScreen) {
                CacheHelper.saveDate(
                        key: 'Homelayout', value: Gloablvar.registerScreen)
                    .then((value) => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Homelayout())));
              }
              if (Gloablvar.resetpasswordScreen) {
                CacheHelper.saveDate(
                        key: 'ResetPassword',
                        value: Gloablvar.resetpasswordScreen)
                    .then((value) => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Genrate())));
              }
              if (Gloablvar.walletScreen) {
                CacheHelper.saveDate(
                        key: 'Homelayout', value: Gloablvar.walletScreen)
                    .then((value) => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Homelayout())));
              }
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('error'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
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
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (context) => SignUp()));
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
                            OtpCubit.get(context).userOtpCheak(
                              otp: OTPcontroller.text,
                            );
                            getTherightotpPage(context);
                          }
                        },
                        text: 'verify',
                      ),
                      SizedBox(height: 5.0),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: Text(
                      //     'Click here to resend..',
                      //     style: TextStyle(
                      //       color: Colors.blue,
                      //     ),
                      //   ),
                      // ),
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

void getTherightotpPage(BuildContext ctx) {
  if (CacheHelper.getData(key: 'Homelayout')) {
    Navigator.push(ctx, MaterialPageRoute(builder: (context) => Homelayout()));
  }
  if (CacheHelper.getData(key: 'ResetPassword')) {
    Navigator.push(ctx, MaterialPageRoute(builder: (context) => Genrate()));
  }
  if (CacheHelper.getData(key: 'Homelayout')) {
    Navigator.push(ctx, MaterialPageRoute(builder: (context) => Homelayout()));
  }
}
