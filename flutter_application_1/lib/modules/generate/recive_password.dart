// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/home/homePageLayout.dart';
import 'package:flutter_application_1/modules/Otpss/Otp.dart';
import 'package:flutter_application_1/modules/user/user/signup/Signup.dart';
import 'package:flutter_application_1/modules/user/user/signup/cubit/register_cubit.dart';
import 'package:flutter_application_1/shared/components/components.dart';
import 'package:flutter_application_1/shared/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Recive extends StatelessWidget {
  const Recive({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is Registersuccess) {
            if (state.model.status) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Otp()));
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      children: [Text('Your passsword ')],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(Gloablvar.passwordgenerate),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff003B75), width: 2),
                      ),
                      height: 50,
                      width: 500,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    defaultButton(
                        function: () {
                          if (Gloablvar.resetpasswordScreen = false) {
                            RegisterCubit.get(context).userRegister();
                          } else {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Otp()));
                          }
                        },
                        text: 'use it')
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
