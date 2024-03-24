import 'package:flutter/services.dart';

class SubMain {
  static Future initServices() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // Init any controllers or APIs here
    // E.g firebase, or any controllers required to be alive before the app runs.
  }
}
