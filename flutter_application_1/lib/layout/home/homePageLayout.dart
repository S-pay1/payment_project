// ignore_for_file: file_names, unused_import, unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/history_model/histoy_model.dart';
import 'package:flutter_application_1/modules/cubit/homecubit_cubit.dart';
import 'package:flutter_application_1/modules/history_screen/cubit/History_cubit.dart';
import 'package:flutter_application_1/shared/dio/end_points.dart';
import 'package:flutter_application_1/shared/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../modules/cubit/homecubit_state.dart';

class Homelayout extends StatelessWidget {
  final Gloablvar registerAndWalletOtp;

  const Homelayout({this.registerAndWalletOtp});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //     create: (BuildContext context) => HistoryCubit()..HistoryData()),
        BlocProvider(create: (BuildContext context) => HomecubitCubit()),
        // create: (BuildContext context) => HomecubitCubit(),
      ],
      // ..HistoryData(),
      child: BlocConsumer<HomecubitCubit, HomecubitState>(
        listener: (BuildContext context, APPstate) {
          // ignore: todo
          // TODO: implement listener
        },
        builder: (BuildContext context, state) {
          var cubit = HomecubitCubit.get(context);

          return Scaffold(
            extendBodyBehindAppBar: true,
            /*appBar: AppBar(
              leading: IconButton(
                  onPressed: () {},
                  icon: Icon(HomecubitCubit.get(context) 
                      .iconTypes[cubit.currentIndex])),
              title: Text(
                HomecubitCubit.get(context).titles[cubit.currentIndex],
                style: TextStyle(color: Color(0xff003B75)),
              ),
            ),*/
            body: cubit.screens[cubit.currentindex],
            bottomNavigationBar: BottomNavigationBar(
              fixedColor: Color(0xff003B75),
              currentIndex: cubit.currentindex,
              onTap: (index) {
                cubit.changeindex(index);
              },
              // ignore: prefer_const_literals_to_create_immutables
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_wallet_sharp),
                  label: 'Wallet',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.receipt),
                  label: 'History',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
