// ignore_for_file: unnecessary_statements

import 'package:flutter/material.dart';

import '../../main.dart';

//! ////////////////////////////////////////////
void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);
//! ///////////////////////////////////////////

//  void _changeLanguage(Language language,context) async {
//     Locale _locale = await setLocale(language.languageCode);
//     MyApp.setLocale(context, _locale);
//   }

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = false,
  double radius = 3.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: 30.0,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isUpperCase ? text.toUpperCase() : text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Icon(Icons.arrow_forward_ios,size: 18,color: Colors.white,)
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(dynamic? val)? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  required String? Function(String? val)? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onChanged: (s) {
        onChange ?? () {};
      },
      onTap: () {
        onTap ?? () {};
      },
      validator: (value) {
        return validate!(value);
      },
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(prefix),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: () {
                    suffixPressed!();
                  },
                  icon: Icon(
                    suffix,
                  ),
                )
              : null,
          border: OutlineInputBorder()),
    );

// void showToast({
//   required String text,
//   required ToastStates state,
// }) =>
//     Fluttertoast.showToast(
//         msg: text,
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: chooseToastColor(state),
//         textColor: Colors.white,
//         fontSize: 16.0);

// enum ToastStates { SUCCESS, ERROR, WARNING }

// Color chooseToastColor(ToastStates state) {
//   Color color;

//   switch (state) {
//     case ToastStates.SUCCESS:
//       color = Colors.green;
//       break;
//     case ToastStates.ERROR:
//       color = Colors.red;
//       break;
//     case ToastStates.WARNING:
//       color = Colors.amber;
//       break;
//   }
//   return color;
// }










// Widget buildArticleItem(dynamic article, context) => InkWell(
//       onTap: () {
//         navigateTo(context, WebViewScreen(article['url']));
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           children: [
//             Container(
//               height: 120,
//               width: 120,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(
//                     image: NetworkImage('${article['urlToImage']}'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//             SizedBox(
//               width: 20.0,
//             ),
//             Expanded(
//               child: Container(
//                 height: 120.0,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,

//                   crossAxisAlignment: CrossAxisAlignment.start,

//                   // mainAxisSize: MainAxisSize.min,

//                   children: [
//                     Expanded(
//                       child: Text(
//                         '${article['title']}',
//                         maxLines: 3,
//                         overflow: TextOverflow.ellipsis,
//                         style: Theme.of(context).textTheme.bodyText1,
//                       ),
//                     ),
//                     Text(
//                       '${article['publishedAt']}',
//                       style: TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );

// Widget articleBuilder(list, context, {isSearch = false}) => 
//        list.length > 0?
//        ListView.separated(
//           physics: BouncingScrollPhysics(),
//           itemBuilder: (context, index) =>
//               buildArticleItem(list[index], context),
//           separatorBuilder: (context, index) => Padding(
//                 padding: const EdgeInsetsDirectional.only(start: 20),
//                 child: Container(
//                   width: double.infinity,
//                   height: 1,
//                   color: Colors.grey[300],
//                 ),
//               ),
//           itemCount: 
//           list.length
//           ):
//        isSearch
//           ? Container()
//           : Center(
//               child: CircularProgressIndicator(),
//             );
    
