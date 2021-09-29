// ignore_for_file: prefer_const_constructors

import 'package:covid/localization/localization_const.dart';
import 'package:covid/module/info/info_screen.dart';
import 'package:covid/shared/componants/components.dart';
import 'package:covid/shared/constant.dart';
import 'package:covid/shared/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final controller = ScrollController();
  double offset = 0;
  bool isFacted = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fun();
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

  Widget? txt;
  String? whatIdo;
  void _fun() {
    if (0 <= y && y <= 1 && tmp >= 37) {
      txt = txtW(len == Locale('ar', 'EG')?"لست مصاب تماما":'Not really infected', Colors.green);
      whatIdo = len == Locale('ar', 'EG')?"اتخاذ الاجراءات الاحترازيه":' Take precautionary measures';
    } else if (y >= 2 && y <= 3 && tmp >= 37) {
      txt = txtW(len == Locale('ar', 'EG')?"احتماليه اصابه":'Might be infected', Colors.amber);
      whatIdo = len == Locale('ar', 'EG')?"زيارة اقرب مستشفي":' Visit the nearest hospital';
      isFacted =true;
    } else if (y >= 4 && y <= 5 && tmp >= 37) {
      txt = txtW(len == Locale('ar', 'EG')?"احتماليه كبيره ان تكون مصاب":'There is a high chance that you\'ll be infected', Colors.red);
      whatIdo = len == Locale('ar', 'EG')?"زيارة اقرب مستشفي":' Visit the nearest hospital';
      
      isFacted =true;

    }
  }

  Widget txtW(String text, Color color) => Text(
        text,
        textAlign: TextAlign.center,
        style:
            TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 20),
      );

  Widget hospital() => Card(
        margin: EdgeInsets.only(bottom: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(10),
          height: 100,
          child: Row(children: [
            Image.asset('assets/images/hospital.png', height: 70),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Text(getTranslated(context, "hospitalN"), style: kTitleTextstyle),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: defaultButton(function: () {}, text: getTranslated(context, "loc")),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      );

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
                MyHeader(
              image: "assets/icons/coronadr.svg",
              textTop: getTranslated(context, "result"),
              textBottom: '',
              offset: offset,
            ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(getTranslated(context, "rs"), style: kTitleTextstyle),
                      Center(child: txt),
                      SizedBox(height: 20),
                      Text(getTranslated(context, "mustDo"), style: kTitleTextstyle),
                      Text(whatIdo.toString(),
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600)),
                      SizedBox(height: 15),
                      if(isFacted)
                        hospital(),
                      if(isFacted)
                        hospital(),
                      if(isFacted)
                        hospital(),
                      if(isFacted)
                        SizedBox(height:15),
                      
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: staySafe(context),
                      ),

                      SizedBox(height: 20),

                      Text(getTranslated(context, "reminder"), style: kTitleTextstyle),

                      RemindCard(
                        title: getTranslated(context, "rem1"),
                        image: "assets/images/covid-test.png",
                      ),
                      RemindCard(
                        image: "assets/images/mask.png",
                        title: getTranslated(context, "rem2"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                       PreventCard(
                        text: getTranslated(context, "wearMask"),
                        image: "assets/images/wear_mask.png",
                        title: getTranslated(context, "wearMaskD"),
                      ),
                       PreventCard(
                        text:getTranslated(context, "washHands"),
                        image: "assets/images/wash_hands.png",
                        title: getTranslated(context, "washHandsD"),
                      ),
                    ],
                  ),
                ),
              ])),
    );
  }

  Widget staySafe(context) => GridView.count(
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        crossAxisCount: 2,
        padding: EdgeInsets.zero,
        //childAspectRatio: 0.5/0.5,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          gridItem('https://cdn-icons-png.flaticon.com/512/2750/2750657.png',
              getTranslated(context, "mea1")),
              gridItem('https://cdn-icons-png.flaticon.com/512/2750/2750670.png',
              getTranslated(context, "mea2")),
              gridItem('https://cdn-icons-png.flaticon.com/512/2750/2750786.png',
              getTranslated(context, "mea3")),
              gridItem('https://cdn-icons-png.flaticon.com/512/2750/2750806.png',
              getTranslated(context, "mea4")),
              
        ],
      );

  Widget gridItem(String url, String name) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Image.network(
              url,
              height: 50,
            ),
            Spacer(),
            Container(
                child: Text(name,
                textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                         height: 1,
                          fontSize: 12
                          )))
          ]),
        ),
      );
}
