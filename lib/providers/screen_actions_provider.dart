import 'dart:developer';

import 'package:flutter/services.dart';

class ScreenActionsProvider {
  static const _platform = MethodChannel('screen.actions');

  static Future<void> enableSecure() async {
    try {
      await _platform.invokeMethod('makeSecure');
    } on PlatformException catch (e) {
      log('error:${e.message}');
    }
  }

  static Future<void> disableSecure() async {
    try {
      await _platform.invokeMethod('disableSecure');
    } on PlatformException catch (e) {
      log('error:${e.message}');
    }
  }
}
