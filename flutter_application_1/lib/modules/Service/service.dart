// ignore_for_file: missing_required_param, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/home/homePageLayout.dart';

import 'package:flutter_application_1/modules/Service/cubit/service_cubit.dart';
import 'package:flutter_application_1/modules/payment/Payment.dart';

import 'package:flutter_application_1/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../shared/global.dart';

class Service_Screen extends StatefulWidget {
  @override
  State<Service_Screen> createState() => _Service_ScreenState();
}

class _Service_ScreenState extends State<Service_Screen> {
  var pricenumber = TextEditingController();

  var text = TextEditingController();

  var number = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String selectedItemValue = '';

  List itemsOfDropDown = [
    'ezz',
    'hesham',
    'youssef',
    'mo\'men',
    'yehya',
    'l',
    'g',
    't',
    'm',
    'y',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ServiceCubit(),
      child: BlocConsumer<ServiceCubit, ServiceState>(
        listener: (BuildContext context, state) {
          if (state is Servicesuccess) {
            if (state.model.status) {
              var client_id = Gloablvar.id;
              Gloablvar.feeds = state.model.data.feeds;
              Gloablvar.price = state.model.data.price;
              Gloablvar.service_code = state.model.data.service_code;
              Gloablvar.total = state.model.data.total;
              Gloablvar.date = state.model.data.date;
              print(state.model.data.feeds);

              print(state.model.message);
              //print(state.model.data.token);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Payment()));
            } else {
              print(state.model.message);
              Fluttertoast.showToast(
                msg: state.model.message,
                backgroundColor: Colors.red,
                fontSize: 16,
                gravity: ToastGravity.BOTTOM,
              );
            }
          }
        },
        builder: (context, state) {
          var cubit = ServiceCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (context) => Homelayout()));
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
              title:
                  Text(cubit.ChosseService[Global.indexOfServices].toString()),
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
                          return null;
                        },
                        label: cubit.Servicecode[Global.indexOfServices]
                            .toString()),
                    SizedBox(
                      height: 18,
                    ),
                    DropdownButtonFormField(
                      hint: Text('Select Company'),
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      menuMaxHeight: 250,
                      // enableFeedback: true,
                      items: itemsOfDropDown
                          .map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedItemValue = value;
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
                        return null;
                      },
                      label: 'price',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultButton(
                        text: 'pay',
                        function: () {
                          if (_formKey.currentState.validate()) {
                            ServiceCubit.get(context).userService(
                              // phone: phoneController.text,
                              // password: passwordController.text
                              service_code: int.parse(number.text),
                              price: int.parse(pricenumber.text),
                              // company_id: text.text,
                              client_id: Gloablvar.id,
                            );
                            print(Gloablvar.feeds);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Payment()));
                          }
                        }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
