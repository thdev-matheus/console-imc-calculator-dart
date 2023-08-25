import 'dart:async';

class Time {
  static Future<void> sleep(int seconds) async {
    await Future.delayed(Duration(seconds: seconds));
  }
}
