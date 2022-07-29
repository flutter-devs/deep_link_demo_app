import 'package:flutter/material.dart';

class AppRoute {
  static Future nextPage(BuildContext context, Widget child) async {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => child));
  }

  static Future pop(BuildContext context, {dynamic result}) async {
    return Navigator.pop(context, result);
  }

  static Future pageReplace(BuildContext context, Widget child) async {
    return Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => child));
  }
}
