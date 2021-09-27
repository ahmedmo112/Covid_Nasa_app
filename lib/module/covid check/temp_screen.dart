import 'package:covid/module/result/result_screen.dart';
import 'package:covid/shared/componants/components.dart';
import 'package:covid/shared/constant.dart';
import 'package:covid/shared/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class TempScreen extends StatefulWidget {
  const TempScreen({Key? key}) : super(key: key);

  @override
  _TempScreenState createState() => _TempScreenState();
}

class _TempScreenState extends State<TempScreen> {
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
  double t =37.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        elevation: 0,

      ),
        body: SingleChildScrollView(
            controller: controller,
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  // ignore: prefer_const_constructors
                  MyHeader2(
                    textTop: "What is your temperature?",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 250,
                    width: double.infinity,
                    child: SleekCircularSlider(
                        min: 30,
                        max: 45,
                        initialValue: 37,
                        appearance: CircularSliderAppearance(
                          spinnerDuration: 2000,
                          infoProperties: InfoProperties(
                              mainLabelStyle: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold),
                              modifier: (value) {
                                final roundedValue = value.toStringAsFixed(1);
                                return '$roundedValue °';
                              }),
                          customColors: CustomSliderColors(
                            shadowColor: Colors.deepOrange,
                            progressBarColors: [
                              Colors.red,
                              Colors.deepOrange,
                              Colors.orange,
                              Colors.amber,
                              Colors.yellow,
                              //               Colors.blue.shade300,
                              // Color(0xFF11249F),
                            ],
                            trackColor: Colors.deepOrange.withOpacity(0.3),
                          ),
                        ),
                        onChange: (double value) {
                          t = value;
                          //print(value);
                        }),
                  ),
                   SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Center(
                child: MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.blue,
                  height: 50,
                  textColor: Colors.white,
                  onPressed: () { 
                    
                   
                     tmp = t;
                   
                    print(tmp.toStringAsFixed(1));
                      //navigateAndFinish(context, ResultScreen());
                      navigateTo(context, ResultScreen());
                   
                    
                   },
                   child: Row(
                     mainAxisAlignment:MainAxisAlignment.center,
                     children: [
                       Text("Get the result".toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),),
                       Icon(Icons.arrow_forward_ios,size: 18,)
                     ],
                   ),
                  ),
              )
              ),
            SizedBox(height: 40,),
                ])));
  }
}
