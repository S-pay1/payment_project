// ignore_for_file: camel_case_types, missing_required_param

import 'package:flutter/material.dart';

import '../shared/components/components.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
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
