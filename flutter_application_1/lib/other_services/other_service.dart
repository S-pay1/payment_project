import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/Service/cubit/service_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/service_model/get_service_model.dart';
import '../modules/payment/Payment.dart';
import '../shared/components/components.dart';
import '../shared/global.dart';

class other_service extends StatefulWidget {
  @override
  State<other_service> createState() => _other_serviceState();
}

class _other_serviceState extends State<other_service> {
  var pricenumber = TextEditingController();
  String dropdownValue = 'select company';

  var text = TextEditingController();

  var number = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  // var itemDropDown;

  @override
  Widget build(BuildContext context) {
    // var items = [
    //   'svul',
    //   'ham',
    //   'Item 3',
    //   'Item 4',
    //   'Item 5',
    // ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) => Homelayout()));
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('Other Services'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              defaultFormField(
                  controller: number,
                  type: TextInputType.number,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Please Enter code';
                    }
                  },
                  label: ('other_service')),
              SizedBox(
                height: 18,
              ),
              DropdownButtonFormField(
                hint: Text('Select Company'),
                decoration: InputDecoration(border: OutlineInputBorder()),
                menuMaxHeight: 250,
                // ignore: prefer_const_literals_to_create_immutables
                items: [
                  DropdownMenuItem(
                    child: Text('svul'),
                    value: 'svul',
                  ),
                  DropdownMenuItem(
                    child: Text('ham'),
                    value: 'ham',
                  ),
                  DropdownMenuItem(
                    child: Text('Item 3'),
                    value: 'Item 3',
                  ),
                  DropdownMenuItem(
                    child: Text('Item 4'),
                    value: 'Item 4',
                  ),
                  DropdownMenuItem(
                    child: Text('Item 5'),
                    value: 'Item 5',
                  ),
                ].toList(),
                onChanged: (index) {
                  setState(() {
                    dropdownValue = index;
                  });
                },
              ),
              // DropdownButtonFormField(
              //     value: dropdownValue,
              //     hint: Text('Select Company'),
              //     decoration: InputDecoration(border: OutlineInputBorder()),
              //     menuMaxHeight: 250,
              //     items: items.map((String items) {
              //       return DropdownMenuItem(
              //         value: items,
              //         child: Text(items),
              //       );
              //     }).toList(),
              //     onChanged: (String newValue) {
              //       setState(() {
              //         dropdownValue = newValue;
              //       });
              //     }),
              SizedBox(
                height: 18,
              ),
              defaultFormField(
                controller: pricenumber,
                type: TextInputType.number,
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'Please Enter price';
                  }
                },
                label: 'price',
              ),
              SizedBox(
                height: 18,
              ),
              defaultButton(function: () {}, text: 'pay'),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
