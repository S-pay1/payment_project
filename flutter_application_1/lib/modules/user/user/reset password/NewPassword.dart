import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import '../../../../shared/components/components.dart';

import '../../../Otpss/cubit/otp_cubit.dart';
import '../login/login_screen.dart';

class NewPassword extends StatefulWidget {
  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  var code = TextEditingController();
  var emailadress = TextEditingController();
  var passwordController = TextEditingController();
  bool ispassword = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpCubit(),
      child: BlocConsumer<OtpCubit, OtpState>(
        listener: (context, state) {
          if (state is passwordUpdataSuccess) {
            if (state.remodel.status) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  icon: Icon(Icons.arrow_back)),
              title: Text(
                'New Password',
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
                        image: AssetImage("assets/images/6374585.jpg"),
                        height: 300.0,
                        width: 300.0,
                      ),
                      defaultFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        validate: (Value) {
                          if (Value.isEmpty) {
                            return 'Please Enter Your Password';
                          }
                          return null;
                        },
                        label: 'Password  ',
                        prefix: Icons.lock,
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
                        height: 30.0,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      defaultButton(
                          text: 'Send',
                          function: () {
                            if (_formKey.currentState.validate()) {
                              OtpCubit.get(context).resetPassword(
                                  password: passwordController.text);
                            }
                          }),
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
