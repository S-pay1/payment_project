// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/home/homePageLayout.dart';
import '../../shared/components/components.dart';
import 'cubit/otp_cubit.dart';

class Otplogin extends StatelessWidget {
  const Otplogin({Key key}) : super(key: key);

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
            if (state.model.status) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Homelayout()));
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('error'),
                      actions: [
                        TextButton(
                          onPressed: () {},
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
                            OtpCubit.get(context)
                                .userOtpCheak(otp: OTPcontroller.text);
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
