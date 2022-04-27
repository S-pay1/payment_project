// ignore_for_file: unused_import, prefer_const_constructors

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/cubit/homecubit_cubit.dart';
import 'package:flutter_application_1/modules/cubit/homecubit_state.dart';
import 'package:flutter_application_1/modules/wallet_screen/cubit/wallet_cubit.dart';
import 'package:flutter_application_1/shared/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: Color(0xff004B7d)),
        ),
        title: Text(
          'Wallet',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment(-0.05, 0.0),
                width: 89.0,
                height: 52.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                  border: Border.all(
                    width: 1.0,
                    color: const Color(0xFFA1A3A5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      offset: Offset(0, 3.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Text(
                  ' EG',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 20.0,
                    color: Color(0xff003B75),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              Row(
                children: [Text('Number of wallet')],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Gloablvar.phone'),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff003B75), width: 2),
                ),
                height: 50,
                width: 500,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [Text('Owner Name')],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(''),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff003B75), width: 2),
                ),
                height: 50,
                width: 500,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [Icon(Icons.star), Text('to recharge go to atm')],
              )
            ],
          ),
        ),
      ),
    );
  }
}
