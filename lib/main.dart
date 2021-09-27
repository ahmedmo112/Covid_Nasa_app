// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:covid/classes/lang.dart';
import 'package:covid/module/covid%20check/question_screen.dart';
import 'package:covid/module/home/home_screen.dart';
import 'package:covid/module/info/info_screen.dart';
import 'package:covid/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localization/localization.dart';
import 'module/on_boarding/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _local = Locale('en', 'US');

   setLocale(Locale locale) {
    setState(() {
      _local = locale;
      len = locale;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: kBodyTextColor),
          )),
          locale: _local,
      localizationsDelegates: [
       // AppLocalization.delegate,
       DemoLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('ar', 'EG'),
      ],
      home: OnboardingScreen(),
    );
  }
}
