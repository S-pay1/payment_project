// ignore_for_file: missing_required_param, non_constant_identifier_names, camel_case_types

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/service_model/get_service_model.dart';

import 'package:flutter_application_1/modules/Service/cubit/service_cubit.dart';
import 'package:flutter_application_1/modules/payment/Payment.dart';

import 'package:flutter_application_1/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../shared/global.dart';
import '../../shared/rejex.dart';

class Service_Screen extends StatefulWidget {
  @override
  State<Service_Screen> createState() => _Service_ScreenState();
}

class _Service_ScreenState extends State<Service_Screen> {
  var pricenumber = TextEditingController();

  var pinnumber = TextEditingController();

  var text = TextEditingController();

  var number = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final priceregx = price;

  DataModel datamodel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ServiceCubit()..companyData(Gloablvar.itemsOfDropDown),
      child: BlocConsumer<ServiceCubit, ServiceState>(
        listener: (BuildContext context, state) {
          if (state is Servicesuccess) {
            if (state.model.status) {
              Gloablvar.Paymentid = state.model.data.id;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Payment(),
                ),
              );
            } else if (state is Serviceerror) {
              if (state.model.status) {
                Fluttertoast.showToast(
                  msg: 'not found try again',
                  backgroundColor: Colors.red,
                  fontSize: 16,
                  gravity: ToastGravity.BOTTOM,
                );
              }
            }
          }
        },
        builder: (context, state) {
          var cubit = ServiceCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
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
                      items: Gloablvar.itemsOfDropDown
                          .map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (index) {
                        setState(() {
                          Gloablvar.dropdownitem = index;
                        });
                      },
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    defaultFormField(
                      controller: pricenumber,
                      type: TextInputType.number,
                      validate: priceregx,
                      label: 'price',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if (Global.indexOfServices < 2)
                      defaultFormField(
                        controller: pinnumber,
                        type: TextInputType.number,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'Please Enter pin';
                          }
                        },
                        label: 'PIN',
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    ConditionalBuilder(
                      fallback: (context) => CircularProgressIndicator(),
                      condition: state is! Serviceloading,
                      builder: (context) => defaultButton(
                        text: 'pay',
                        function: () {
                          if (_formKey.currentState.validate()) {
                            ServiceCubit.get(context).userService(
                              service_code: number.text,
                              price: double.parse(pricenumber.text),
                              company_name: Gloablvar.dropdownitem.toString(),
                              client_id: Gloablvar.id,
                              pin: pinnumber.text,
                            );
                            ServiceCubit.get(context).RSApaymet(
                              service_code: number.text,
                              price: double.parse(pricenumber.text),
                              company_name: Gloablvar.dropdownitem.toString(),
                              client_id: Gloablvar.id,
                              pin: pinnumber.text,
                            );
                          }
                        },
                      ),
                    ),
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
