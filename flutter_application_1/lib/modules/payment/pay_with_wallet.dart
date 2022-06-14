// ignore_for_file: missing_required_param, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/home/homePageLayout.dart';
import 'package:flutter_application_1/modules/Otpss/Otp.dart';
import 'package:flutter_application_1/modules/Service/cubit/paywallet_cubit.dart';
import 'package:flutter_application_1/modules/Service/cubit/paywallet_state.dart';
import 'package:flutter_application_1/modules/cubit/homecubit_cubit.dart';
import 'package:flutter_application_1/modules/cubit/homecubit_state.dart';

import 'package:flutter_application_1/shared/components/components.dart';
import 'package:flutter_application_1/shared/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Paywithwallet extends StatefulWidget {
  @override
  State<Paywithwallet> createState() => _PaywithwalletState();
}

class _PaywithwalletState extends State<Paywithwallet> {
  var phonecontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  get remote_Red_eye => null;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PayWalletCubit(),
      child: BlocConsumer<PayWalletCubit, PayWalletState>(
        listener: (context, state) {
          if (state is PayWalletsuccess) {
            if (state.model.status) {
              print(state.model.message);
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Success'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homelayout()));
                            // pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => SignUp()));
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
              print(state.model.message);
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
              leading:
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
              title: Text(
                'Pay with Wallet',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(
                            "assets/images/Wavy_Tech-31_Single-01.jpg"),
                        height: 300.0,
                        width: 300.0,
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      defaultFormField(
                          controller: passwordcontroller,
                          type: TextInputType.visiblePassword,
                          label: 'Password',
                          prefix: Icons.lock,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Please Enter code';
                            }
                          },
                          suffix: remote_Red_eye),
                      SizedBox(
                        height: 30.0,
                      ),
                      defaultButton(
                        function: () {
                          if (_formKey.currentState.validate()) {
                            PayWalletCubit.get(context)
                                .paywithpassword(passwordcontroller.text);
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Homelayout()));
                          }
                        },
                        text: 'pay',
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
