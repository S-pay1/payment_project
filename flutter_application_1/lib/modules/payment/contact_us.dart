import 'package:flutter/material.dart';
import '../../layout/home/homePageLayout.dart';

class Contact_us extends StatefulWidget {
  @override
  State<Contact_us> createState() => _Contact_usState();
}

class _Contact_usState extends State<Contact_us> {
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
        title: Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'For Complaints,Please Contact Us',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900]),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Image(
                image: AssetImage("assets/images/5124556.jpg"),
                height: 300.0,
                width: 300.0,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  '11196',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
