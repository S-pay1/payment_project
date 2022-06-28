// ignore_for_file: missing_required_param

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/home/homePageLayout.dart';
import 'package:flutter_application_1/modules/Otpss/otp_login.dart';
import 'package:flutter_application_1/modules/user/user/reset%20password/RsetPasswprd.dart';
import 'package:flutter_application_1/modules/user/user/termsuser.dart';
import 'package:flutter_application_1/shared/rejex.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../fingerprint/local_auth.dart';
import '../../../../shared/cach_helper.dart';
import '../../../../shared/components/components.dart';
import '../../../../shared/global.dart';
import 'cubit/Login_cubit.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    final rejexPhone = phoneNumberValidator;
    var passwordController = TextEditingController();

    return BlocProvider(
        create: (BuildContext context) => loginCubit(),
        child: BlocConsumer<loginCubit, loginState>(
          listener: (context, state) {
            if (state is loginsuccess) {
              if (state.model.status) {
                Gloablvar.id = state.model.data.id;
                Gloablvar.name = state.model.data.name;
                Gloablvar.phone = state.model.data.phone;
                if (kDebugMode) {
                  print(state.model.message);
                }
                if (kDebugMode) {
                  print(Gloablvar.id);
                }
              } else {
                if (kDebugMode) {
                  print(state.model.message);
                }
                Fluttertoast.showToast(
                    msg: state.model.message,
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
                title: Text(
                  'Personal Login ',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(
                                "assets/images/Mobilelogin-rafiki.png"),
                            height: 250.0,
                            width: 250.0,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          defaultFormField(
                            controller: phoneController,
                            type: TextInputType.number,
                            label: 'phone',
                            prefix: Icons.phone,
                            validate: rejexPhone,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          defaultFormField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            suffix: loginCubit.get(context).suffix,
                            onSubmit: (value) {
                              if (_formKey.currentState.validate()) {
                                loginCubit.get(context).userlogin(
                                      phone: phoneController.text,
                                      password: passwordController.text,
                                    );
                              }
                            },
                            isPassword: loginCubit.get(context).isPassword,
                            suffixPressed: () {
                              loginCubit
                                  .get(context)
                                  .changePasswordVisibility();
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Forget Password?',
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ResetPassword()));
                                },
                                child: Text(
                                  'Reset Now',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ConditionalBuilder(
                            condition: state is! loginloading,
                            builder: (context) => defaultButton(
                              text: 'login',
                              function: () {
                                if (_formKey.currentState.validate()) {
                                  loginCubit.get(context).userlogin(
                                      phone: phoneController.text,
                                      password: passwordController.text);

                                  // loginCubit.get(context).loginotp();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Otplogin()));
                                }
                              },
                            ),
                            fallback: (context) => CircularProgressIndicator(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CacheHelper.getData(key: 'fingerPrint') != null
                              ? IconButton(
                                  onPressed: () async {
                                    final isAuthenticated =
                                        await LocalAuthApi.authenticate();

                                    if (isAuthenticated) {
                                      var getsaveddatasuccess =
                                          CacheHelper.getData(
                                              key: 'dataForFingerPrint');
                                      if (kDebugMode) {
                                        print('datagetsuccess ' +
                                            getsaveddatasuccess.toString());
                                      }
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => Homelayout()),
                                      );
                                    }
                                  },
                                  icon: Icon(Icons.fingerprint),
                                  iconSize: 50,
                                )
                              : Text(''),
                          SizedBox(
                            height: 0.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?',
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => termsUser()));
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
