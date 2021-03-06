// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/history_model/histoy_model.dart';

import 'package:flutter_application_1/modules/history_screen/cubit/History_cubit.dart';
import 'package:flutter_application_1/modules/history_screen/cubit/History_state.dart';
import 'package:flutter_application_1/shared/components/constants.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => HistoryCubit()..HistoryData(),
      child: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'History',
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: state is Historyloading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.separated(
                      itemBuilder: ((context, index) =>
                          HistoryCubit.get(context).model.data.payments == null
                              ? SizedBox(
                                  // width: 200,
                                  height: 620,
                                  child: Center(
                                    child: Text(
                                      'No Payment Yet',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: DefaultColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ))
                              : Historyview(HistoryCubit.get(context).model)),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20),
                      itemCount: 1,
                    ),
            ),
          );
        },
      ),
    );
  }
}

Widget Historyview(HistoryModel model) {
  // if (model.data == null) {
  //   return Center(child: Text('No Payment Yet'));
  // } else {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: model.data.payments.map(
      (e) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              e.company_name ?? 'null',
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
                  child: Text(
                    e.date ?? 'null',
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: 7.0,
                    height: 7.0,
                    decoration: BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                  ),
                ),
                Text(e.total + ' EG' ?? 'null'),
              ],
            ),
            Divider(color: Colors.grey, thickness: 2)
          ],
        );
      },
    ).toList(),
  );
}
// }
