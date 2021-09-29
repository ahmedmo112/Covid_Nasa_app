
import 'package:covid/module/info/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constant.dart';

class MyHeader extends StatefulWidget {
  final String? image;
  final String? textTop;
  final String? textBottom;
  final double? offset;
  final Widget? toScreen;
  const MyHeader(
      {Key? key, this.image, this.textTop, this.textBottom, this.offset, this.toScreen})
      : super(key: key);

  @override
  _MyHeaderState createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding:const EdgeInsets.only(left: 40, top: 50, right: 20),
        height: 350,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/virus.png"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          //  GestureDetector(
          //     onTap: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) {
          //             return widget.toScreen!;
          //           },
          //         ),
          //       );
          //     },
          //     child: Icon(Icons.keyboard_arrow_left_rounded,color: Colors.white),
          //   ),
           const SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: (widget.offset! < 0) ? 0 : widget.offset,
                    child: SvgPicture.asset(
                      widget.image.toString(),
                      width: 230,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Positioned(
                    top: 20 - widget.offset! / 2,
                    left: len == Locale('ar', 'EG')? 10: 140,
                    child: Container(
                      child: Text(
                        "${widget.textTop} \n${widget.textBottom}",
                        style: kHeadingTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 18.0

                        ),
                      ),
                    ),
                  ),
                  Container(), 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHeader2 extends StatefulWidget {
  //final String? image;
  final String? textTop;
  final String? textBottom;
  final Widget? widg;
 // final double? offset;
  const MyHeader2(
      {Key? key,
      // this.image,
        this.textTop, this.textBottom, this.widg, 
        //this.offset
        })
      : super(key: key);

  @override
  _MyHeader2State createState() => _MyHeader2State();
}

class _MyHeader2State extends State<MyHeader2> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding:const EdgeInsets.only(left: 40, top: 50, right: 20),
        height: 300,
        width: double.infinity,
        
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/virus.png"),
          ),
        ),
         child: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text(
                 "${widget.textTop} \n${widget.textBottom?? ''}",
                            style: kHeadingTextStyle.copyWith(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                            ),
               ),
                widget.widg??SizedBox(height: 0,)
             ],
           )
         )
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.end,
        //   children: <Widget>[
            
        //    const SizedBox(height: 20),
        //     Expanded(
        //       child: Stack(
        //         children: <Widget>[
        //           // Positioned(
        //           //   top: (widget.offset! < 0) ? 0 : widget.offset,
        //           //   child: SvgPicture.asset(
        //           //     widget.image.toString(),
        //           //     width: 230,
        //           //     fit: BoxFit.fitWidth,
        //           //     alignment: Alignment.topCenter,
        //           //   ),
        //           // ),
        //           Positioned(
        //             top: 20 - widget.offset! / 2,
                    
        //             child: Container(
        //               child: Text(
        //                 "${widget.textTop} \n${widget.textBottom}",
        //                 style: kHeadingTextStyle.copyWith(
        //                   color: Colors.white,
        //                   fontSize: 18
        //                 ),
        //               ),
        //             ),
        //           ),
        //           Container(), 
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
