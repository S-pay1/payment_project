// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/history_model/histoy_model.dart';
import 'package:flutter_application_1/modules/cubit/homecubit_cubit.dart';
import 'package:flutter_application_1/modules/history_screen/cubit/History_cubit.dart';
import 'package:flutter_application_1/modules/history_screen/cubit/History_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => HistoryCubit(),
    //   child: BlocConsumer<HistoryCubit, HistoryState>(
    //     listener: (context, state) {
    //       // if (state is Historysuccess) {
    //       //   if (state.model.status) {
    //       //     print(state.model.message);
    //       //   } else {
    //       //     print(state.model.message);
    //       //   }
    //       // }
    //     },
    //     builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: Color(0xff004B7d)),
        ),
        title: Text(
          'History',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ConditionalBuilder(
            condition:
                // State is! Historyloading != null,
                HomecubitCubit.get(context).model != null,
            builder: (context) => ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    Historyview(HomecubitCubit.get(context).model),
                separatorBuilder: (context, index) => SizedBox(
                      height: 15,
                    ),
                itemCount: 25),
            fallback: (context) => Center(child: CircularProgressIndicator())),
      ),
    );
  }
  //   ),
  // );
}
// }

Widget Historyview(HistoryModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Text(
          model.data.id,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
              child: Text(model.data.name, maxLines: 1),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: 7.0,
                height: 7.0,
                decoration:
                    BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
              ),
            ),
            Text(model.data.phone),
          ],
        ),
      ],
    );
