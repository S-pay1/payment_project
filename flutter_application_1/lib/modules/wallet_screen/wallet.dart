import 'dart:math';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/modules/wallet_screen/cubit/wallet_cubit.dart';
import 'package:flutter_application_1/shared/components/components.dart';
import 'package:flutter_application_1/shared/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wallet extends StatefulWidget {
  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  String number = 'x';
  @override
  Widget build(BuildContext context) {
    String number = 'x';
    return BlocProvider(
      create: (ctx) => WalletCubit()..userwallet(),
      child: BlocBuilder<WalletCubit, WalletState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
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
                      ' ${Gloablvar.balance.toString()} EG ',
                      textAlign: TextAlign.center,
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
                    children: const [Text('Number of wallet')],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(Gloablvar.phone),
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
                    children: const [Text('Owner Name')],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(Gloablvar.name),
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
                    children: const [
                      Icon(Icons.star),
                      Text('to recharge go to atm')
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                      function: () {
                        setState(() {
                          number = Random().nextInt(9000).toString();
                        });
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('you code is : '),
                                content: Text(
                                  number,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'ok',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 18),
                                    ),
                                  )
                                ],
                              );
                            });
                      },
                      text: 'get code'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
