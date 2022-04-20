import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/components/components.dart';

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
  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              Image(
                image: AssetImage("assets/images/6374585.jpg"),
                height: 300.0,
                width: 300.0,
              ),
              defaultFormField(
                  controller: code,
                  type: TextInputType.number,
                  label: 'Your Code',
                  prefix: Icons.grid_view,
                  validate: (value) {
                    if (value.isEmbty) {
                      return 'Please Enter a Correct code';
                    }
                    return null;
                  }),
              SizedBox(
                height: 30,
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
              SizedBox(
                height: 30.0,
              ),
              defaultFormField(
                controller: passwordController,
                type: TextInputType.visiblePassword,
                validate: (Value) {
                  if (Value.isEmpty) {
                    return 'Enter Your Password Again';
                  }
                  return null;
                },
                label: 'Confirm  ',
                prefix: Icons.lock,
              ),
              SizedBox(
                height: 30.0,
              ),
              defaultButton(
                  text: 'Send',
                  function: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
