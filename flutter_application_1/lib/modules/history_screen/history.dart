// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/history_model/histoy_model.dart';
import 'package:flutter_application_1/modules/cubit/homecubit_cubit.dart';
import 'package:flutter_application_1/modules/cubit/homecubit_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomecubitCubit, HomecubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            // leading: IconButton(
            //   onPressed: () {},
            //   icon: Icon(Icons.arrow_back, color: Color(0xff004B7d)),
            // ),
            title: Text(
              'History',
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ConditionalBuilder(
              condition: State is! HomecubitBottomNav ||
                  HomecubitCubit.get(context).model.data == null,
              // HomecubitCubit.get(context).model != null,

              builder: (context) => ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    Historyview(HomecubitCubit.get(context).model),
                separatorBuilder: (context, index) => SizedBox(height: 20),
                itemCount: 1,
                // HomecubitCubit.get(context).model.data.payments.length,
              ),
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget Historyview(HistoryModel model) {
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
                    // model.data.payments.map((e) => e.date).toString(),
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
                Text(
                    // model.data.payments.map((e) => e.total).toString(),
                    e.total + ' EG' ?? 'null'),
              ],
            ),
            Divider(color: Colors.grey, thickness: 2)
          ],
        );
      },
    ).toList(),
  );
}
