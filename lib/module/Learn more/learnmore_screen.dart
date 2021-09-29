// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:covid/localization/localization_const.dart';
import 'package:covid/shared/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class LMScreen extends StatefulWidget {
  const LMScreen({Key? key}) : super(key: key);

  @override
  State<LMScreen> createState() => _LMScreenState();
}

class _LMScreenState extends State<LMScreen> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

// visit the nerst hospital
// take precautionary measures

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          controller: controller,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                // ignore: prefer_const_constructors
                MyHeader2(
                  widg: Image.asset(
                    "assets/images/covid.png",
                    height: 150,
                  ),
                  textTop: "",
                  textBottom: '',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title(getTranslated(context, "q1")),
                      content(getTranslated(context, "a1")),
                      SizedBox(
                        height: 20,
                      ),
                      Image.network(
                        "https://cdn-icons-png.flaticon.com/512/2750/2750726.png",
                        height: 90,
                      ),
                      title(getTranslated(context, "q2")),
                      content(getTranslated(context, "a2")),
                      SizedBox(
                        height: 20,
                      ),
                      Image.network(
                        "https://cdn-icons-png.flaticon.com/512/2750/2750741.png",
                        height: 90,
                      ),
                      title(getTranslated(context, "q3")),
                      content(getTranslated(context, "a3")),
                      SizedBox(
                        height: 20,
                      ),
                      Image.network(
                        "https://cdn-icons-png.flaticon.com/512/2750/2750813.png",
                        height: 90,
                      ),
                      title(getTranslated(context, "q4")),
                      content(getTranslated(context, "a4")),
                      SizedBox(
                        height: 20,
                      ),
                      Image.network(
                        "https://cdn-icons-png.flaticon.com/512/2750/2750784.png",
                        height: 90,
                      ),
                      title(getTranslated(context, "q5")),
                      content(getTranslated(context, "a5")),
                      SizedBox(
                        height: 20,
                      ),
                      Image.network(
                        "https://cdn-icons-png.flaticon.com/512/2750/2750771.png",
                        height: 90,
                      ),
                      title(getTranslated(context, "q6")),
                      content(getTranslated(context, "a6")),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ])),
    );
  }

  Widget title(String title) => Text(title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ));
  Widget content(String title) => Text(title,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ));
}
