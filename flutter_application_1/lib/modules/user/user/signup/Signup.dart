// ignore_for_file: missing_required_param, prefer_const_constructors, prefer_function_declarations_over_variables, avoid_print

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/Otpss/Otp.dart';

import 'package:flutter_application_1/shared/components/components.dart';
import 'package:flutter_application_1/shared/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                        controller: phoneController,
                        type: TextInputType.number,
                        label: 'Phone',
                        prefix: Icons.phone,
                        validate: rejexPhone,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // defaultFormField(
                      //   controller: passwordController,
                      //   type: TextInputType.visiblePassword,
                      //   suffix: RegisterCubit.get(context).suffix,
                      //   onSubmit: (value) {
                      //     if (_formKey.currentState.validate()) {
                      //       RegisterCubit.get(context).userRegister(
                      //         name: nameController.text,
                      //         phone: phoneController.text,
                      //         password: passwordController.text,
                      //       );
                      //     }
                      //   },
                      //   isPassword: RegisterCubit.get(context).isPassword,
                      //   suffixPressed: () {
                      //     RegisterCubit.get(context).changePasswordVisibility();
                      //   },
                      //   validate: (String value) {
                      //     if (value.isEmpty) {
                      //       return 'password is too short';
                      //     }
                      //   },
                      //   label: 'Password',
                      //   prefix: Icons.lock_outline,
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      ConditionalBuilder(
                        condition: state is! Registerloading,
                        builder: (context) => defaultButton(
                            text: 'Next',
                            function: () {
                              if (_formKey.currentState.validate()) {
                                Gloablvar.name = nameController.text;
                                Gloablvar.phone = phoneController.text;
                                // OtpCubit.get(context).model.data.id;
                                // RegisterModel.data.id;
                                // cubit.userOtpCheak.call(state.model.data.id)
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Otp()));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Genrate()));
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
