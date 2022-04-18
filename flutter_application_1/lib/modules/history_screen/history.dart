// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => Historyview(),
              separatorBuilder: (context, index) => SizedBox(
                    height: 15,
                  ),
              itemCount: 25),
        )
        // Padding(
        //   padding: const EdgeInsets.all(20.0),
        //   child: Column(
        //     children: [
        //       Expanded(
        //         child: ListView.separated(
        //           scrollDirection: Axis.vertical,
        //           itemBuilder: (context, index) => Historyview(),
        //           separatorBuilder: (context, index) => SizedBox(
        //             height: 10,
        //           ),
        //           itemCount: 25,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        );
  }
}

Widget Historyview() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Text(
          'gas',
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
              child: Text('hdhdhd', maxLines: 1),
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
            Text('100 EG')
          ],
        ),
      ],
    );
