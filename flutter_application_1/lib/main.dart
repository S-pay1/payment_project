import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/layout/intro.dart';

import 'package:flutter_application_1/modules/company/company/cubit/company_cubit.dart';

import 'package:flutter_application_1/modules/history_screen/cubit/History_cubit.dart';

import 'package:flutter_application_1/shared/bloc_observer.dart';
import 'package:flutter_application_1/shared/cach_helper.dart';
import 'package:flutter_application_1/shared/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'shared/dio/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      DioHelper.init();
      await CacheHelper.init();
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => HistoryCubit()..HistoryData(),
        ),
        BlocProvider(
            create: (BuildContext context) =>
                CompanyCubit()..Historycompany(company_id: Gloablvar.id)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            foregroundColor: Color(0xff004B7d),
          ),
        ),
        home: Intro(),
      ),
    );
  }
}
