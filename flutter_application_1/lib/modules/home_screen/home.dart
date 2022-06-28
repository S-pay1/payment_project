// ignore_for_file: camel_case_types, must_be_immutable, missing_required_param, duplicate_ignore

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/modules/cubit/homecubit_cubit.dart';
import 'package:flutter_application_1/modules/cubit/homecubit_state.dart';
import 'package:flutter_application_1/modules/payment/about_us.dart';
import 'package:flutter_application_1/modules/payment/contact_us.dart';
import 'package:flutter_application_1/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../fingerprint/local_auth.dart';
import '../../shared/cach_helper.dart';

import '../choose type of user/choosetypeofuser.dart';

class home extends StatelessWidget {
  bool ispassword = true;
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomecubitCubit(),
      child: BlocConsumer<HomecubitCubit, HomecubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(children: [
            Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/pics1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Scaffold(
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    // ignore: missing_required_param
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/intro.jpeg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: Icon(Icons.chat),
                      title: Text("About us"),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => About_us()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.contacts),
                      title: Text("Contact Us"),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Contact_us()));
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.fingerprint,
                        color: Colors.black,
                      ),
                      title: Text("Enable FingerPrint"),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              'Finger Print',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            content: Text(
                              'Are you Sure You Want enable finger print in this app ?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () async {
                                  final isAuthenticated =
                                      await LocalAuthApi.authenticate();
                                  CacheHelper.saveDate(
                                      key: 'fingerPrint', value: true);
                                  CacheHelper.saveDate(
                                      key: 'dataForFingerPrint', value: true);

                                  if (kDebugMode) {
                                    print('saved success');
                                  }
                                  if (isAuthenticated != null) {
                                    Navigator.pop(context);
                                    if (kDebugMode) {
                                      print('done success');
                                    }
                                  }
                                },
                                child: Text(
                                  'OK',
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  CacheHelper.removeData(
                                    key: 'fingerPrint',
                                  );
                                  if (kDebugMode) {
                                    print('Deleted success');
                                  }
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Disable',
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text("logout"),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TypeOfUser()));
                      },
                    ),
                  ],
                ),
              ),
              extendBodyBehindAppBar: true,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),
                centerTitle: false,
                title: Text(
                  'S-PAY',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 190,
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          ServicesButton(
                            image: 'assets/images/gas.png',
                            text: 'gas',
                          ),
                          Spacer(),
                          ServicesButton(
                            image: 'assets/images/water.png',
                            text: 'water',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          ServicesButton(
                            // image: 'assets/images/image (7).png',
                            image: 'assets/images/electric.png',
                            text: 'Electronic',
                          ),
                          Spacer(),
                          ServicesButton(
                            image: 'assets/images/phone.png',
                            text: 'phone',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          ServicesButton(
                            image: 'assets/images/image (10).png',
                            text: 'landing',
                          ),
                          Spacer(),
                          ServicesButton(
                            image: 'assets/images/image (9).png',
                            text: 'wifi',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textserviceButton(text: 'other services')
                    ],
                  ),
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
