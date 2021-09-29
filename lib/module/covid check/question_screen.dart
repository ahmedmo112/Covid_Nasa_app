import 'dart:async';

import 'package:covid/localization/localization_const.dart';
import 'package:covid/module/covid%20check/temp_screen.dart';
import 'package:covid/shared/componants/components.dart';
import 'package:covid/shared/constant.dart';
import 'package:covid/shared/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({ Key? key }) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
final controller = ScrollController();
  double offset = 0;
  bool isNext=false;
 
Future ans()async{
  y=0;
  c.forEach((element) {
    if (element == true) {
      y++;
    }

  });
  print(y);
 

    
  
   navigateTo(context, TempScreen());
   
     
       
 
     
}

  List<String> q =[
     'Fever',
   
     'Dry cough',
    
    'Tiredness', 
     
     'Lose of taste or smell',
     
     'Difficulty breathing or shortness of breath',

    
  ];

  List<String> qar=[
    "ارتفاع درجه الحرارة",
    "سعال",
    "الارهاق و التعب",
    "فقدان الشم و التذوق",
    "صعوبة او ضيق في التنفس",
  ];

  List<bool> c =[
    false,
    false,
    false,
    false,
    false,
  ];

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

  //  cList(context){
  //    = getTranslated(context, "a");
  // }

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            // ignore: prefer_const_constructors
            MyHeader2(
              textTop: getTranslated(context, "ws1"),
            ),
            ListView.separated(
              padding: EdgeInsets.zero,
              physics:const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox();
              },
              itemBuilder: (BuildContext context, int index) {
                return buildQuestion(
                  question: len == Locale('ar', 'EG')? qar[index]: q[index],
                  isChosen: c[index],index: index);
              },
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
                    
                    ans();
                    
                      //navigateTo(context, TempScreen());
                   
                    
                   },
                   child: Row(
                     mainAxisAlignment:MainAxisAlignment.center,
                     children: [
                       Text(getTranslated(context, "next").toString().toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),),
                       Icon(Icons.arrow_forward_ios,size: 18,)
                     ],
                   ),
                  ),
              )
              ),
             
             
            SizedBox(height: 40,),

            
            // buildQuestion(question: q[0],isChosen: false),
            // buildQuestion(question: q[1],isChosen: true),
            // buildQuestion(question: q[2],isChosen: false),
            // buildQuestion(question: q[3],isChosen: true),
            // buildQuestion(question: q[4],isChosen: true),
            // buildQuestion(question: q[5],isChosen: false),
            //CheckboxListTile(value: value, onChanged: onChanged)
          ]
        )
    )
    );
  }

  

Widget buildQuestion({
  required String question,
   required bool isChosen ,
   required int index ,
 //  required Function fun

}){
  bool? chosen ;
  
  return InkWell(

  onTap: (){

    setState(() {
      chosen=!isChosen;
      c[index] = chosen!;
    });
    
  },
  child:   Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),   
        side: BorderSide(
          color: isChosen? Colors.greenAccent.shade400: Colors.transparent
        )
      ),
      elevation: 10,
      child: Container(
       height: 65,
       padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Row(
          children: [
            Expanded(child: Text(question,style: TextStyle(fontWeight: FontWeight.w600),)),
            if(isChosen)
            Icon(Icons.check_circle_outline,color:Colors.greenAccent[400])
            
          ],
        ),
      )
    ),
  ),
);
}
}

class BuildQ extends StatefulWidget {
   String? question;
   bool? isChosen;
   BuildQ({ Key? key,required this.question,required this.isChosen }) : super(key: key);

  @override
  _BuildQState createState() => _BuildQState();
}

class _BuildQState extends State<BuildQ> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
  onTap: (){
    widget.isChosen = !widget.isChosen!;
  },
  child:   Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        
        side: BorderSide(
          color: widget.isChosen! ? Colors.greenAccent.shade400: Colors.transparent
        )
      ),
      elevation: 10,
      child: Container(
       height: 50,
       padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Row(
          children: [
            Expanded(child: Text(widget.question!)),
            if(widget.isChosen!)
            Icon(Icons.check_circle_outline,color:Colors.greenAccent[400])           
          ],
        ),
      )
    ),
  ),
);
  }
}