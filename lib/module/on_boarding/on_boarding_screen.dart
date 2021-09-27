import 'package:covid/module/info/info_screen.dart';
import 'package:covid/module/ln/ln_screen.dart';
import 'package:covid/shared/componants/components.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class BoardingModel {
  final String? image;
  final String? title;
  // final String? body;

  BoardingModel({required this.image, required this.title, });
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [

    BoardingModel(
        image: 'assets/images/covid.png',
        title: 'Welcome',
        //body: 'On Board 1 Body'
        ),
    BoardingModel(
        image: 'assets/images/mask.png',
        title: 'Stay Safe',
       // body: 'On Board 2 Body'
        ),
    // BoardingModel(
    //     image: 'assets/images/virus.png',
    //     title: 'on Board 3 title',
    //     body: 'On Board 3 Body'),
  ];

  bool isLast = false;

  void submit() {
    
        navigateAndFinish(context, LNScreen());
      
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation:0.0,
        actions: [
          TextButton(
              onPressed: () {
                submit();
              },
              child: Text('SKIP'))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                    print('last');
                  } else {
                    print('not last');
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildOnBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.blue,
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 4,
                    spacing: 5.0,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      submit();
                    } else {
                      boardController.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            )
          ],
        ),
      ),
      
    );
  }

  Widget buildOnBoardingItem(BoardingModel model) =>
    Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Image(image: AssetImage('${model.image}'))),
          Text(
            '${model.title}',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          // Text(
          //   '${model.body}',
          //   style: TextStyle(
          //     fontSize: 14.0,
          //   ),
          // ),
          // SizedBox(
          //   height: 15.0,
         // )
        ],
      );
      
  
}
