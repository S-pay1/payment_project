import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/cubit/homecubit_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../modules/cubit/homecubit_state.dart';

class Homelayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => HomecubitCubit(),
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
                    icon: Icon(Icons.receipt), label: 'History'),
              ],
            ),
          );
        },
      ),
    );
  }
}
