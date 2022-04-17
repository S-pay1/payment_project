// ignore_for_file: missing_required_param, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/home/homePageLayout.dart';

import 'package:flutter_application_1/modules/Service/cubit/service_cubit.dart';

import 'package:flutter_application_1/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../shared/global.dart';

class Service_Screen extends StatelessWidget {
  var pricenumber = TextEditingController();
  var text = TextEditingController();
  var number = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ServiceCubit(),
      child: BlocConsumer<ServiceCubit, ServiceState>(
        listener: (BuildContext context, state) {
          if (state is Servicesuccess) {
            if (state.model.status) {
              print(state.model.message);
              //print(state.model.data.token);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Homelayout()));
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
              title: Text(cubit.ChosseService[Global.indexOfServices]),
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
                        label: cubit.Servicecode[Global.indexOfServices]),
                    SizedBox(
                      height: 18,
                    ),
                    // DropdownButton(
                    //   items: cubit.ServicCompany[Global.indexOfServices]
                    //       .map((e) => DropdownMenuItem(
                    //             child: Text("$e"),
                    //             value:cubit.ServicCompany[Global.indexOfServices] ,
                    //           ))
                    //       .toList(),
                    //   onChanged: (val) {},
                    //   value: 'ezz',
                    // ),
                    defaultFormField(
                        controller: text,
                        type: TextInputType.text,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'Please chosse company';
                          }
                          return null;
                        },
                        label: cubit.ServicCompany[Global.indexOfServices]),
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
                              service_code: number.text,
                              price: pricenumber.text,
                            );
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
