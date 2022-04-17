// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/payment/pay_with_wallet.dart';

import 'package:flutter_application_1/shared/components/components.dart';

class Payment extends StatefulWidget {
  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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
          'Payment',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                children: [Text('Date')],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text('25/11/2020'),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff003B75), width: 2),
                ),
                height: 50,
                width: 500,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [Text('Service name')],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text('gas'),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff003B75), width: 2),
                ),
                height: 50,
                width: 500,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [Text('price')],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text('100 EG'),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff003B75), width: 2),
                ),
                height: 50,
                width: 500,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [Text('Feeds')],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text('2 EG'),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff003B75), width: 2),
                ),
                height: 50,
                width: 500,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [Text('Total')],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text('102 EG'),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff003B75), width: 2),
                ),
                height: 50,
                width: 500,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20.0,
              ),
              defaultButton(
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Paywithwallet()));
                  },
                  text: 'pay'),
            ],
          ),
        ),
      ),
    );
  }
}
