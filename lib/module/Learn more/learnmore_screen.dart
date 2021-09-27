// ignore_for_file: prefer_const_constructors

import 'dart:ui';

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
              widg: Image.asset("assets/images/covid.png",height: 150,),
              textTop: "",
              textBottom: '',
              
            ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      title('Why is it called coronavirus?'),
                      content(
                        "Coronaviruses are named for their appearance: “corona” means “crown.” The virus’s outer layers are covered with spike proteins that surround them like a crown."
                        ),              
                        SizedBox(height: 20,),
                        Image.network("https://cdn-icons-png.flaticon.com/512/2750/2750726.png",height: 90,),
                      title('How does the coronavirus spread?'),
                      content(
                        "As of now, researchers know that the coronavirus is spread through droplets and virus particles released into the air when an infected person breathes, talks, laughs, sings, coughs or sneezes. Larger droplets may fall to the ground in a few seconds, but tiny infectious particles can linger in the air and accumulate in indoor places, especially where many people are gathered and there is poor ventilation. This is why mask-wearing, hand hygiene and physical distancing are essential to preventing COVID-19."
                        ),              
                        SizedBox(height: 20,),
                        Image.network("https://cdn-icons-png.flaticon.com/512/2750/2750741.png",height: 90,),


                       title("How did the coronavirus start?"),
                      content(
                        "The first case of COVID-19 was reported Dec. 1, 2019, and the cause was a then-new coronavirus later named SARS-CoV-2. SARS-CoV-2 may have originated in an animal and changed (mutated) so it could cause illness in humans. In the past, several infectious disease outbreaks have been traced to viruses originating in birds, pigs, bats and other animals that mutated to become dangerous to humans. Research continues, and more study may reveal how and why the coronavirus evolved to cause pandemic disease."

                        ),
                      SizedBox(height: 20,),
                        Image.network("https://cdn-icons-png.flaticon.com/512/2750/2750813.png",height: 90,),

                      title("What is the incubation period for COVID-19?"),
                      content(
                        "Symptoms show up in people within two to 14 days of exposure to the virus. A person infected with the coronavirus is contagious to others for up to two days before symptoms appear, and they remain contagious to others for 10 to 20 days, depending upon their immune system and the severity of their illness. "
                        ),
                      SizedBox(height: 20,),
                      Image.network("https://cdn-icons-png.flaticon.com/512/2750/2750784.png",height: 90,),
                      title('What are symptoms of coronavirus?'),
                      content(
                        "COVID-19 symptoms include:\n\n-Cough\n-Fever or chills\n-Shortness of breath or difficulty breathing\n-Muscle or body aches\n-Sore throat\n-New loss of taste or smell\n-Diarrhea\n-Headache\n-New fatigue\n-Nausea or vomiting\n-Congestion or runny nose\n\nSome people infected with the coronavirus have mild COVID-19 illness, and others have no symptoms at all. In some cases, however, COVID-19 can lead to respiratory failure, lasting lung and heart muscle damage, nervous system problems, kidney failure or death.\nIf you have a fever or any of the symptoms listed above, call your doctor or a health care provider and explain your symptoms over the phone before going to the doctor’s office, urgent care facility or emergency room. Here are suggestions if you feel sick and are concerned you might have COVID-19.\nCALL 911 if you have a medical emergency such as severe shortness of breath or difficulty breathing."
                        ),              
                        SizedBox(height: 20,),
                        Image.network("https://cdn-icons-png.flaticon.com/512/2750/2750771.png",height: 90,),
                        title('Does COVID-19 cause death?'),
                      content(
                        "Yes, severe COVID-19 can be fatal. For updates of coronavirus infections, deaths and vaccinations worldwide, see the Coronavirus COVID-19 Global Cases map developed by the Johns Hopkins Center for Systems Science and Engineering."
                        ),              
                        SizedBox(height: 20,),



                    ],
                  ),
                ),
              ])),
    );
  }

  Widget title(String title)=> Text(title,
  style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,

  )
  );
  Widget content(String title)=> Text(title,
  style: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    
  )
  );
}

 

 
