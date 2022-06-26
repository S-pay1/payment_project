// ignore_for_file: missing_required_param, prefer_const_constructors, prefer_function_declarations_over_variables, avoid_print, unnecessary_new

import 'dart:math';

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/Otpss/Otp.dart';

import 'package:flutter_application_1/shared/components/components.dart';
import 'package:flutter_application_1/shared/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../shared/rejex.dart';
import '../../../generate/paswword_generate.dart';
import '../login/login_screen.dart';
import 'cubit/register_cubit.dart';

class SignUp extends StatelessWidget {
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // var cubit = OtpCubit get(context) => BlocProvider.of(context)

  bool ispassword = true;
  // bool value = false;
  final rejexfullname = fullNameValidator;
  final rejexPhone = phoneNumberValidator;
  final regexEmail = EmailAdrresValidator;

  @override
  Widget build(BuildContext context) {
    //var cubit = OtpCubit.get(context);
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is Registersuccess) {
            if (state.model.status) {
              Gloablvar.name = state.model.data.name;
              Gloablvar.phone = state.model.data.phone;
              Gloablvar.Email = state.model.data.email;

              print(state.model.message);
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
                'SignUp ',
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
                  key: _formKey,
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage("assets/images/20943394.jpg"),
                        height: 250.0,
                        width: 250.0,
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      defaultFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          label: 'Full Name',
                          prefix: Icons.drive_file_rename_outline,
                          validate: rejexfullname),
                      SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          label: 'email',
                          prefix: Icons.email_outlined,
                          validate: regexEmail),
                      SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                        controller: phoneController,
                        type: TextInputType.number,
                        label: 'Phone',
                        prefix: Icons.phone,
                        validate: rejexPhone,
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      defaultFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        suffix: RegisterCubit.get(context).suffix,
                        onSubmit: (value) {},
                        isPassword: RegisterCubit.get(context).isPassword,
                        suffixPressed: () {
                          RegisterCubit.get(context).changePasswordVisibility();
                        },
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'password is required';
                          }
                        },
                        label: 'Password',
                        prefix: Icons.lock_outline,
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      FlutterPwValidator(
                        controller: passwordController,
                        minLength: 8,
                        uppercaseCharCount: 2,
                        numericCharCount: 2,
                        specialCharCount: 1,
                        normalCharCount: 1,
                        width: 350,
                        height: 150,
                        onSuccess: () {
                          print("MATCHED");
                          ScaffoldMessenger.of(context).showSnackBar(
                              new SnackBar(
                                  content: new Text("Password is matched")));
                        },
                        onFail: () {
                          print("NOT MATCHED");
                        },
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'need help to create password?',
                          ),
                          TextButton(
                            onPressed: () {
                              Gloablvar.name = nameController.text.isEmpty
                                  ? Fluttertoast.showToast(
                                      msg: 'name is required',
                                      backgroundColor: Colors.red,
                                      fontSize: 16,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 20)
                                  : nameController.text;
                              Gloablvar.phone = phoneController.text.isEmpty
                                  ? Fluttertoast.showToast(
                                      msg: 'email is required',
                                      backgroundColor: Colors.red,
                                      fontSize: 16,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 20)
                                  : phoneController.text;
                              Gloablvar.Email = emailController.text.isEmpty
                                  ? Fluttertoast.showToast(
                                      msg: 'Phone is required',
                                      backgroundColor: Colors.red,
                                      fontSize: 16,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 20)
                                  : emailController.text;
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Genrate()));
                            },
                            child: Text(
                              'we can help you',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),

                      ConditionalBuilder(
                        condition: state is! Registerloading,
                        builder: (context) => defaultButton(
                            text: 'sign up',
                            function: () {
                              if (_formKey.currentState.validate()) {
                                RegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  Email: emailController.text,
                                  password: passwordController.text,
                                );

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Otp()));
                              }
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'already have an account?',
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              'Login',
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
          );
        },
      ),
    );
  }
}
