import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

showNotification(BuildContext context,
    {final String? message, final String title = 'Success'}) {
  Flushbar(
    title: title,
    message: message!,
    duration: Duration(seconds: 2),
    flushbarPosition: FlushbarPosition.TOP,
    margin: EdgeInsets.symmetric(horizontal: 8),
    borderRadius: BorderRadius.circular(8),
    backgroundColor: ColorConstants.black.withOpacity(0.6),
    blockBackgroundInteraction: false,
  ).show(context);
}
