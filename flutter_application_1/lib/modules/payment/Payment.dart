// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/payment/pay_with_wallet.dart';

import 'package:flutter_application_1/shared/components/components.dart';
import 'package:flutter_application_1/shared/global.dart';

class Payment extends StatefulWidget {
  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    var feed = Gloablvar.feeds;

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
                children: const [Text('Date')],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(Gloablvar.date ?? 'default value'),
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
                children: const [Text('Service name')],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(Gloablvar.dropdownitem),
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
                children: const [Text('price')],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(Gloablvar.price.toString() + ' EG'),
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
                children: const [Text('Feeds')],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(feed.toString() + ' EG'),
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
                children: const [Text('Total')],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(Gloablvar.total.toString() + '  EG'),
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
