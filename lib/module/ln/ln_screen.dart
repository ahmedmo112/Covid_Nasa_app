import 'package:covid/classes/lang.dart';
import 'package:covid/localization/localization_const.dart';
import 'package:covid/module/info/info_screen.dart';
import 'package:covid/shared/componants/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../main.dart';

class LNScreen extends StatefulWidget {
  const LNScreen({Key? key}) : super(key: key);


  @override
  _LNScreenState createState() => _LNScreenState();
}

class _LNScreenState extends State<LNScreen> {
  void _changeLanguage(String language) async {
    Locale _locale = locale(language);
    MyApp.setLocale(context, _locale);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/virus.png'))),
          width: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Select your language',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(
              height: 90,
            ),
            defaultButton(function: () {
              _changeLanguage(ARABIC);
              navigateAndFinish(context, InfoScreen());
            }, text: 'عربي', width: 150),
            SizedBox(
              height: 50,
            ),
            defaultButton(function: () {
              _changeLanguage(ENGLISH);
              navigateAndFinish(context, InfoScreen());

            }, text: 'English', width: 150),
            SizedBox(
              height: 50,
            ),
          ]),
        ),
      ),
    );
  }
}
