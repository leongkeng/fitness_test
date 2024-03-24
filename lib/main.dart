import 'package:fitness_app/sub_main.dart';
import 'package:flutter/cupertino.dart';

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// Running a loading or splash screen
  // runApp(const SplashScreen());
  /// Init or call any APIs required before the start of App
  await SubMain.initServices();
  runApp(const MyApp());
}