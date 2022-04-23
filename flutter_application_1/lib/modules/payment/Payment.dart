// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/cupertino.dart';
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
    print(feed);
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
                  child: Text(Gloablvar.date),
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
                  child:
                      Text(Gloablvar.itemsOfDropDown[Global.indexOfServices]),
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
                children: [Text('Feeds')],
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
                // ignore: prefer_const_literals_to_create_immutables
                children: [Text('Total')],
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
