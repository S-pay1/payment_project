// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/home/homePageLayout.dart';

class About_us extends StatefulWidget {
  @override
  State<About_us> createState() => _About_usState();
}

class _About_usState extends State<About_us> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Homelayout()));
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: const [
                Image(
                  image: AssetImage("assets/images/20944999.jpg"),
                  height: 300.0,
                  width: 300.0,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'An e-payment system is a way of making transactions or paying for goods and sevices through an electronic medium, without the use of checks or cash. it\'s also called an electronic payment system or online payment system .The electronic payment system has grown increasingly over the last decades due to the growing spreaad of internet-based banking and shopping. As the world',
                  style: TextStyle(
                      fontSize: 22, color: Color.fromARGB(255, 9, 73, 126)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
