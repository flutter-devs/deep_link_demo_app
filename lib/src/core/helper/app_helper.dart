import 'package:flutter/material.dart';


class AppHelper {
  static void dismissKeyboard({
    required BuildContext ctx,
  }) {
    final currentFocus = FocusScope.of(ctx);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
