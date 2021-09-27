
// ignore_for_file: prefer_const_constructors

import 'package:covid/localization/localization_const.dart';
import 'package:covid/module/Learn%20more/learnmore_screen.dart';
import 'package:covid/module/covid%20check/question_screen.dart';
import 'package:covid/module/home/home_screen.dart';
import 'package:covid/shared/componants/components.dart';
import 'package:covid/shared/constant.dart';
import 'package:covid/shared/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              image: "assets/icons/coronadr.svg",
              textTop: getTranslated(context, "infoscreenheadertop"),
              textBottom: getTranslated(context, "infoscreenheaderbottom"),
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Text(
                  //   "Welcome",
                  //   style: kTitleTextstyle.copyWith(
                  //     fontSize: 25
                  //   ),
                  // ),
                  // SizedBox(height: 20),
                  InfoCard(
                    image: "assets/images/fever.png",
                    title: getTranslated(context, "c1"),
                    buttonText: getTranslated(context, "checkNow"),
                    toScren: QuestionScreen(),
                  ),
                  InfoCard(
                    image: "assets/images/analisis.png",
                    title: getTranslated(context, "c2"),
                    buttonText: getTranslated(context, "checkNow"),
                    toScren: HomeScreen(),
                  ),
                  InfoCard(
                    image: "assets/images/covid.png",
                    title: getTranslated(context, "c3"),
                    buttonText: getTranslated(context, "checkNow"),
                    toScren: LMScreen(),
                  ),
                  RemindCard(
                    title: getTranslated(context, "rem1"),
                    image: "assets/images/covid-test.png",
                    ),
                  RemindCard(
                    image: "assets/images/mask.png",
                    title: getTranslated(context, "rem2"),),
                  SizedBox(height: 20),
                  Text(getTranslated(context, "prevention").toString(), style: kTitleTextstyle),
                  SizedBox(height: 20),
                  PreventCard(
                    text:getTranslated(context, "wearMask"),
                    image: "assets/images/wear_mask.png",
                    title: getTranslated(context, "wearMaskD"),
                  ),
                  PreventCard(
                    text:
                        getTranslated(context, "washHands"),
                    image: "assets/images/wash_hands.png",
                    title: getTranslated(context, "washHandsD"),
                  ),
                  SizedBox(height: 50),
                  //! ///////////////////////////////////////////////
            //       Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 80),
            //   child: Center(
            //     child: MaterialButton(
            //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            //       color: Colors.blue,
            //       height: 50,
            //       textColor: Colors.white,
            //       onPressed: () { 
            //         navigateTo(context, QuestionScreen());
            //        },
            //        child: Row(
            //          mainAxisAlignment:MainAxisAlignment.center,
            //          children: [
            //            Text("NEXT".toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),),
            //            Icon(Icons.arrow_forward_ios,size: 18,)
            //          ],
            //        ),
            //       ),
            //   )
            //   ),
            // SizedBox(height: 40,),
            //! ////////////////////////////////////////////////
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String? image;
  final String? title;
  final Widget? toScren;
  final String? buttonText;
  const InfoCard({ Key? key, this.image, this.title, this.toScren, this.buttonText }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Image.asset(image!, height: 90),
              Expanded(
                child: Column(
                  children: [
                    Container(
                     // width: 150,
                      //height: 50,
                      child: Text(
                        
                  title!,
                  maxLines: 2,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                    ),
                Container(
                  width: 160,
                  child: MaterialButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          color: Colors.blue,
                          height: 40,
                          
                          textColor: Colors.white,
                          onPressed: () { 
                            navigateTo(context, toScren!);
                           },
                           child: Row(
                             mainAxisAlignment:MainAxisAlignment.center,
                             children: [
                               Text(buttonText.toString().toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),),
                               Icon(Icons.arrow_forward_ios,size: 18,)
                             ],
                           ),
                          ),
                ),
                  ],
                ),
              )
          ],
          ),
        )
      ),
    );
  }
}


class RemindCard extends StatefulWidget {
  final String? image;
  final String? title;
  // final Widget? toScren;
  // final String? buttonText;
 // final bool? swt;
   RemindCard({ Key? key, this.title, this.image,  }) : super(key: key);

  @override
  State<RemindCard> createState() => _RemindCardState();
}

class _RemindCardState extends State<RemindCard> {
  bool swt =false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Image.asset(widget.image!, height: 60),
              SizedBox(width: 8,),
              Expanded(
                child: Container(
                 // width: 150,
                  //height: 50,
                  child: Text(
                    
                  widget.title!,
                  maxLines: 2,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ),
              ),
              Switch(
                value:swt,
                 onChanged: (value){
                   setState(() {
                    swt = value;
                   });
                 }
                 )
          ],
          ),
        )
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  final String? image;
  final String? title;
  final String ?text;
  const PreventCard({
    Key ?key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 160,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            Image.asset(image!),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 150,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      text!,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          title!,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: SvgPicture.asset("assets/icons/forward.svg"),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String? image;
  final String? title;
  final bool? isActive;
  const SymptomCard({
    Key? key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          // isActive!
          //     ? BoxShadow(
          //         offset: Offset(0, 10),
          //         blurRadius: 20,
          //         color: kActiveShadowColor,
          //       )
          //     : 
              BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 10,
                  color: kShadowColor,
                ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image!, height: 90),
          Text(
            title!,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}