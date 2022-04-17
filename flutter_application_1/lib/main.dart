// ignore_for_file: unused_label, unused_import, duplicate_ignore, deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/modules/generate/paswword_generate.dart';
import 'package:flutter_application_1/shared/bloc_observer.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/user/user/signup/Signup.dart';
import 'shared/dio/dio_helper.dart';
import 'shared/styles/styles.dart';

Future<void> main() {
  BlocOverrides.runZoned(
    () {
      DioHelper.init();

      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.light,
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              foregroundColor: Color(0xff004B7d))),
      home: SignUp(),
    );
  }
}
