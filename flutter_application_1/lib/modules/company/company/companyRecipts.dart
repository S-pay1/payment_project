import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/components/components.dart';

class CompanyRecipts extends StatefulWidget {
  @override
  State<CompanyRecipts> createState() => _CompanyReciptsState();
}

class _CompanyReciptsState extends State<CompanyRecipts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          title: Text(
            'Company Recipts  ',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // ignore: prefer_const_literals_to_create_immutables
              Row(children: [
                Text(
                  'S-PAY',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Image(
                  image: AssetImage("assets/images/8432.jpg"),
                  height: 250.0,
                  width: 280.0,
                ),
              ]),
              SizedBox(
                height: 480,
              ),
              Container(
                  alignment: Alignment.bottomCenter,
                  child: defaultButton(
                      function: () {
                        /*Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => companyScreen()));*/
                      },
                      text: 'Logout')),
            ],
          ),
        )));
  }
}
